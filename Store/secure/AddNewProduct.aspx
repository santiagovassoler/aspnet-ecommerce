<%@ Page Title="" Language="C#" MasterPageFile="~/secure/MasterPagePrivate.master" AutoEventWireup="true" CodeFile="AddNewProduct.aspx.cs" Inherits="secure_AddNewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="">
            
                <h2>Add New Product</h2> <hr /> 
                 <asp:Label ID="msg" runat="server" Text=""></asp:Label> 
                <div class="form-group">
                    <label class="control-label">NAME:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="sizing"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></span>
                        <asp:TextBox class="form-control" ID="txt_name" runat="server"></asp:TextBox>
                    </div>
                </div>
           
            
            <div class="form-group">
              <label class="control-label">DESCRIPTION:</label>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="si"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></span>
                    <asp:TextBox class="form-control" ID="txt_description" runat="server"></asp:TextBox>   
                </div>
            </div>

            
           
                <div class="form-group">
                    <label class="control-label">URL CODE</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span></span>
                        <asp:TextBox class="form-control" ID="txt_url" runat="server"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:Button class="btn btn-warning" ID="generate_url" Text="GENERATE CODE" runat="server" OnClick="generate_url_Click" />
                        </span>
                    </div>
                </div>
            
                <div class="form-group">
                    <div>
                        <asp:Button class="btn btn-info col-md-2" ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
                    </div>
                </div>
            
    </div>
    </div>
</asp:Content>

