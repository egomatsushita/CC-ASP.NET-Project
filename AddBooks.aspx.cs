using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddBooks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        // access controls of a web use control
        TextBox txtName = (TextBox)wucNameAuthorISBN.FindControl("txtName");
        TextBox txtAuthor = (TextBox)wucNameAuthorISBN.FindControl("txtAuthor");
        TextBox txtISBN = (TextBox)wucNameAuthorISBN.FindControl("txtISBN");

        TextBox[] textBoxList = { txtName,
                                  txtAuthor,
                                  txtISBN,
                                  txtComments,
                                  txtFriendName,
                                  txtGenre,
                                  txtNoPages};

        foreach (TextBox aTextBox in textBoxList)
        {
            // clear the text property of a textbox if the textbox exist
            if (aTextBox != null)
            {
                aTextBox.Text = String.Empty;
            }
        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // create a new book
            Book newBook = new Book()
            {
                Name = wucNameAuthorISBN.Name,
                Author = wucNameAuthorISBN.Author,
                ISBN = wucNameAuthorISBN.ISBN,
                Genre = txtGenre.Text,
                NoPages = Convert.ToInt32(txtNoPages.Text)
            };

            // get the bookRepository if exists
            BookRepository bookList = Session["bookList"] as BookRepository;
            if (bookList == null)
            {
                bookList = new BookRepository();
                Session["bookList"] = bookList;
            }

            bookList.Add(newBook);
        }
    }
}