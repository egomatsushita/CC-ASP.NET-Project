using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************

public partial class _Default : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["Theme"] != null)
        {
            this.Theme = Session["Theme"] as String;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //*******************************
    //* Name: Eduardo Go Matsushita *
    //* Student Id: 300904663       *
    //*******************************

    protected void lbtnDark_Click(object sender, EventArgs e)
    {
        UpdateCookie("Dark");
    }

    protected void lbtnLight_Click(object sender, EventArgs e)
    {
        UpdateCookie("Light");
    }

    protected void UpdateCookie(string themeName)
    {
        Session["Theme"] = themeName;
        HttpCookie userTheme;
        userTheme = Request.Cookies["Theme"];

        if (userTheme != null)
        {
            Response.Cookies["Theme"].Value = Session["Theme"] as String;
            Response.Cookies["Theme"].Expires = DateTime.Now.AddDays(1);
        }
        else
        {
            userTheme = new HttpCookie("Theme", themeName)
            {
                Expires = DateTime.Now.AddDays(1)
            };
            Response.Cookies.Add(userTheme);
        }

        Server.Transfer(Request.Path);
    }
}

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************