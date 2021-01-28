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

        //GET
        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }



        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return View(cvm);
            }

            string emailBody = $"You have recieved an email from {cvm.Name} with a subject of {cvm.Subject}.  Please respond to {cvm.Email} with " +
                $"your email to the following message: <br/><br/> {cvm.Message}";

            MailMessage msg = new MailMessage
            (
                //From
                "no-reply@davidsee.net",
                //To(where the actual message is sent)
                "engr317@gmail.com",
                //Subject
                "Email from davidsee.net",
                //Body
                emailBody
            );

            msg.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("mail.davidsee.net");

            client.Credentials = new NetworkCredential("no-reply@davidsee.net", "123456Ks!");
            client.Port = 8889;

            try
            {
                //attempt to send the email
                client.Send(msg);
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = $"Sorry, Something went wrong.  Error message: {ex.Message}<br/>{ex.StackTrace}";
                return View(cvm);
            }

            return View("EmailConfirmation", cvm);
        }
    }
}
