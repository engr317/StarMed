using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace StarMed.UI.MVC.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage ="* Your Name is required.")]
        public string Name { get; set; }
        [Required(ErrorMessage = "* Your Email is required")]
        public string Email { get; set; }
        [Required(ErrorMessage = "* Your Subject is required")]
        public string Subject { get; set; }

        [UIHint("MultilineText")]
        [Required(ErrorMessage = "* Message is required")]
        public string Message { get; set; }
    }
}