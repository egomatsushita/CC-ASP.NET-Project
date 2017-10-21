<%@ Page Title="Add a Book" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="AddBooks.aspx.cs" Inherits="AddBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <h1>Let's add a new book...</h1>
    <p>
        Name:<br />
        <asp:textbox ID="txtName" runat="server"></asp:textbox>
        <asp:requiredfieldvalidator ID="nameReq" runat="server" errormessage="<br />You must enter a name!" ControlToValidate="txtName" SetFocusOnError="True"></asp:requiredfieldvalidator>
    </p>
    <p>
        <%-->>>>>>>>>ADD MORE TEXTBOX IF THERE ARE MORE AUTHORS<<<<<<<<<<--%>
        Author(s):<br />
        <asp:textbox ID="txtAuthor" runat="server"></asp:textbox>
        <asp:requiredfieldvalidator ID="authorReq" runat="server" errormessage="<br />You must enter an author" ControlToValidate="txtAuthor" SetFocusOnError="True"></asp:requiredfieldvalidator>
    </p>
    <p>
        ISBN:<br />
        <asp:textbox ID="txtISBN" runat="server"></asp:textbox>
    </p>
    <p>
        Genre:<br />
        <asp:textbox ID="txtGenre" runat="server"></asp:textbox>
    </p>
    <p>
        Number of Pages:<br />
        <asp:textbox ID="txtNoPages" runat="server"></asp:textbox>
        <asp:requiredfieldvalidator ID="noPagesReq" runat="server" errormessage="<br />You must enter a number of pages!" ControlToValidate="txtNoPages" SetFocusOnError="True"></asp:requiredfieldvalidator>
        <asp:comparevalidator ID="noPagesCheck" runat="server" errormessage="<br />A number must be positive!" ControlToValidate="txtNoPages" Operator="GreaterThan" SetFocusOnError="True" Type="Integer" ValueToCompare="0"></asp:comparevalidator>
    </p>
    <p>
        Landed to a friend:<br />
        <asp:dropdownlist ID="ddlLandedFriend" runat="server"></asp:dropdownlist>
    </p>
    <p>
        <%-->>>If the book is landed to a friend the “Name of a friend” field is mandatory<<<--%>
        Friend's Name:<br />
        <asp:textbox ID="txtFriendName" runat="server"></asp:textbox>
        <asp:requiredfieldvalidator ID="friendNameReq" runat="server" errormessage="<br />You must enter the name of a friend!" ControlToValidate="txtFriendName" SetFocusOnError="True"></asp:requiredfieldvalidator>
    </p>
    <p>
        Comments:<br />
        <asp:textbox ID="txtComments" runat="server"></asp:textbox>
    </p>


        
        
        
        
        
        
        
    
</asp:Content>

