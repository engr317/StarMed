using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StarMed.DATA.EF
{
    #region Applications Metadata
     public class ApplicationsMetadata
    {
        public int ApplicationId { get; set; }
        public int OpenPositionId { get; set; }
        public string UserId { get; set; }
        public System.DateTime ApplicationDate { get; set; }
        public string ManagerNotes { get; set; }
        public int ApplicationStatus { get; set; }
        public string ResumeFilename { get; set; }
    }

    #endregion
}
