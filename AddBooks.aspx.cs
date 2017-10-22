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
        TextBox[] textBoxList = { txtAuthor, txtComments, txtFriendName, txtGenre, txtISBN, txtName, txtNoPages };

        foreach (TextBox aTextBox in textBoxList)
        {
            // clear the text property of textbox if the textbox exist
            if (aTextBox != null)
            {
                aTextBox.Text = String.Empty; 
            }

            
        }
    }
}