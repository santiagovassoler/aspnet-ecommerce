<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="col-md-8">
        
        <div class="col-md-4 ">
            <h1>Register</h1><hr />
            <asp:Label ID="lbl_error" runat="server" Text=""></asp:Label>
       
         <div class="form-group">
                <label class="control-label">NAME:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="as"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                       <asp:TextBox class="form-control" ID="txt_name" runat="server"></asp:TextBox>
                    </div>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="required!" ControlToValidate="txt_name" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

         <div class="form-group">
                <label class="control-label">EMAIL:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="s1"><span class="glyphicon glyphicon-send" aria-hidden="true"></span></span>
                      <asp:TextBox class="form-control" ID="txt_email" runat="server"></asp:TextBox><br />
                      
                    </div>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="required!" ControlToValidate="txt_email" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
         <div class="form-group">
                <label class="control-label">PASSWORD:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="s2"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                      <asp:TextBox class="form-control" ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
                      
                    </div>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="required!" ControlToValidate="txt_password" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
         <div class="form-group">
                <label class="control-label">MOBILE:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="s3"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span></span>
                       <asp:TextBox class="form-control" ID="txt_mobile" runat="server"></asp:TextBox>
                        
                    </div>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="required!" ControlToValidate="txt_mobile" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
         <div class="form-group">
                <label class="control-label">ADDRESS:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="s4"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></span>
                       <asp:TextBox class="form-control" ID="txt_address" runat="server"></asp:TextBox>
                        
                    </div>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="required!" ControlToValidate="txt_address" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

        <div class="form-group">
                <div>
                     <asp:Button ID="btn_register"  cssClass="btn btn-success col-md-2" runat="server" Text="Register" OnClick="btn_register_Click" />
                    
                </div>
            </div>


            </div>



        <div class="col-md-4 ">
            <h1>Sign in</h1><hr />
            <asp:Label ID="lbl_log_error" runat="server" Text=""></asp:Label>
            <div class="form-group">
                <label class="control-label">EMAIL:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="s"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                       <asp:TextBox class="form-control" ID="txt_email_login" runat="server"></asp:TextBox>
                       
                    </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="required!" ValidationGroup="masterGroup" ControlToValidate="txt_email_login" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            <div class="form-group">
                <label class="control-label">PASSWORD:</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon" id="i"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                        <asp:TextBox class="form-control" ID="txt_pwd_login" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="required!" ValidationGroup="masterGroup" ControlToValidate="txt_pwd_login" CssClass="alert-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
             <div class="form-group">
                <div>
                    <asp:Button ID="btn_login" ValidationGroup="masterGroup" cssClass="btn btn-success col-md-2"  runat="server" Text="Logg in" OnClick="btn_login_Click" />
                </div>
            </div>
            
            
            
        </div>
    </div>
</asp:Content>

