using Demo.Core.EntityModel;
using ExpressMapper;
using HRMS.Model.Master;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;


namespace TMS.Service.Master
{
    public class MasterService : IMasterService
    {

        private OnBoadTaskEntities _Context = new OnBoadTaskEntities();

        #region Public_Methods
        /// <summary>
        /// Get all Countries
        /// </summary>
        /// <returns></returns>
        
        
        public Demo.Core.EntityModel.User GetDriverDetailById(long id)
        {
            return Mapper.Map(_Context.Users.Where(item => item.Id == id).FirstOrDefault(), new Demo.Core.EntityModel.User());
        }
        
        #endregion
    }
}
