<%@ Page Title="Add a Book" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="AddBooks.aspx.cs" Inherits="AddBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <h1>Let's add a new book...</h1>
    <p>
        Name:<br />
        <asp:textbox ID="txtName" runat="server"></asp:textbox>
    </p>
    <p>
        <%-->>>>>>>>>ADD MORE TEXTBOX IF THERE ARE MORE AUTHORS<<<<<<<<<<--%>
        Author(s):<br />
        <asp:textbox ID="txtAuthor" runat="server"></asp:textbox>
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
    </p>
    <p>
        Landed to a friend:<br />
        <asp:dropdownlist ID="ddlLandedFriend" runat="server"></asp:dropdownlist>
    </p>
    <p>
        Friend's Name:<br />
        <asp:textbox ID="txtFriendName" runat="server"></asp:textbox>
    </p>
    <p>
        Comments:<br />
        <asp:textbox ID="txtComments" runat="server"></asp:textbox>
    </p>


        
        
        
        
        
        
        
    
</asp:Content>

