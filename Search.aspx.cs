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
            BindGrid();
        }
    }

    private void BindGrid()
    {
        string friend = friendDropdownList.SelectedValue;
        string genre = genreDropdownList.SelectedValue;

        if (friend == "All")
        {
            if (genre == "All")
            {
                booksColDataSource.SelectCommand = "SELECT * FROM [booksCol]";
            }
            else
            {
                booksColDataSource.SelectCommand = "SELECT * FROM [booksCol] WHERE (([genre] = @genre))";
            }

            
        }
        else
        {
            if (genre == "All")
            {
                booksColDataSource.SelectCommand = "SELECT * FROM [booksCol] WHERE (([nameFriend] = @nameFriend))";
            }
            else
            {
                booksColDataSource.SelectCommand = "SELECT * FROM [booksCol] WHERE (([genre] = @genre) AND ([nameFriend] = @nameFriend))";
            }           
        }
    }

    protected void GenreDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {

        BindGrid();
    }

    protected void FriendDropdownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }
}


//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************