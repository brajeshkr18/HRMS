using HRMS.Model.Master;
using HRMS.Model.Users;
using HRMS.Service.UserService;
using HRMS.Utility;
using HRMS.Web.Helper;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HRMS.Service.User;
using HRMS.ViewModel.Model.Users;
using HRMS.Utility.Helper;
using System.Collections;
using Newtonsoft.Json;
using System.IO;

namespace HRMS.Controllers
{

    public class UserController : Controller
    {
        IUserService _IUserService = new UserService();
        // GET: User
        [CustomActionFilter(ParamName = "data")]
        public ActionResult ManageUsers(string sortOrder, int? page, int? pageSize, string data, string search)
        {
            int pageDataSize = (pageSize ?? 10);
            int pageNumber = (page ?? 1);

            ViewBag.CurrentSort = sortOrder;
            ViewBag.PageSize = pageDataSize;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "CreatedOn_desc" : "";

            Qparams qparams = new Qparams();
            if (!string.IsNullOrWhiteSpace(data))
                qparams = Helper.DecryptParamData<Qparams>(data);
            qparams.UserType = AppConstant.RoleDriver;
            TempData.Remove("qparams");
            TempData["qparams"] = qparams;
            TempData.Keep("qparams");

            SearchingParams searchingParams = Helper.GetParamData<SearchingParams>(search);
                searchingParams.ReportingTo = Convert.ToInt64(UserAuthenticate.LogId);
            if (qparams.AccountStatus != null)
                searchingParams.AccountStatus = qparams.AccountStatus;

            searchingParams.UserTypeCode = string.Empty;
            searchingParams.LoggedUserTypeCode = UserAuthenticate.Role;

            if (!string.IsNullOrWhiteSpace(qparams.UserType))
            {
                //if (!string.IsNullOrWhiteSpace(qparams.UserType))
                //{
                //    searchingParams.UserTypeCode = qparams.UserType.Trim();
                //}
            }
            else
            {
                List<UserTypeViewModel> userTypes = GetUserTypes(qparams);
                ViewBag.UserTypes = userTypes;
                if (searchingParams.UserTypeId == null || searchingParams.UserTypeId?.Count == 0)
                    searchingParams.UserTypeId = userTypes.Select(item => item.Id).ToList();
            }


            var list = _IUserService.GetAllUsers(searchingParams).OrderBy(x => x.FullName).ToPagedList(pageNumber, pageDataSize);
            return Request.IsAjaxRequest() ? (ActionResult)PartialView("_Users", list) : View(list);
        }
        private List<UserTypeViewModel> GetUserTypes(Qparams qparams)
        {
            List<UserTypeViewModel> userTypes = new List<UserTypeViewModel>();

            string[] roles = null;
            if (!string.IsNullOrWhiteSpace(qparams.UserType))
            {
                userTypes = _IUserService.GetUserTypes().Where(item => item.Code == qparams.UserType).ToList();
            }
            else
            {
                if (UserAuthenticate.Role == AppConstant.RoleAdmin)
                {
                    roles = new string[] { AppConstant.RoleEmployee, AppConstant.RoleDriver };
                    userTypes = _IUserService.GetUserTypes().Where(item => roles.Contains(item.Code)).ToList();
                }
                else if (UserAuthenticate.Role == AppConstant.RoleEmployee)
                {
                    roles = new string[] { AppConstant.RoleDriver };
                    userTypes = _IUserService.GetUserTypes().Where(item => roles.Contains(item.Code)).ToList();
                }
                else
                {
                    userTypes = _IUserService.GetUserTypes().Where(item => item.Code == qparams.UserType).ToList();
                }
            }




            return userTypes;
        }
        [HttpGet]
        [CustomActionFilter(ParamName = "data")]
        public ActionResult UserDetails(string data)
        {
            
            Qparams qparams = new Qparams();
            DateTime From = DateTime.MinValue, To = DateTime.MinValue;
            if (!string.IsNullOrWhiteSpace(data))
                qparams = Helper.DecryptParamData<Qparams>(data);

            TempData.Remove("qparams");
            TempData["qparams"] = qparams;
            TempData.Keep("qparams");

            ViewBag.UserTypes = GetUserTypes(qparams);

            // GetDefaultData();

            if (qparams.Id != null)
            {
                UserViewModel userDetail = new UserViewModel();
                userDetail = _IUserService.GetUsersDetailsById((int)qparams.Id);
                userDetail.ConfirmEmail = userDetail.Email;
                userDetail.ConfirmPassword = userDetail.Password;
               
                return View(userDetail);
            }
            else
            {
                return View(new UserViewModel());
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateAntiForgeryToken]
        public ActionResult UserDetails([Bind(Exclude = "UserType")] UserViewModel user)
        {
            Qparams qparams = new Qparams();
            if (TempData["qparams"] != null)
            {
                qparams = TempData["qparams"] as Qparams;
                TempData.Keep("qparams");
            }

            TempData.Remove("result");
            var jsonData = SecurityHelper.Decrypt(System.Web.HttpContext.Current.Request.Cookies["ES"]["US"].ToString());
            Hashtable decryptedData = JsonConvert.DeserializeObject<Hashtable>(jsonData);
            qparams.UserType = decryptedData["UserType"].ToString();
            qparams.LogId = Convert.ToInt64(decryptedData["LogId"]);
            if (qparams.IsExternalDriver)
                user.UserTypeId = 9;
            bool resultStatus = false;
            string mailBody = string.Empty;

            ViewBag.UserTypes = GetUserTypes(qparams);

            if (user.ReportingTo == null)
            {
                user.ReportingTo = Convert.ToInt64(UserAuthenticate.LogId);
                ModelState.Remove("ReportingTo");
            }

            if (user.Id == 0)
            {
                ModelState.Remove("Id");
            }
            else
            {
                ModelState.Remove("Password");
                ModelState.Remove("ConfirmPassword");
            }

            if (_IUserService.IsUserExists(user.Email, user.Id.ToString()))
                ModelState.AddModelError("Email", "Email is already taken by someone.");


            if (ModelState.IsValid)
            {
                string responseMsg = string.Empty;

                MyJsonResult result;
                if (user.Id > 0)
                {
                    user.ModifiedBy = Convert.ToInt64(UserAuthenticate.LogId);
                    resultStatus = _IUserService.UpdateUsers(user);
                    responseMsg = "The driver information has been updated.";
                }
                else
                {
                    user.CreatedBy = Convert.ToInt64(UserAuthenticate.LogId);

                    //mailBody = HomeController.RenderPartialToString("_accountActivationTemplate", user, ControllerContext);
                    resultStatus = _IUserService.SaveUsers(user, Convert.ToInt64(UserAuthenticate.LogId), true, mailBody);
                    if (resultStatus)
                    {
                        // sending mail to user
                        mailBody = RenderPartialToString("_AccountCreatationNotify", user, ControllerContext);
                       // _IMasterService.SendAccountCreatationEmail("Driver Created", mailBody, user, Convert.ToInt64(UserAuthenticate.LogId));
                    }
                    responseMsg = "The driver account for " + user.FirstName + " " + user.LastName + " has been created.";
                }

                if (resultStatus)
                {
                    result = MyJsonResult.CreateSuccess(responseMsg);
                    TempData["result"] = result;
                    TempData.Keep("result");
                    if (user.UserTypeId == 9)
                    {
                        return RedirectToAction("ManageExternalDriver", "ExternalTrip", new { data = SecurityHelper.Encrypt(Newtonsoft.Json.JsonConvert.SerializeObject(qparams)) });
                    }
                    return RedirectToAction("ManageUsers", new { data = SecurityHelper.Encrypt(Newtonsoft.Json.JsonConvert.SerializeObject(qparams)) });

                }
                else
                {
                    result = MyJsonResult.CreateError(AppConstant.ErrorMessage);
                    TempData["result"] = result;
                    TempData.Keep("result");
                    return View(user);
                }
            }
            else
            {
                //GetAddressDefaultEditData(user.UserDetail);
                return View(user);
            }
        }

        public static string RenderPartialToString(string viewName, object model, ControllerContext ControllerContext)
        {
            if (string.IsNullOrEmpty(viewName))
                viewName = ControllerContext.RouteData.GetRequiredString("action");


            viewName = "~/Views/Shared/Email Templates/" + viewName + ".cshtml";
            ViewDataDictionary ViewData = new ViewDataDictionary();
            TempDataDictionary TempData = new TempDataDictionary();
            ViewData.Model = model;

            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                ViewContext viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);

                return sw.GetStringBuilder().ToString();
            }
        }


    }
}