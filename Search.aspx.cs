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
            lit.Text = "<h3 class=\"h3-title\">No book in the collection.</h3>";
            BindGrid();           
        }      
    }

    private void BindGrid()
    {
        string friend = friendDropdownList.SelectedValue;
        string genre = genreDropdownList.SelectedValue;

        AssignCommandAfterSearchingBy(genre, friend);
    }

    public void AssignCommandAfterSearchingBy(string genre, string friend)
    {
        string command;

        if (friend == "All")
        {
            if (genre == "All")
            {
                command = "SELECT * FROM [booksCol]";
            }
            else
            {
                command = "SELECT * FROM [booksCol] WHERE (([genre] = @genre))";
            }
        }
        else
        {
            if (genre == "All")
            {
                command = "SELECT * FROM [booksCol] WHERE (([nameFriend] = @nameFriend))";
            }
            else
            {
                command = "SELECT * FROM [booksCol] WHERE (([genre] = @genre) AND ([nameFriend] = @nameFriend))";
            }
        }

        booksColDataSource.SelectCommand = command;       
    }

    protected void GenreDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void FriendDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }

    // control literal visibility in accordance with data retrieved
    protected void grid_DataBound(object sender, EventArgs e)
    {
        if (grid.Rows.Count < 1)
        {
            lit.Visible = true;
        }
        else
        {
            lit.Visible = false;
        }
    }
}


//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************