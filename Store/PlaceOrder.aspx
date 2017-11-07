<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="container">
        <div class="row">
           <h2>Your items</h2><hr />
            <div class="col-xs-12 col-md-4">
    <asp:GridView class="table table-striped" GridLines="None" cssClass="table" ID="gridShoppingCart" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="productName" HeaderText="Product Name" ReadOnly="True" />
            <asp:BoundField DataField="productPrice" HeaderText="Price" ReadOnly="True" />
            <asp:BoundField DataField="productQuantity" HeaderText="Quantity" />
        </Columns>
        <EmptyDataTemplate>
        </EmptyDataTemplate>

    </asp:GridView>
    <asp:Label ID="lbl_total" runat="server" Text="" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                </div>
            </div>
        </div>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <div class="container">
        <div class="row">
           
            <div class="col-xs-12 col-md-4">     
                <div class="panel panel-default credit-card-box">
                    <div class="panel-heading display-table">
                        <div class="row display-tr">
                            <h3 class="panel-title display-td">Payment Details</h3>
                            <div class="display-td">
                                <img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <form role="form" id="payment-form" method="POST" action="javascript:void(0);">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="cardNumber">CARD NUMBER</label>
                                        <div class="input-group">
                                            <input type="tel" class="form-control" name="cardNumber" placeholder="Valid Card Number" autocomplete="cc-number" required autofocus />
                                            <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-7 col-md-7">
                                    <div class="form-group">
                                        <label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
                                        <input type="tel" class="form-control" name="cardExpiry" placeholder="MM / YY" autocomplete="cc-exp"required />
                                    </div>
                                </div>
                                <div class="col-xs-5 col-md-5 pull-right">
                                    <div class="form-group">
                                        <label for="cardCVC">CV CODE</label>
                                        <input type="tel"class="form-control" name="cardCVC" placeholder="CVC" autocomplete="cc-csc" required />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="couponCode">COUPON CODE</label>
                                        <input type="text" class="form-control" name="couponCode" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    
                                    <asp:Button class="subscribe btn btn-success btn-lg btn-block" ID="Button1" runat="server" Text="Pay now" OnClick="Button1_Click" />
                                </div>
                            </div>
                            <div class="row" style="display: none;">
                                <div class="col-xs-12">
                                    <p class="payment-errors"></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                </div>
                </div>
            </div>
    
    
</asp:Content>

