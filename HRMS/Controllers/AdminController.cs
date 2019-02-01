using HRMS.Web.Helper;
using HRMS.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRMS.Controllers
{
    [CustomAuthorize]
    public class AdminController : Controller
    {
        // GET: Admin
       // MenuService menuService = new MenuService();
        public ActionResult Index()
        {
            return View();
        }
        //public ActionResult ManageWebsiteContent(int? pageSize, int? page)
        //{

        //    int pageDataSize = (pageSize ?? 10);
        //    int pageNumber = (page ?? 1);

        //    ViewBag.PageSize = pageDataSize;

        //    var list = menuService.GetAllSubMenu().ToPagedList(pageNumber, pageDataSize);
        //    return Request.IsAjaxRequest() ? (ActionResult)PartialView("_WebsiteContent", list) : View(list);

        //}
        //[HttpGet]
        //public ActionResult AddWebsiteContent(int data)
        //{
        //    SubMainMenuViewModel objSubMenu = new SubMainMenuViewModel();
        //    if (data != 0)
        //    {
        //        objSubMenu = menuService.GetSubMenuById((int)data);
        //        return View(objSubMenu);
        //    }
        //    else
        //    {
        //        return View();
        //    }
        //}
        //[HttpPost, ValidateInput(false)]
        //public ActionResult AddWebsiteContent(SubMainMenuViewModel ObjSubMenu)
        //{
        //    var result = menuService.UpdateSubMenuContent(ObjSubMenu);
        //    if (result)
        //    {
        //        return RedirectToAction("ManageWebsiteContent", new { });
        //    }
        //    return View();
        //}
        //public ActionResult ManageGallery(int? pageSize, int? page)
        //{

        //    int pageDataSize = (pageSize ?? 10);
        //    int pageNumber = (page ?? 1);

        //    ViewBag.PageSize = pageDataSize;

        //    var list = menuService.GetAllGallery().ToPagedList(pageNumber, pageDataSize);
        //    return Request.IsAjaxRequest() ? (ActionResult)PartialView("_Gallery", list) : View(list);

        //}
        //[HttpGet]
        //public ActionResult AddGallery(int data)
        //{
        //    ViewBag.AlbumData = menuService.GetAllAlbum().Where(x => x.IsActive == true);
        //    GalleryViewModel objGallery = new GalleryViewModel();
        //    if (data != 0)
        //    {
        //        objGallery = menuService.GetGalleryById((int)data);
        //        return View(objGallery);
        //    }
        //    else
        //    {
        //        return View();
        //    }
        //}
        //[HttpPost]
        //public ActionResult AddGallery(GalleryViewModel ObjGallery)
        //{
        //    bool result;
        //    if (ObjGallery.id == 0)
        //        result = menuService.SaveGallery(ObjGallery);
        //    else
        //        result = menuService.UpdateGallery(ObjGallery);
        //    if (result)
        //    {
        //        return RedirectToAction("ManageGallery", new { });
        //    }
        //    return View();
        //}
        //public ActionResult ManageAlbum(int? pageSize, int? page)
        //{

        //    int pageDataSize = (pageSize ?? 10);
        //    int pageNumber = (page ?? 1);
        //    ViewBag.PageSize = pageDataSize;
        //    var list = menuService.GetAllAlbum().ToPagedList(pageNumber, pageDataSize);
        //    return Request.IsAjaxRequest() ? (ActionResult)PartialView("_Album", list) : View(list);

        //}
        //[HttpGet]
        //public ActionResult AddAlbum(int data)
        //{
        //    AlbumViewModel ObjAlbum = new AlbumViewModel();
        //    if (data != 0)
        //    {
        //        ObjAlbum = menuService.GetAlbumById((int)data);
        //        return View(ObjAlbum);
        //    }
        //    else
        //    {
        //        return View();
        //    }
        //}
        //[HttpPost]
        //public ActionResult AddAlbum(AlbumViewModel ObjAlbum)
        //{
        //    bool result;
        //    if (ObjAlbum.id == 0)
        //        result = menuService.SaveAlbum(ObjAlbum);
        //    else
        //        result = menuService.UpdateAlbum(ObjAlbum);
        //    if (result)
        //    {
        //        return RedirectToAction("ManageAlbum", new { });
        //    }
        //    return View();
        //}
    }
}