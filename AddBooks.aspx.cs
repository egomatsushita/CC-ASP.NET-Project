using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************

public partial class AddBooks : System.Web.UI.Page
{
    // will be assigned to a unique primary key
    private static int idLibCol = 0;

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies["Theme"] != null)
        {
            this.Theme = Session["Theme"] as String;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // only allow admin role to save a book in database
        if (!HttpContext.Current.User.IsInRole("Admin"))
        {
            btnSave.Enabled = false;
        }


        // retrieve the largest primary key
        string connectionString = ConfigurationManager.ConnectionStrings["LibraryCollection"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        SqlCommand comm =  new SqlCommand("select idLibCol from BooksCol", conn);
        try
        {
            conn.Open();
            SqlDataReader reader;
            reader = comm.ExecuteReader();
            while (reader.Read())
            {
                idLibCol = idLibCol > reader.GetInt32(0) ? idLibCol : reader.GetInt32(0);
            }          
            reader.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
        finally
        {          
            conn.Close();
        }

    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearTextField();

        ReturnDDLtoDefaultView();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        idLibCol++;

        if (txtFriendName.Text == "")
        {
            txtFriendName.Text = "No Friend";
        }
        if (txtComments.Text == "")
        {
            txtComments.Text = "No Comments";
        }
        DataSet dataSet = new DataSet();
        SqlDataAdapter adapter;
        string connectionString = ConfigurationManager.ConnectionStrings["LibraryCollection"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        adapter = new SqlDataAdapter("select idLibCol, title, author, isbn, genre, pages, landedFriend, nameFriend, comments from BooksCol", conn);

        if (ViewState["BooksDataSet"] == null)
        {
            adapter.Fill(dataSet, "BooksCol");
            ViewState["BooksDataSet"] = dataSet;
        }
        else
        {
            dataSet = (DataSet)ViewState["BooksDataSet"];
        }

        DataRow dataRow;
        SqlCommandBuilder commandBuilder;
        dataRow = dataSet.Tables["BooksCol"].NewRow();
        dataRow["idLibCol"] = idLibCol;
        dataRow["title"] = wucNameAuthorISBN.Name;
        dataRow["author"] = wucNameAuthorISBN.Author;
        dataRow["isbn"] = wucNameAuthorISBN.ISBN;
        dataRow["genre"] = txtGenre.Text;
        dataRow["pages"] = txtNoPages.Text;
        dataRow["landedFriend"] = ddlLandedFriend.SelectedValue;
        dataRow["nameFriend"] = txtFriendName.Text;
        dataRow["comments"] = txtComments.Text;
        dataSet.Tables["BooksCol"].Rows.Add(dataRow);
        commandBuilder = new SqlCommandBuilder(adapter);
        DataTable bookTable = dataSet.Tables["BooksCol"];
        adapter.Update(bookTable);
        ViewState["BooksDataSet"] = null;

        // keep data in the book repository ++++++++++++++++++++++++++++++++
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

            // add a new book to the bookRepository
            bookList.Add(newBook);

            // Pop up an bootstrap modal with a successful message
            ScriptManager.RegisterStartupScript(this,
                                            this.GetType(),
                                            "ServerControlScript",
                                            "<script>" +
                                              "$(document).ready(function() {" +
                                                "$(\"#popup_success\").modal(\"show\");" +
                                              "}); " +
                                            "</script>",
                                            false);

        // Delete the content of all text fields after the newbook added
        ClearTextField();

        ReturnDDLtoDefaultView();
        }
    }

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************

    protected void SwitchFriendNameVisibility(object sender, EventArgs e)
    {
        ControlFriendNameVisibility();
    }

    protected void ControlFriendNameVisibility()
    {
        // Make visible friend's name textbox, label, and validation if a user choose yes 
        if (ddlLandedFriend.SelectedValue == "yes")
        {
            lblFriendName.Visible = true;
            txtFriendName.Visible = true;
            friendNameReq.Visible = true;
        }
        else
        {
            lblFriendName.Visible = false;
            txtFriendName.Visible = false;
            friendNameReq.Visible = false;
        }

        // Enable friend's name validation if a user choose yes
        if (ddlLandedFriend.SelectedValue == "yes")
        {
            friendNameReq.Enabled = true;
        }
        else
        {
            friendNameReq.Enabled = false;
        }
    }

    protected void ClearTextField()
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
            if (aTextBox.Text != "")
            {
                aTextBox.Text = String.Empty;
            }
        }
    }

    protected void ReturnDDLtoDefaultView()
    {
        // Set "No" to landed to a friend dropdown list
        if (ddlLandedFriend.Items[0].Selected)
        {
            ddlLandedFriend.Items[0].Selected = false;
            ddlLandedFriend.Items[1].Selected = true;
        }

        ControlFriendNameVisibility();
    }
}

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************