using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Books : System.Web.UI.Page
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
        BookRepository bookList = Session["bookList"] as BookRepository;

        if (bookList == null)
        {
            list.Text = "<h1>There is no book in the list!</h1>";
        }
        else
        {
            StringBuilder table = new StringBuilder();
            table.Append("<table class=\"list_table\"><tr><td>Name</td><td>Author</td><td>ISBN</td></tr>");

            foreach (Book aBook in bookList.GetAllBooks())
            {
                table.Append("<tr><td>");
                table.Append(aBook.Name);
                table.Append("</td><td>");
                table.Append(aBook.Author);
                table.Append("</td><td>");
                table.Append(aBook.ISBN);
                table.Append("</td></tr>");
            }
            table.Append("</table>");

            list.Text = table.ToString();
        }
    }
}