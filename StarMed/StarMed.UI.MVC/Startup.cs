using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StarMed.UI.MVC.Startup))]
namespace StarMed.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
