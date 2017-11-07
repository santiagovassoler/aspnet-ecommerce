<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
   <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<!-- INSERT SOME' in place of caroussel -->
            
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 all_borders">
			<div class="row">
				<div class="col-md-12 single_border">
                    
                    <p>FILTER BY</p><hr />
                    
                    <h5>CATEGORY</h5>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    <asp:CheckBoxList ID="CheckBoxListCategory" style="font-style:normal" runat="server" DataSourceID="CategoryObject" DataTextField="name" DataValueField="name" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxListCategory_SelectedIndexChanged" RepeatLayout="Flow" OnCheckedChanged="CheckBoxListCategory_CheckedChanged" ></asp:CheckBoxList>
                    <asp:ObjectDataSource runat="server" ID="CategoryObject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CategoryTableAdapters.CategoryTableAdapter"></asp:ObjectDataSource>
                </div>
			</div>
			<div class="row">
				<div class="col-md-12 single_border">
					
                        <h5>SIZE</h5>
                        <asp:CheckBoxList ID="CheckBoxListSize" runat="server" DataSourceID="SizeObject" DataTextField="name" DataValueField="name" Font-Bold="False" AutoPostBack="True" RepeatLayout="Flow" OnSelectedIndexChanged="CheckBoxListSize_SelectedIndexChanged">
                        </asp:CheckBoxList>
                        <asp:ObjectDataSource runat="server" ID="SizeObject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SizeTableAdapters.SizeTableAdapter"></asp:ObjectDataSource>
                    
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					
                        <h5>COLOUR</h5>
                        
                        <asp:CheckBoxList ID="CheckBoxListColour" runat="server" DataSourceID="ColourObject" DataTextField="name" DataValueField="name" RepeatLayout="Flow" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxListColour_SelectedIndexChanged"></asp:CheckBoxList>
                        <asp:ObjectDataSource runat="server" ID="ColourObject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ColourTableAdapters.ColourTableAdapter"></asp:ObjectDataSource>
                    
				</div>
			</div>
		</div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-12">
                    
                        SORT BY:
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem value="0" Text="Price: Low to High" />
                            <asp:ListItem value="1" Text="Price: High to Low" />
                        </asp:DropDownList>
                    <asp:TextBox ID="txt_search"  runat="server"></asp:TextBox>
                    <asp:Button ID="btn_search" CssClass="btn btn-info" runat="server" Text="search" OnClick="btn_search_Click" />
                   <hr />
				</div>
			</div>
			<div class="row">
				<asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                <asp:ListView ID="productsList" runat="server" DataSourceID="dsrc_itemObject" DataKeyNames="Id">

                    <ItemTemplate>
                        <div class="col-lg-3 col-md-4 col-sm-4">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Id") %>' Visible="False" />
                            <img alt="Bootstrap Image Preview" class="img-responsive" src="images/<%# Eval("product_id") %>/<%# Eval("picture") %>">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("name") %>' />
                            £<asp:Label ID="Label3" runat="server" Text='<%# Eval("price", "{0:0.00}") %>' /><br />
                            
                            <a href='p/<%# Eval("url") %>'>View Details</a>


                        </div>
                    </ItemTemplate>

                   

                </asp:ListView>
                <asp:ObjectDataSource runat="server" ID="dsrc_itemObject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ItemTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
                <asp:ObjectDataSource runat="server" ID="sortbyObject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ItemTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
                <asp:ObjectDataSource runat="server" ID="ItemObject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ItemTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
                </div>  
                
              </div>
        </div>
    </div>
    
</asp:Content>

