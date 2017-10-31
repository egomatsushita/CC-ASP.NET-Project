<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WucNameAuthorISBN.ascx.cs" Inherits="WucNameAuthorISBN" %>

<!-- Name -->
<p>
    Name: <br />
    <asp:textbox ID="txtName" runat="server" CssClass="form-control"></asp:textbox>
    <asp:requiredfieldvalidator ID="nameReq" runat="server" errormessage="<br />You must enter a name!" ControlToValidate="txtName" SetFocusOnError="True"></asp:requiredfieldvalidator>
</p>
        
<!-- Author(s) -->
<%-->>>>>>>>>ADD MORE TEXTBOX IF THERE ARE MORE AUTHORS<<<<<<<<<<--%>
<p>
    Author(s): <br />
    <asp:textbox ID="txtAuthor" runat="server" CssClass="form-control"></asp:textbox>
    <asp:requiredfieldvalidator ID="authorReq" runat="server" errormessage="<br />You must enter an author!" ControlToValidate="txtAuthor" SetFocusOnError="True"></asp:requiredfieldvalidator>
</p>
        
<!-- ISBN -->
<p>
    ISBN: <br />
    <asp:textbox ID="txtISBN" runat="server" CssClass="form-control"></asp:textbox>
</p>
        