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
        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="idLibCol" DataSourceID="booksDataSource" 
                      AllowPaging="True" PageSize="10" OnRowCommand="grid_RowCommand"
        >
            <Columns>
                <asp:TemplateField HeaderText="Title">
                    <ItemTemplate>
                        <asp:LinkButton ID="bookDetails" runat="server" 
                                        CommandName='<%# Bind("title") %>' 
                                        CommandArgument='<%# Bind("idLibCol") %>' Text='<%# Bind("title") %>'
                        ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="author" HeaderText="Author" />
                <asp:BoundField DataField="isbn" HeaderText="ISBN" />              
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="booksDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:LibraryCollection %>"
            SelectCommand="SELECT * FROM [booksCol]"
        ></asp:SqlDataSource>
    </div>
</asp:Content>

<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>