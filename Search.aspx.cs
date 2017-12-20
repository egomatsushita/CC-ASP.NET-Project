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

public partial class Search : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            BindGrid("'All'", "'All'");
        }
    }

    private void BindGrid(string genre, string friend)
    {
        SqlConnection conn;
        SqlCommand comm;
        string connectionString = ConfigurationManager.ConnectionStrings["LibraryCollection"].ConnectionString;
        conn = new SqlConnection(connectionString);
        string command;
        if (genre == "'All'")
        {
            if (friend == "'All'")
            {
                command = "select title, genre, nameFriend from booksCol";
            }
            else
            {
                command = "select title, genre, nameFriend from booksCol where nameFriend = " + friend;
            }
            
        }
        else
        {
            if (friend == "'All'")
            {
                command = "select title, genre, nameFriend from booksCol where genre = " + genre;
            }
            else
            {
                command = "select title, genre, nameFriend from booksCol where genre = " + genre + "and nameFriend = " + friend;
            }
        }

        comm = new SqlCommand(command, conn);

        try
        {
            conn.Open();

            

            SqlDataReader reader = comm.ExecuteReader();
            searchGrid.AutoGenerateColumns = true;
            searchGrid.DataSource = reader;
            searchGrid.DataBind();
            reader.Close();
        }
        finally
        {
            conn.Close();
        }

    }

    protected void GenreDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {

        HandleDropdownList();
    }



    protected void FriendDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        HandleDropdownList();
    }

    private void HandleDropdownList()
    {
        string genre = string.Format("'{0}'", genreDropdownList.SelectedItem.Text);
        string friend = string.Format("'{0}'", friendDropdownList.SelectedItem.Text);
        BindGrid(genre, friend);
    }
}


//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************