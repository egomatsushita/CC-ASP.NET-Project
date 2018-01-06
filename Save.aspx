<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>

<%@ Page Title="Save" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="Save.aspx.cs" Inherits="Setup" %>

<%@ Import Namespace="System.IO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <div class="col-xs-offset-2 col-xs-8 col-sm-offset-3 col-sm-6">
        <div class="form-group">
            <h3 class="h3-title">Save to a txt file!</h3><br />     
            <p>Write additional notes...</p>
            <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control"></asp:TextBox><br />
            <asp:Button ID="btnWrite" runat="server" Text="Save myCollection.txt" CssClass="btn btn-primary btn-xs btn-block" OnClick="btnWrite_Click" />
        </div>
    </div>
</asp:Content>

<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>