<%@ Page Title="Add a Book" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="AddBooks.aspx.cs" Inherits="AddBooks" %>
<%@ Register TagPrefix="wuc" TagName="NameAuthorISBN" Src="~/WucNameAuthorISBN.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <div class="col-xs-offset-2 col-xs-8 col-sm-offset-3 col-sm-6">
        <div class="form-group">
            <h3 class="h3-title">Let's add a new book...</h3>

            <!-- Web User Control -->
            <wuc:NameAuthorISBN ID="wucNameAuthorISBN" runat="server"/>
        
            <!-- Genre -->
            <p>
                Genre: <br />
                <asp:textbox ID="txtGenre" runat="server" CssClass="form-control"></asp:textbox>
            </p>
        
            <!-- Number of Pages -->
            <p>
                Number of Pages:<br />
                <asp:textbox ID="txtNoPages" runat="server" CssClass="form-control"></asp:textbox>
                <asp:requiredfieldvalidator ID="noPagesReq" runat="server" errormessage="<br />You must enter a number of pages!" ControlToValidate="txtNoPages" SetFocusOnError="True"></asp:requiredfieldvalidator>
                <asp:comparevalidator ID="noPagesCheck" runat="server" errormessage="<br />A number must be positive!" ControlToValidate="txtNoPages" Operator="GreaterThan" SetFocusOnError="True" Type="Integer" ValueToCompare="0"></asp:comparevalidator>
            </p>
        
            <!-- Landed to a friend -->
            <p>
                Landed to a friend:<br />
                <asp:dropdownlist ID="ddlLandedFriend" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SwitchVisibilityFriendName" CssClass="form-control">
                    <asp:ListItem Value="yes">Yes</asp:ListItem>
                    <asp:ListItem Value="no" Selected="True">No</asp:ListItem>
                </asp:dropdownlist>
            </p>
        
            <!-- Friend's Name -->
            <p>
                <asp:Label ID="lblFriendName" runat="server" Text="Friend's Name:" Visible="False"></asp:Label><br />
                <asp:textbox ID="txtFriendName" runat="server" Visible="False" CssClass="form-control"></asp:textbox>
                <asp:requiredfieldvalidator ID="friendNameReq" runat="server" errormessage="<br />You must enter the name of a friend!" ControlToValidate="txtFriendName" SetFocusOnError="True" Enabled="False"></asp:requiredfieldvalidator>
            </p>
        
            <!-- Comments -->
            <p>
                Comments:<br />
                <asp:textbox ID="txtComments" runat="server" Columns="40" Rows="4" TextMode="MultiLine" CssClass="form-control"></asp:textbox>
            </p>

            <!-- Save & Cancel -->
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary btn-xs btn-xs btn-position"/>
            <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CssClass="btn btn-danger btn-xs btn-position" />

            <div class="clearfix"></div>
        </div>  
    </div>   

    <!--BOOTSTRAP MODAL-->
    <div class="modal" id="popup_success">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">x</button>  
                    <h3 class="modal-title">Success!!!</h3>
                </div>
                <div class="modal-body">
                    <p>You added a new book!</p>
                </div>
            </div>
        </div>
    </div>
   
</asp:Content>

