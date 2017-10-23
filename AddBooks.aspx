<%@ Page Title="Add a Book" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="AddBooks.aspx.cs" Inherits="AddBooks" %>
<%@ Register TagPrefix="wuc" TagName="NameAuthorISBN" Src="~/WucNameAuthorISBN.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <div class="addBooks_form">
        <h1>Let's add a new book...</h1>

        <!-- Web User Control -->
        <wuc:NameAuthorISBN ID="wucNameAuthorISBN" runat="server"/>
        
        <!-- Genre -->
        <p>
            Genre: <br />
            <asp:textbox ID="txtGenre" runat="server"></asp:textbox>
        </p>
        
        <!-- Number of Pages -->
        <p>
            Number of Pages:<br />
            <asp:textbox ID="txtNoPages" runat="server"></asp:textbox>
            <asp:requiredfieldvalidator ID="noPagesReq" runat="server" errormessage="<br />You must enter a number of pages!" ControlToValidate="txtNoPages" SetFocusOnError="True"></asp:requiredfieldvalidator>
            <asp:comparevalidator ID="noPagesCheck" runat="server" errormessage="<br />A number must be positive!" ControlToValidate="txtNoPages" Operator="GreaterThan" SetFocusOnError="True" Type="Integer" ValueToCompare="0"></asp:comparevalidator>
        </p>
        
        <!-- Landed to a friend -->
        <p>
            Landed to a friend:<br />
            <asp:dropdownlist ID="ddlLandedFriend" runat="server">
                <asp:ListItem Value="yes">Yes</asp:ListItem>
                <asp:ListItem Value="no">No</asp:ListItem>
            </asp:dropdownlist>
        </p>
        
        <!-- Friend's Name -->
        <p>
            Friend's Name:<br />
            <asp:textbox ID="txtFriendName" runat="server"></asp:textbox>
            <asp:requiredfieldvalidator ID="friendNameReq" runat="server" errormessage="<br />You must enter the name of a friend!" ControlToValidate="txtFriendName" SetFocusOnError="True"></asp:requiredfieldvalidator>
        </p>
        <%-->>>If the book is landed to a friend the “Name of a friend” field is mandatory<<<--%>
        
        <!-- Comments -->
        <p>
            Comments:<br />
            <asp:textbox ID="txtComments" runat="server" Columns="40" Rows="4" TextMode="MultiLine"></asp:textbox>
        </p>

        <!-- Save & Cancel -->
        <asp:Button ID="btnSave" runat="server" Text="Save" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
    </div>     
</asp:Content>

