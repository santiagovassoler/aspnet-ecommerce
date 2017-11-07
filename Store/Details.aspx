<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    <asp:ListView ID="productListView" runat="server" DataSourceID="querybyid">
        <ItemTemplate>

            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="panel panel-default  panel--styled">
                            <div class="panel-body">
                                <div class="col-md-12 panelTop">
                                    <div class="col-md-4">
                                        <img alt="product" class="img-responsive" src="/../images/<%# Eval("product_id") %>/<%# Eval("picture") %>">
                                    </div>
                                    <div class="col-md-8">
                                        <h2>
                                            <asp:Label Text='<%# Eval("name") %>' runat="server" ID="Label6" /></h2>
                                        <p>
                                            <asp:Label Text='<%# Eval("description") %>' runat="server" ID="Label7" /></p>
                                </div>
                                </div>

                                <div class="col-md-12 panelBottom">
                                    <div class="col-md-4 text-center">
                                        <asp:Button class="btn btn-lg btn-add-to-cart" ID="Button1" runat="server" OnClick="Button1_Click" Text="Add to Cart" />

                                    </div>
                                    <div class="col-md-4 text-left">
                                        <h5>Price <span class="itemPrice">£<asp:Label Text='<%# Eval("price") %>' runat="server" ID="Label8" /></span></h5>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="stars">
                                            <div id="stars" class="starrr"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ItemTemplate>

    </asp:ListView>

    <asp:SqlDataSource runat="server" ID="querybyid" ConnectionString='<%$ ConnectionStrings:DatabaseConnectionString %>' SelectCommand="SearchById" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" Name="id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ObjectDataSource runat="server" ID="SearchById" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ItemTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>



</asp:Content>

