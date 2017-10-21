<%@ Page Title="Add a Book" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="AddBooks.aspx.cs" Inherits="AddBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <h1>Let's add a new book...</h1>
    <p>
        <span class="Col_1/2">
            Name: 
        </span>
        <span >
        <span class="Col_2/2">
            <asp:textbox ID="txtName" runat="server"></asp:textbox>
            <asp:requiredfieldvalidator ID="nameReq" runat="server" errormessage="&nbsp;You must enter a name!" ControlToValidate="txtName" SetFocusOnError="True"></asp:requiredfieldvalidator>
        </span>
    </p>
    <p>
        <%-->>>>>>>>>ADD MORE TEXTBOX IF THERE ARE MORE AUTHORS<<<<<<<<<<--%>
        <span class="Col_1/2">
            Author(s): 
        </span>
        <span class="Col_2/2">
            <asp:textbox ID="txtAuthor" runat="server"></asp:textbox>
            <asp:requiredfieldvalidator ID="authorReq" runat="server" errormessage="&nbsp;You must enter an author!" ControlToValidate="txtAuthor" SetFocusOnError="True"></asp:requiredfieldvalidator>
        </span>
    </p>
    <p>
        <span class="Col_1/2">
            ISBN: 
        </span>
        <span class="Col_2/2">
            <asp:textbox ID="txtISBN" runat="server"></asp:textbox>
        </span>
    </p>
    <p>
        <span class="Col_1/2">
            Genre: 
        </span>
        <span class="Col_2/2">
            <asp:textbox ID="txtGenre" runat="server"></asp:textbox>
        </span>
    </p>
    <p>
        <span class="Col_1/2">
            Number of Pages:
        </span>
        <span class="Col_2/2">
            <asp:textbox ID="txtNoPages" runat="server"></asp:textbox>
            <asp:requiredfieldvalidator ID="noPagesReq" runat="server" errormessage="&nbsp;You must enter a number of pages!" ControlToValidate="txtNoPages" SetFocusOnError="True"></asp:requiredfieldvalidator>
            <asp:comparevalidator ID="noPagesCheck" runat="server" errormessage="&nbsp;A number must be positive!" ControlToValidate="txtNoPages" Operator="GreaterThan" SetFocusOnError="True" Type="Integer" ValueToCompare="0"></asp:comparevalidator>
        </span>
    </p>
    <p>
        <span class="Col_1/2">
            Landed to a friend:
        </span>
        <span class="Col_2/2">
            <asp:dropdownlist ID="ddlLandedFriend" runat="server">
                <asp:ListItem Value="yes">Yes</asp:ListItem>
                <asp:ListItem Value="no">No</asp:ListItem>
            </asp:dropdownlist>
        </span>
    </p>
    <p>
        <%-->>>If the book is landed to a friend the “Name of a friend” field is mandatory<<<--%>
        <span class="Col_1/2">
            Friend's Name:
        </span>
        <span class="Col_2/2">
            <asp:textbox ID="txtFriendName" runat="server"></asp:textbox>
            <asp:requiredfieldvalidator ID="friendNameReq" runat="server" errormessage="&nbsp;You must enter the name of a friend!" ControlToValidate="txtFriendName" SetFocusOnError="True"></asp:requiredfieldvalidator>
        </span>
    </p>
    <p>
        <span class="Col_1/2">
            Comments:
        </span>
        <span class="Col_2/2">
            <asp:textbox ID="txtComments" runat="server"></asp:textbox>
        </span>
    </p>


        
        
        
        
        
        
        
    
</asp:Content>

