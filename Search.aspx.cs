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
            BindGrid("'All'");
        }
    }

    private void BindGrid(string genre)
    {
        SqlConnection conn;
        SqlCommand comm;
        string connectionString = ConfigurationManager.ConnectionStrings["LibraryCollection"].ConnectionString;
        conn = new SqlConnection(connectionString);
        string command = "select title, genre, nameFriend from booksCol where genre = " + genre;
        if (genre == "'All'")
        {
            command = "select title, genre, nameFriend from booksCol";
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

    protected void genreDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        string genre = string.Format("'{0}'", genreDropdownList.SelectedItem.Text);
        lbl.Text = genre;
        BindGrid(genre);
    }


}


//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************