using DemoModel.ViewModel;
using System.Collections.Generic;


namespace DemoService.MenuNamespace
{
    public interface IMasterService
    {
        /// <summary>
        /// Get all Countries
        /// </summary>
        /// <returns></returns>
        List<CourseViewModel> GetCountryList();

        /// <summary>
        /// Get Country by Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        CourseViewModel GetCountry(long id);

       
    }
}
