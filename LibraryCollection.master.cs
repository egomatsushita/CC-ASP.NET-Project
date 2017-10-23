using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LibraryCollection : System.Web.UI.MasterPage
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
       


    }

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie userSession;
        userSession = Request.Cookies["UserID"];

        if (userSession == null)
        {
            userSession = new HttpCookie("UserID", "John Doe");
            {
                userSession.Expires = DateTime.Now.AddMonths(1);
            }
            Response.Cookies.Add(userSession);
            lblUserSession.Text = "Welcome, " + userSession.Value;
        }
        else
        {
            lblUserSession.Text = "Welcome back, " + userSession.Value;
        }


        


    }
}
