using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            name.Text = "Welcome " + HttpContext.Current.User.Identity.Name;
        }
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        
        FormsAuthentication.RedirectToLoginPage();
    }
}
