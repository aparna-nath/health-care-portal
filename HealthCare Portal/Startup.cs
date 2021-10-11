using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HealthCare_Portal.Startup))]
namespace HealthCare_Portal
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
