<%@ Page Title="" Language="C#" MasterPageFile="~/secure/MasterPagePrivate.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h1>ADD NEW PRODUCT</h1>
        

                            <asp:GridView CssClass="table table-striped" ID="grid_product" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ObjectDataSource1" AllowSorting="True" GridLines="None">
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>

                                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description"></asp:BoundField>
                                    <asp:BoundField DataField="url" HeaderText="url" SortExpression="url"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProductTableAdapters.ProductTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="url" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="url" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource runat="server" ID="dsrc_productObject" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProductTableAdapters.ProductTableAdapter" InsertMethod="Insert" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="url" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="description" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="url" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:ObjectDataSource>
       <asp:DetailsView ID="product_details_view" runat="server" cssClass="table" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="dsrc_productObject" DefaultMode="Insert" GridLines="None">
           <Fields>
               <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
               <asp:TemplateField HeaderText="name" SortExpression="name">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <InsertItemTemplate>
                       <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="insert_product" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                   </InsertItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="description" SortExpression="description">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <InsertItemTemplate>
                       <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="insert_product" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                   </InsertItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label2" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:CommandField ShowInsertButton="True"></asp:CommandField>
           </Fields>
       </asp:DetailsView>
 
        <h1>Update Stock</h1>
        <asp:GridView CssClass="table" OnRowUpdating="grid_item_RowUpdating" ID="grid_item" runat="server" DataSourceID="ObjectDataSource2" AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="True" GridLines="None">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                <asp:BoundField DataField="sku" HeaderText="sku" SortExpression="sku"></asp:BoundField>
                <asp:BoundField DataField="product_id" HeaderText="product id" SortExpression="product_id"></asp:BoundField>
                <asp:BoundField DataField="size_id" HeaderText="size id" SortExpression="size_id"></asp:BoundField>
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>
                <asp:BoundField DataField="stock_qty" HeaderText="stock qty" SortExpression="stock_qty"></asp:BoundField>
                <asp:BoundField DataField="category_id" HeaderText="category id" SortExpression="category_id"></asp:BoundField>
                <asp:BoundField DataField="colour_id" HeaderText="colour id" SortExpression="colour_id"></asp:BoundField>
                <asp:BoundField DataField="picture" HeaderText="picture" SortExpression="picture"></asp:BoundField>


            </Columns>
        </asp:GridView>

        <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="InsertItemTableAdapters.ItemTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="sku" Type="String"></asp:Parameter>
                <asp:Parameter Name="product_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="size_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="price" Type="Double"></asp:Parameter>
                <asp:Parameter Name="stock_qty" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="category_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="colour_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="picture" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="sku" Type="String"></asp:Parameter>
                <asp:Parameter Name="product_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="size_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="price" Type="Double"></asp:Parameter>
                <asp:Parameter Name="stock_qty" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="category_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="colour_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="picture" Type="String"></asp:Parameter>
                <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource runat="server" ID="insert_item" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="InsertItemTableAdapters.ItemTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="url" Type="String"></asp:Parameter>
                <asp:Parameter Name="sku" Type="String"></asp:Parameter>
                <asp:Parameter Name="product_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="size_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="price" Type="Double"></asp:Parameter>
                <asp:Parameter Name="stock_qty" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="category_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="colour_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="picture" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="url" Type="String"></asp:Parameter>
                <asp:Parameter Name="sku" Type="String"></asp:Parameter>
                <asp:Parameter Name="product_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="size_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="price" Type="Double"></asp:Parameter>
                <asp:Parameter Name="stock_qty" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="category_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="colour_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="picture" Type="String"></asp:Parameter>
                <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource runat="server" ID="dscr_itemObject" DataObjectTypeName="Item+DataTable1DataTable" DeleteMethod="Fill" InsertMethod="Fill" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ItemTableAdapters.DataTable1TableAdapter" UpdateMethod="Fill"></asp:ObjectDataSource>
        <asp:DetailsView ID="items_detail" runat="server" class="table" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="insert_item_object" DefaultMode="Insert" GridLines="None">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                <asp:BoundField DataField="url" HeaderText="url" SortExpression="url"></asp:BoundField>
                <asp:BoundField DataField="sku" HeaderText="sku" SortExpression="sku"></asp:BoundField>
                <asp:BoundField DataField="product_id" HeaderText="product_id" SortExpression="product_id"></asp:BoundField>
                <asp:BoundField DataField="size_id" HeaderText="size_id" SortExpression="size_id"></asp:BoundField>
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>
                <asp:BoundField DataField="stock_qty" HeaderText="stock_qty" SortExpression="stock_qty"></asp:BoundField>
                <asp:BoundField DataField="category_id" HeaderText="category_id" SortExpression="category_id"></asp:BoundField>
                <asp:BoundField DataField="colour_id" HeaderText="colour_id" SortExpression="colour_id"></asp:BoundField>
                <asp:BoundField DataField="picture" HeaderText="picture" SortExpression="picture"></asp:BoundField>

                <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                <asp:ImageField></asp:ImageField>
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource runat="server" ID="insert_item_object" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="InsertItemTableAdapters.ItemTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="url" Type="String"></asp:Parameter>
                <asp:Parameter Name="sku" Type="String"></asp:Parameter>
                <asp:Parameter Name="product_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="size_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="price" Type="Double"></asp:Parameter>
                <asp:Parameter Name="stock_qty" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="category_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="colour_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="picture" Type="String"></asp:Parameter>

                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="url" Type="String"></asp:Parameter>
                <asp:Parameter Name="sku" Type="String"></asp:Parameter>
                <asp:Parameter Name="product_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="size_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="price" Type="Double"></asp:Parameter>
                <asp:Parameter Name="stock_qty" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="category_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="colour_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="picture" Type="String"></asp:Parameter>
                <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:ObjectDataSource>
   
			
</asp:Content>

