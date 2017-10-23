using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WucNameAuthorISBN : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    public string Name
    {
        get
        {
            return txtName.Text;
        }
    }

    public string Author
    {
        get
        {
            return txtAuthor.Text;
        }
    }

    public string ISBN
    {
        get
        {
            return txtISBN.Text;
        }
    }
}