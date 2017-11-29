<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>

<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }


    //*******************************
    //* Name: Eduardo Go Matsushita *
    //* Student Id: 300904663       *
    //*******************************


    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        // Initialize a theme session to a theme cookie if it exists
        // Otherwise, assign it to the light theme.
        if (Request.Cookies["Theme"] != null)
        {
            Session["Theme"] = Request.Cookies["Theme"].Value;
        }
        else
        {
            Session["Theme"] = "Light";
        }
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>

<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>