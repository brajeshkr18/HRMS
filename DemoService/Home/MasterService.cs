using Demo.Core.EntityModel;
using DemoModel.ViewModel;
using ExpressMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;


namespace DemoService.MenuNamespace
{
    public class MasterService : IMasterService
    {

        private OnBoadTaskEntities _Context = new OnBoadTaskEntities();

        #region Public_Methods
        /// <summary>
        /// Get all Countries
        /// </summary>
        /// <returns></returns>
        public List<CourseViewModel> GetCountryList()
        {
            //_Context.Configuration.LazyLoadingEnabled = false;            
            var list = (from country in _Context.Courses.ToList()
                        select new CourseViewModel
                        {
                            //Id = country.Id,
                            //Shortname = country.Shortname,
                            //Name = country.Name,
                            //Phonecode = country.Phonecode
                        }).OrderBy(item => item.CourseName).ToList();
            return list;


        }

        /// <summary>
        /// Get Country by Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public CourseViewModel GetCountry(long id)
        {
            return Mapper.Map(_Context.Courses.Where(item => item.CourseID == id).FirstOrDefault(), new CourseViewModel());
        }
        #endregion
    }
}
