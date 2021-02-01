using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StarMed.DATA.EF;
using StarMed.UI.MVC.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;


namespace StarMed.UI.MVC.Controllers
{
    [Authorize(Roles = "Admin")]
    public class LocationsController : Controller
    {
        private StarMedEntities db = new StarMedEntities();

        private ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        private ApplicationRoleManager _roleManager;
        public ApplicationRoleManager RoleManager
        {
            get
            {
                return _roleManager ?? HttpContext.GetOwinContext().Get<ApplicationRoleManager>();
            }
            private set
            {
                _roleManager = value;
            }
        }

        // GET: Locations  
        [AllowAnonymous]
        public ActionResult Index()
        {
            var locations = db.Locations.Include(l => l.UserDetail);
            return View(locations.ToList());
        }

        // GET: Locations/Details/5
        [AllowAnonymous]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // GET: Locations/Create 
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            //get all users in a role
            var role = RoleManager.FindByName("Employee");
            //get the list of users in this role
            var users = new List<ApplicationUser>();

            //Get the list of users in this role
            foreach (var user in UserManager.Users.ToList())
            {
                if (UserManager.IsInRole(user.Id, role.Name))
                {
                    users.Add(user);
                }
            }
            List<UserDetail> employees = new List<UserDetail>();
            foreach (var user in users)
            {
                var emp = db.UserDetails.Where(u => u.UserId == user.Id).Single();
                employees.Add(emp);
            }
            ViewBag.ManagerId = new SelectList(db.UserDetails, "UserId", "FullName");

            return View();
        }

        // POST: Locations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]        
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "LocationId,StoreNumber,City,State,ManagerId")] Location location)
        {
            if (ModelState.IsValid)
            {
                db.Locations.Add(location);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ManagerId = new SelectList(db.UserDetails, "UserId", "FullName", location.ManagerId);
            return View(location);
        }

        // GET: Locations/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            ViewBag.ManagerId = new SelectList(db.UserDetails, "UserId", "FullName", location.ManagerId);
            return View(location);
        }

        // POST: Locations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]        
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "LocationId,StoreNumber,City,State,ManagerId")] Location location)
        {
            if (ModelState.IsValid)
            {
                db.Entry(location).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ManagerId = new SelectList(db.UserDetails, "UserId", "FullName", location.ManagerId);
            return View(location);
        }

        // GET: Locations/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // POST: Locations/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Location location = db.Locations.Find(id);
            db.Locations.Remove(location);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
