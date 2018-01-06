<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>

<%@ Page Title="Book Details" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="BookDetails.aspx.cs" Inherits="BookDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" Runat="Server">   
    <div class="col-sm-offset-2 col-sm-8">
        <%--message--%>
        <asp:literal ID="lit" runat="server"></asp:literal>       
        <%--details view--%>
        <asp:detailsview id="bookDetails" runat="server" autogeneraterows="False" 
                         datakeynames="idLibCol" datasourceid="bookDataSource" 
                         OnItemDeleted="bookDetails_ItemDeleted" >            
            <Fields>
                <asp:BoundField DataField="idLibCol" HeaderText="Id" SortExpression="idLibCol" ReadOnly="True" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:BoundField DataField="author" HeaderText="Author" SortExpression="author" />
                <asp:BoundField DataField="isbn" HeaderText="ISBN" SortExpression="isbn" />
                <asp:TemplateField HeaderText="Genre template" SortExpression="genre">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlGenre" runat="server" CssClass="btn btn-sm btn-default dropdown-toggle" 
                                          DataSourceID="genreDataSource" DataTextField="genre" DataValueField="genre" 
                                          SelectedValue=<%# Bind("genre") %> Enabled="False">
                        </asp:DropDownList>                        
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlGenre" runat="server" CssClass="btn btn-sm btn-default dropdown-toggle" 
                                          DataSourceID="genreDataSource" DataTextField="genre" DataValueField="genre" 
                                          SelectedValue=<%# Bind("genre") %> >
                        </asp:DropDownList>
                        &nbsp;
                        <asp:LinkButton ID="lkBtnAdd" runat="server" OnClick="lkBtnAdd_Click" >New Genre</asp:LinkButton>                           
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="pages" HeaderText="Pages" SortExpression="pages" />
                <asp:BoundField DataField="nameFriend" HeaderText="Friend" SortExpression="nameFriend" />
                <asp:BoundField DataField="comments" HeaderText="Comments" SortExpression="comments" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Fields>
        </asp:detailsview>
        <%--back button--%>
        <asp:linkbutton runat="server" CssClass="btn-back" postbackurl="~/Books.aspx">Back</asp:linkbutton>

        

<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>
        <%--sql datasource--%>
        <asp:sqldatasource id="bookDataSource" runat="server" connectionstring="<%$ ConnectionStrings:LibraryCollection %>"
                           selectcommand="SELECT * FROM [booksCol] WHERE ([idLibCol] = @idLibCol)" 
                           DeleteCommand="DELETE FROM [booksCol] WHERE [idLibCol] = @idLibCol" 
                           InsertCommand="INSERT INTO [booksCol] ([idLibCol], [title], [author], [isbn], [genre], [pages], [landedFriend], [nameFriend], [comments]) VALUES (@idLibCol, @title, @author, @isbn, @genre, @pages, @landedFriend, @nameFriend, @comments)" 
                           UpdateCommand="UPDATE [booksCol] SET [title] = @title, [author] = @author, [isbn] = @isbn, [genre] = @genre, [pages] = @pages, [landedFriend] = @landedFriend, [nameFriend] = @nameFriend, [comments] = @comments WHERE [idLibCol] = @idLibCol">
            <DeleteParameters>
                <asp:Parameter Name="idLibCol" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idLibCol" Type="Int32" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="isbn" Type="String" />
                <asp:Parameter Name="genre" Type="String" />
                <asp:Parameter Name="pages" Type="Int32" />
                <asp:Parameter Name="landedFriend" Type="String" />
                <asp:Parameter Name="nameFriend" Type="String" />
                <asp:Parameter Name="comments" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="idLibCol" SessionField="idLibCol" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="isbn" Type="String" />
                <asp:Parameter Name="genre" Type="String" />
                <asp:Parameter Name="pages" Type="Int32" />
                <asp:Parameter Name="landedFriend" Type="String" />
                <asp:Parameter Name="nameFriend" Type="String" />
                <asp:Parameter Name="comments" Type="String" />
                <asp:Parameter Name="idLibCol" Type="Int32" />
            </UpdateParameters>
        </asp:sqldatasource>

        <asp:SqlDataSource ID="genreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryCollection %>" 
                           SelectCommand="SELECT distinct [genre] FROM [booksCol]"></asp:SqlDataSource>      
    </div>
</asp:Content>

<%--*******************************
    * Name: Eduardo Go Matsushita *
    * Student Id: 300904663       *
    *******************************--%>