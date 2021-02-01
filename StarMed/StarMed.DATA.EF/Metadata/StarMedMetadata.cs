using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace StarMed.DATA.EF
{
    #region Applications Metadata
    public class ApplicationsMetadata
    {

        public int ApplicationId { get; set; }

        [Display(Name = "Position: ")]
        [Required(ErrorMessage = "* Position is required")]
        public int OpenPositionId { get; set; }

        [Display(Name = "User: ")]
        [Required(ErrorMessage = "* User is required")]
        [StringLength(128, ErrorMessage = "* Accessory name must be 128 characters or less.")]
        public string UserId { get; set; }

        [Display(Name = "Application Created: ")]
        [Required(ErrorMessage = "* Date is required")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true, NullDisplayText = "[N/A]")]
        public System.DateTime ApplicationDate { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[N/A]")]        
        [StringLength(2000, ErrorMessage = "* Accessory name must be 2000 characters or less.")]
        public string ManagerNotes { get; set; }


        [Display(Name = "Application Status: ")]
        [Required(ErrorMessage = "* Status is required")]
        public int ApplicationStatus { get; set; }


        [Display(Name = "Resume File Name: ")]
        [Required(ErrorMessage = "* Name is required")]
        [StringLength(75, ErrorMessage = "* Accessory name must be 75 characters or less.")]
        public string ResumeFilename { get; set; }
    }
    [MetadataType(typeof(ApplicationsMetadata))]

    public partial class Application { }
    #endregion

    #region ApplicationStatuses Metadata
    public class ApplicationStatusesMetadata
    {

        public int ApplicationStatusId { get; set; }

        [Display(Name = "Status: ")]
        [Required(ErrorMessage = "* Status is required")]
        [StringLength(50, ErrorMessage = "* Accessory name must be 50 characters or less.")]
        public string StatusName { get; set; }


        [Display(Name = "Status Description: ")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(250, ErrorMessage = "* Accessory name must be 250 characters or less.")]
        public string StatusDescription { get; set; }
    }
    [MetadataType(typeof(ApplicationStatusesMetadata))]

    public partial class ApplicationStatus { }
    #endregion

    #region Locations Metadata
    public class LocationsMetadata
    {
        public int LocationId { get; set; }

        [Display(Name = "Store Number: ")]
        [Required(ErrorMessage = " * Store Number is Required.")]
        [StringLength(10, ErrorMessage = "* Store Number must be 10 characters or less.")]
        public string StoreNumber { get; set; }

        [Display(Name = "City: ")]
        [Required(ErrorMessage = "* City is a required field.")]
        [StringLength(50, ErrorMessage = "* City must be 50 characters or less.")]
        public string City { get; set; }

        [Display(Name = "State: ")]
        [Required(ErrorMessage = "* State is a required field.")]
        [StringLength(2, ErrorMessage = "* State must be 2 characters or less.")]
        public string State { get; set; }

        [Display(Name = "Manager: ")]
        [Required(ErrorMessage = "* Manager is a required field.")]
        [StringLength(128, ErrorMessage = "* Manager must be 128 characters or less.")]
        public string ManagerId { get; set; }
    }
    [MetadataType(typeof(LocationsMetadata))]
    public partial class Location { }
    #endregion

    #region OpenPositions Metadata
    public class OpenPositionsMetadata
    {

        public int OpenPositionId { get; set; }


        [Display(Name = "Position: ")]
        public int PositionId { get; set; }


        [Display(Name = "Location: ")]
        public int LocationId { get; set; }
    }
    [MetadataType(typeof(OpenPositionsMetadata))]

    public partial class OpenPosition { }
    #endregion

    #region Positions Metadata
    public class PositionsMetadata
    {

        public int PositionId { get; set; }

        [Display(Name = "Title: ")]
        [Required(ErrorMessage = "* Required Field")]
        [StringLength(50, ErrorMessage = "* Title must be 50 characters or less.")]
        public string Title { get; set; }

        [Display(Name = "Job Description: ")]
        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(1000, ErrorMessage = "* Description must be 1000 characters or less.")]
        public string JobDescription { get; set; }
    }
    [MetadataType(typeof(PositionsMetadata))]

    public partial class Position { }
    #endregion  

    #region UserDetails Metadata
    public class UserDetailsMetadata
    {

        public string UserId { get; set; }

        [Display(Name = "First Name: ")]
        [Required(ErrorMessage = "* Field is required")]
        [StringLength(50, ErrorMessage = "* Field must be 50 characters or less.")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name: ")]
        [Required(ErrorMessage = "* Field is required")]
        [StringLength(50, ErrorMessage = "* Field must be 50 characters or less.")]
        public string LastName { get; set; }

        [Display(Name = "Resume File Name: ")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(75, ErrorMessage = "* Field must be 75 characters or less.")]
        public string ResumeFilename { get; set; }
    }
    [MetadataType(typeof(UserDetailsMetadata))]

    public partial class UserDetail
    {
        [Display(Name = "Full Name: ")]
        public string FullName
        {
            get { return FirstName + " " + LastName; }
        }

    }
    #endregion
}
