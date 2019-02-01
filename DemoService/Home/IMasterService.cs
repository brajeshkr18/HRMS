using HRMS.Core.EntityModel;
using HRMS.Model.Master;
using HRMS.ViewModel.Model.Users;
using System.Collections.Generic;

namespace HRMS.Service.Master
{
    public interface IMasterService
    {

        HRMS.Core.EntityModel.User GetDriverDetailById(long id);
    }
}
