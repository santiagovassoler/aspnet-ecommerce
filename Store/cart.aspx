<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Shooping Cart</h1>
 <div class="col-md-6">
       <asp:GridView class="table table-striped" ID="gridShoppingCart" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="gridShoppingCart_RowCancelingEdit" OnRowDeleting="gridShoppingCart_RowDeleting" OnRowEditing="gridShoppingCart_RowEditing" OnRowUpdating="gridShoppingCart_RowUpdating" BorderStyle="None" GridLines="None">
        <Columns>
            <asp:BoundField DataField="productName" HeaderText="Product Name" ReadOnly="True" />
            <asp:BoundField DataField="productPrice" HeaderText="Price" ReadOnly="True" />
            <asp:BoundField DataField="productQuantity" HeaderText="Quantity" />
            <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
            <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
        </Columns>
        <EmptyDataTemplate>
           
        </EmptyDataTemplate>
    </asp:GridView>
     </div>
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/placeorder" Visible="False">Place Order</asp:LinkButton>
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/home">Continue shopping</asp:LinkButton>
    <asp:Label ID="lbl_total" runat="server" Text=""></asp:Label>
</asp:Content>

