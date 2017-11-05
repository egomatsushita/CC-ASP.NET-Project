<%@ Page Title="" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="Setup.aspx.cs" Inherits="Setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">

    <div class="col-xs-offset-2 col-xs-8 col-sm-offset-3 col-sm-6">
        <div class="row">

            <div class="col-sm-6 h3-title">
        <asp:LinkButton ID="lbtnDark" runat="server" OnClick="lbtnDark_Click" CssClass="btn btn-default btn-lg btn-block">Dark</asp:LinkButton>
                </div>
            <div class="col-sm-6 h3-title">
        <asp:LinkButton ID="lbtnLight" runat="server" OnClick="lbtnLight_Click" CssClass="btn btn-primary btn-lg btn-block">Light</asp:LinkButton>
                </div>
            </div>
    </div>

</asp:Content>

