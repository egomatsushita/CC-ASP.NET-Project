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
        string title = Session["title"] as String;

        if (title != null)
        {
            lit.Text = "<h3 class=\"h3-title\"><em>" + title + "</em></h3>";
        }
        else
        {
            Response.Redirect("~/Books.aspx");
        }

        // only allow a user with admin role to edit/delete/update
        if (!HttpContext.Current.User.IsInRole("Admin"))
        {
            bookDetails.Rows[8].Visible = false;
        }
    }

    protected void bookDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        Response.Redirect("~/Books.aspx");
    }

    protected void lkBtnAdd_Click(object sender, EventArgs e)
    {
        BoundField bdField = new BoundField
        {
            HeaderText = "Genre",
            DataField = "genre"
        };
        bookDetails.Fields.RemoveAt(4);
        bookDetails.Fields.Insert(4, bdField);
    }
}

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************
