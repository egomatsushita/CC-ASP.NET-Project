<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>

<%@ Page Title="Search a Book" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">
    <div class="col-sm-offset-2 col-sm-8">
        <div class="dropdown">
            <div class="col-sm-6 h3-title">
                <span style="font-weight:bold;">Genre</span>&nbsp;
                <asp:dropdownlist CssClass="btn btn-sm btn-default dropdown-toggle dropdown-toggle-split" ID="genreDropdownList" runat="server" DataSourceID="genreDataSource" DataTextField="genre" DataValueField="genre" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="GenreDropdownList_SelectedIndexChanged" >
                    <asp:ListItem>All</asp:ListItem>
                </asp:dropdownlist>
                <asp:sqldatasource ID="genreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryCollection %>" SelectCommand="SELECT DISTINCT [genre] FROM [booksCol]"></asp:sqldatasource>
            </div>
            <div class="col-sm-6 h3-title">
                <span style="font-weight:bold;">Friend</span>&nbsp;
                <asp:dropdownlist CssClass="btn btn-sm btn-default dropdown-toggle dropdown-toggle-split" ID="friendDropdownList" runat="server" DataSourceID="friendDataSource" DataTextField="nameFriend" DataValueField="nameFriend" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="FriendDropdownList_SelectedIndexChanged" >
                    <asp:ListItem>All</asp:ListItem>
                </asp:dropdownlist>
                <asp:sqldatasource ID="friendDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryCollection %>" SelectCommand="SELECT DISTINCT [nameFriend] FROM [booksCol]"></asp:sqldatasource>
            </div>
        </div>
        

        <asp:gridview ID="grid" runat="server"  AutoGenerateColumns="False" DataSourceID="booksColDataSource" OnDataBound="grid_DataBound">
            <Columns>
                <asp:BoundField DataField="title" HeaderText="Title" />
                <asp:BoundField DataField="genre" HeaderText="Genre" />
                <asp:BoundField DataField="nameFriend" HeaderText="Friend" />
            </Columns>
        </asp:gridview>

        <asp:SqlDataSource ID="booksColDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryCollection %>" SelectCommand="SELECT * FROM [booksCol]">
            <SelectParameters>
                <asp:ControlParameter ControlID="genreDropdownList" DefaultValue="All" Name="genre" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="friendDropdownList" DefaultValue="All" Name="nameFriend" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Label ID="lblMsg" runat="server" Visible="False"></asp:Label>
    </div>
</asp:Content>

<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>