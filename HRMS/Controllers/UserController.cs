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

    }
}