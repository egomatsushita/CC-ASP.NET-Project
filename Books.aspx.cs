using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************

public partial class Books : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["Theme"] != null)
        {
            this.Theme = Session["Theme"] as String;
        }
    }

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************

    protected void Page_Load(object sender, EventArgs e)
    {
        //BookRepository bookList = Session["bookList"] as BookRepository;
        if (grid.Rows.Count < 1)
        {
            list.Text = "<h3 class=\"h3-title\">There is no book in the collection!</h3>";
        }
        else
        {
            list.Text = "<h3 class=\"h3-title\">Look at the most amazing collection...</h3>";
        }

        //if (bookList == null)
        //{
        //    list.Text = "<h3 class=\"h3-title\">There is no book in the collection!</h3>";
        //}
        //else
        //{
        //    StringBuilder table = new StringBuilder();
        //    table.Append("<h3 class=\"h3-title\">Look at the most amazing collection...</h3>");
        //    table.Append("<table class=\"table table-responsive table-striped thead-dark\"><thead class=\"thead-dark\"><tr class=\"bg-primary\"><th>Name</th><th>Author</th><th>ISBN</th></tr></thead>");

        //    foreach (Book aBook in bookList.GetAllBooks())
        //    {
        //        table.Append("<tr><td>");
        //        table.Append(aBook.Name);
        //        table.Append("</td><td>");
        //        table.Append(aBook.Author);
        //        table.Append("</td><td>");
        //        table.Append(aBook.ISBN);
        //        table.Append("</td></tr>");
        //    }
        //    table.Append("</table>");

        //    list.Text = table.ToString();
        //}
    }
}

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************