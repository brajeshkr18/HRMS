using Demo.Core.EntityModel;
using HRMS.Model.Master;
using HRMS.ViewModel.Model.Users;
using System.Collections.Generic;

namespace TMS.Service.Master
{
    public interface IMasterService
    {

        Demo.Core.EntityModel.User GetDriverDetailById(long id);
    }
}
