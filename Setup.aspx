<%@ Page Title="" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="Setup.aspx.cs" Inherits="Setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <h3 class="margin-top-bottom-50">Which color scheme do you want to choose?</h3>
    <asp:LinkButton ID="lbtnDark" runat="server" OnClick="lbtnDark_Click" CssClass="btn btn-default btn-lg margin-left-10">Dark</asp:LinkButton>
    <asp:LinkButton ID="lbtnLight" runat="server" OnClick="lbtnLight_Click" CssClass="btn btn-primary btn-lg margin-left-10">Light</asp:LinkButton>
</asp:Content>

