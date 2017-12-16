<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>

<%@ Page Title="Books" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="Books.aspx.cs" Inherits="Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">   
    <div class="col-sm-offset-2 col-sm-8">
        <asp:literal ID="list" runat="server"></asp:literal>
    </div>
    <div class="col-sm-offset-2 col-sm-8">
        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="booksDataSource" >
            <Columns>
                <asp:BoundField DataField="title" HeaderText="TITLE" SortExpression="title" />
                <asp:BoundField DataField="author" HeaderText="AUTHOR" SortExpression="author" />
                <asp:BoundField DataField="isbn" HeaderText="ISBN" SortExpression="isbn" />          
            </Columns>            
        </asp:GridView>
        <asp:SqlDataSource ID="booksDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryCollection %>" SelectCommand="SELECT [author], [isbn], [title] FROM [booksCol]"></asp:SqlDataSource>
    </div>
</asp:Content>

<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>