using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
//using MVCCRUDKnockout.Models;

namespace HRMS.Controllers
{
    public class HomeController : Controller
    {
        //private readonly TrialDBEntities _db = new TrialDBEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult services()
        {
            return View();
        }
        public ActionResult How()
        {
            return View();
        }
        public ActionResult Pricing()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult EmployerList()
        {
            return View();
        }
        public ActionResult EmployerDetails()
        {
            return View();
        }
        
        public ActionResult CandidatesList()
        {
            return View();
        }
        public ActionResult CandidateDetails()
        {
            return View();
        }
        
    }
}
