﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoModel.ViewModel
{
    /// <summary>
    /// Qparams Model for Query String params
    /// </summary>
    public class Qparams
    {
        public long? LogId { get; set; }
        public long? Id { get; set; }
        public long? UserId { get; set; }
        public string UserType { get; set; }

        public long? Createdby { get; set; }
        public long? ReportingTo { get; set; }
        public int? IsActive { get; set; }

        public bool? IsProfile { get; set; }
        public bool? IsViewOnly { get; set; }
        public int? AccountStatus { get; set; }

        public int? VerificationStatus { get; set; }


        public bool? AddPermission { get; set; }

        public bool? BackRedirection { get; set; }

        public int? Status { get; set; }
        public string Code { get; set; }
    }
}
