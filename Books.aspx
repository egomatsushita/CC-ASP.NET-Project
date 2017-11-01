<%@ Page Title="Books" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="Books.aspx.cs" Inherits="Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">   
    <div class="col-sm-offset-1 col-sm-10">
        <asp:literal ID="list" runat="server"></asp:literal>
    </div>
</asp:Content>

