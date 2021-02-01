using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StarMed.DATA.EF;
using Microsoft.AspNet.Identity;
using PagedList;
using PagedList.Mvc;

namespace StarMed.UI.MVC.Controllers
{
    [Authorize]
    public class OpenPositionsController : Controller
    {
        private StarMedEntities db = new StarMedEntities();

        // GET: OpenPositions        
        public ActionResult Index()
        {
            //Get the current userID and store in a variable

            string currentUserID = User.Identity.GetUserId();
            if (User.IsInRole("Admin"))
            {
                var openPositions = db.OpenPositions.Include(o => o.Location).Include(o => o.Position);
                return View(openPositions.ToList().OrderBy(x => x.LocationId).OrderBy(x => x.Position.Title));
            }
            else if (User.IsInRole("Manager"))            {                var openPositions = db.OpenPositions.Where(x => x.Location.ManagerId == currentUserID).Include(o => o.Location).Include(o => o.Position);
                return View(openPositions.ToList().OrderBy(x => x.Position.Title));            }            else            {
                var openPositions = db.OpenPositions.Include(o => o.Location).Include(o => o.Position);
                return View(openPositions.ToList().OrderBy(x => x.Position.Title));
            }                         

        }

        // GET: OpenPositions/Details/5
        //[Authorize(Roles = "Employee, Manager, Admin")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            return View(openPosition);
        }

        // GET: OpenPositions/Create
       
        public ActionResult Create()
        {
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "StoreNumber");
            ViewBag.PositionId = new SelectList(db.Positions, "PositionId", "Title");
            return View();
        }

        // POST: OpenPositions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]       
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OpenPositionId,PositionId,LocationId")] OpenPosition openPosition)
        {
            if (ModelState.IsValid)
            {
                db.OpenPositions.Add(openPosition);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "StoreNumber", openPosition.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions, "PositionId", "Title", openPosition.PositionId);
            return View(openPosition);
        }

        // GET: OpenPositions/Edit/5
        //[Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "StoreNumber", openPosition.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions, "PositionId", "Title", openPosition.PositionId);
            return View(openPosition);
        }

        // POST: OpenPositions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        //[Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OpenPositionId,PositionId,LocationId")] OpenPosition openPosition)
        {
            if (ModelState.IsValid)
            {
                db.Entry(openPosition).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "StoreNumber", openPosition.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions, "PositionId", "Title", openPosition.PositionId);
            return View(openPosition);
        }

        // GET: OpenPositions/Delete/5        
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }
            return View(openPosition);
        }

        // POST: OpenPositions/Delete/5
        [HttpPost, ActionName("Delete")]        
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OpenPosition openPosition = db.OpenPositions.Find(id);
            db.OpenPositions.Remove(openPosition);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
             
        [Authorize(Roles ="Employee")]
        public ActionResult OneClickApply(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPosition openPosition = db.OpenPositions.Find(id);
            if (openPosition == null)
            {
                return HttpNotFound();
            }

            //create the application to send here
            string currentUserID = User.Identity.GetUserId();
            UserDetail ud = db.UserDetails.Where(x => x.UserId == currentUserID).Single();
            Position ptn = db.Positions.Find(id);
            OpenPosition optn = db.OpenPositions.Where(op => op.PositionId == id).FirstOrDefault();            
            var appEmployId = User.Identity.GetUserId(); //located UserID

            var appUserDetails = (from x in db.UserDetails
                                  where x.UserId == appEmployId
                                  select x)
                                  .FirstOrDefault(); //connect the two IDs         

            Application app = new Application();
            app.ResumeFilename = ud.ResumeFilename;
            app.ApplicationDate = DateTime.Now;
            app.OpenPositionId = openPosition.OpenPositionId;
            app.UserId = currentUserID;
            app.ApplicationStatus = 6;
            app.ManagerNotes = app.ManagerNotes;

            if (ModelState.IsValid)
            {
                db.Applications.Add(app);
                db.SaveChanges();
                //string confirmMsg = $"You have now applied for {optn.Position.Title}";
                return RedirectToAction("Index", "Applications");

            }               
           
           return RedirectToAction("Index", "Applications");
        }

        [Authorize]
        public ViewResult OpenPositionsIndex(string searchString, string currentFilter, int page = 1)
        {
            if (User.IsInRole("Employee"))
            {
                var user = User.Identity.GetUserId();
                UserDetail currentUser = db.UserDetails.Where(ud => ud.UserId == user).FirstOrDefault();

                var apps = db.Applications.Where(app => app.UserId == currentUser.UserId);
                var op = db.OpenPositions.Include(a => a.Location).Include(a => a.Position);

                List<int> appliedPosn = new List<int>();

                foreach (var a in apps)
                {
                    foreach (var b in op)
                    {
                        if (a.OpenPositionId == b.OpenPositionId)
                        {
                            appliedPosn.Add(b.OpenPositionId);
                        }
                    }
                }
                ViewBag.AppliedPosn = appliedPosn;
            }
            int pageSize = 10;

            var users = db.OpenPositions.ToList();

            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }
            ViewBag.CurrentFilter = searchString;
            if (!String.IsNullOrEmpty(searchString))
            {
                users = (from x in users
                         where x.Position.Title.ToLower().Contains(searchString.ToLower())
                         || x.Location.City.ToLower().Contains(searchString.ToLower())
                         || x.Location.State.ToLower().Contains(searchString.ToLower())
                         select x).ToList();
            }
            return View(users.ToPagedList(page, pageSize));
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
