using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************

public partial class Setup : System.Web.UI.Page
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

    }

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************
   
    protected void btnWrite_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;
        string connectionString = ConfigurationManager.ConnectionStrings["LibraryCollection"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand("select idLibCol, title, author, isbn, genre, pages, nameFriend, comments from booksCol", conn);

        try
        {
            conn.Open();
            SqlDataReader reader;
            reader = comm.ExecuteReader();

            using (StreamWriter streamWriter = File.CreateText(@"C:\Users\egoma\Downloads\myCollection.txt"))
            {
                streamWriter.WriteLine(">>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<");
                streamWriter.WriteLine(">>>>>>>>>> Library Collection <<<<<<<<<<");
                streamWriter.WriteLine("");             

                while (reader.Read())
                {
                    streamWriter.WriteLine("Id: " + reader.GetInt32(0).ToString());
                    streamWriter.WriteLine("Title: " + reader.GetString(1));
                    streamWriter.WriteLine("Author: " + reader.GetString(2));
                    streamWriter.WriteLine("ISBN: " + reader.GetString(3));
                    streamWriter.WriteLine("Genre: " + reader.GetString(4));
                    streamWriter.WriteLine("Pages: " + reader.GetInt32(5));
                    streamWriter.WriteLine("Friend: " + reader.GetString(6));
                    streamWriter.WriteLine("Comments: " + reader.GetString(7));
                    streamWriter.WriteLine("");
                }
                streamWriter.WriteLine("PS: " + txtNotes.Text);
                streamWriter.WriteLine("");
                streamWriter.WriteLine(">>>>> Saved on: " + DateTime.Now.ToString() + " <<<<<");

                streamWriter.Close();
            }

            reader.Close();
        }
        finally
        {
            conn.Close();
        }
    }
}

//*******************************
//* Name: Eduardo Go Matsushita *
//* Student Id: 300904663       *
//*******************************
