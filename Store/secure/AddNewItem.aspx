<%@ Page Title="" Language="C#" MasterPageFile="~/secure/MasterPagePrivate.master" AutoEventWireup="true" CodeFile="AddNewItem.aspx.cs" Inherits="secure_AddNewItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
            <div class="col-md-12">
                <h2>ADD ITEM TO STOCK</h2><hr />
                <asp:Label ID="lbl_message" runat="server" Text=""></asp:Label>
            </div>       

             <div class="form-group">
               <label class="control-label">SKU CODE:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="si2"><span class="glyphicon glyphicon-barcode" aria-hidden="true"></span></span>
                        <asp:TextBox ID="txt_sku" class="form-control" runat="server"></asp:TextBox>
                         <span class="input-group-btn">
                          <asp:Button class="btn btn-warning" ID="generate_sku" runat="server" Text="generate" OnClick="generate_sku_Click" />
                         </span>
                    </div>
                </div>
           
             <div class="form-group">
               <label class="control-label">PRODUCT ID:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="si3"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                        <asp:DropDownList class="form-control" ID="prod_id_list" runat="server" DataSourceID="prod_id_obj" DataTextField="Id" DataValueField="Id"></asp:DropDownList>
                        <asp:ObjectDataSource runat="server" ID="prod_id_obj" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProductTableAdapters.ProductTableAdapter"></asp:ObjectDataSource>
                    </div>
                </div>
           

             <div class="form-group">
               <label class="control-label">SIZE:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="si4"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span></span>
                        <asp:DropDownList class="form-control" ID="size_id_list" runat="server" DataSourceID="size_id_obj" DataTextField="name" DataValueField="Id"></asp:DropDownList>
                        <asp:ObjectDataSource runat="server" ID="size_id_obj" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SizeTableAdapters.SizeTableAdapter"></asp:ObjectDataSource>
                    </div>
                </div>
           

             <div class="form-group">
                <label class="control-label">PRICE:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="si5"><span class="glyphicon glyphicon-gbp" aria-hidden="true"></span></span>
                       <asp:TextBox ID="txt_price" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
           

             <div class="form-group">
               <label class="control-label">STOCK QUANTITY:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="si6"><span class="glyphicon glyphicon-import" aria-hidden="true"></span></span>
                        <asp:TextBox ID="txt_stock" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
           

            <div class="form-group">
                <label class="control-label">CATEGORY:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="si7"><span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span></span>
                         <asp:DropDownList class="form-control" ID="cat_id_list" runat="server" DataSourceID="cat_id_obj" DataTextField="name" DataValueField="Id"></asp:DropDownList>
                         <asp:ObjectDataSource runat="server" ID="cat_id_obj" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CategoryTableAdapters.CategoryTableAdapter"></asp:ObjectDataSource>
                    </div>
                </div>
            

              <div class="form-group">
                <label class="control-label">COLOUR:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="si8"><span class="glyphicon glyphicon-tint" aria-hidden="true"></span></span>
                       <asp:DropDownList class="form-control" ID="colour_id_list" runat="server" DataSourceID="colour_id_obj" DataTextField="name" DataValueField="Id"></asp:DropDownList>
                       <asp:ObjectDataSource runat="server" ID="colour_id_obj" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ColourTableAdapters.ColourTableAdapter"></asp:ObjectDataSource>
                    </div>
                </div>
           
        <div class="form-group">
                <label class="control-label">PICTURE:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="si1"><span class="glyphicon glyphicon-picture" aria-hidden="true"></span></span>
                        <asp:FileUpload CssClass="form-control" ID="fupl_image" runat="server" />       
                    </div>
                </div>

            <div class="form-group">
                <div>
                    <asp:Button ID="btn_upload"  runat="server" cssClass="btn btn-success col-md-2" Text="save" OnClick="btn_upload_Click" />
                </div>
            </div>
                
    </div>
</asp:Content>

