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

public partial class BookDetails : System.Web.UI.Page
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
        string uri = HttpContext.Current.Request.Url.PathAndQuery;
        int index = uri.IndexOf('=');
        string title = uri.Substring(index + 1);
        title = title.Replace("%20", " ");

        list.Text = "<h3 class=\"h3-title\"><em>"+ title + "</em></h3>";       
    }
}

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************
