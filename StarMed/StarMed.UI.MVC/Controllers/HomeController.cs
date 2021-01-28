using System.Web.Mvc;
using StarMed.UI.MVC.Models;
using System.Net;
using System.Net.Mail;
using System;

namespace StarMed.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (ModelState.IsValid)
            {
                string body = $"{cvm.Name} has sent you the following message: <br />" + $"{cvm.Message} <strong>from the email address {cvm.Email}";

                MailMessage m = new MailMessage("you@yourdomain.com", "ToYourPersonalEmail.com", cvm.Subject, body);

                m.IsBodyHtml = true;

                m.Priority = MailPriority.High;

                m.ReplyToList.Add(cvm.Email);

                SmtpClient client = new SmtpClient("mail.yourDomain.com");
                client.Credentials = new NetworkCredential("YourEmailUserName - Web Host", "Your Email Password - WebHost");

                try
                {
                    client.Send(m);
                }
                catch (Exception e)                {

                    ViewBag.Message = e.StackTrace;
                }
                return View("EmailConfirmation");
            }

            return View(cvm);
        }
    }
}
