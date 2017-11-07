using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Authentication;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCrypt.Net;
using System.Web.Security;
using System.Collections;

public partial class Login : System.Web.UI.Page
{
    List<String> li;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            
            Response.Redirect("/home");
        }
             
    }

    protected void btn_register_Click(object sender, EventArgs e)
    {
        lbl_error.Text = "";
        lbl_log_error.Text = "";
        if (!chechEmail(txt_email.Text))
        {
 
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT into [User](email, password, mobile, address, name) VALUES (@email, @password, @mobile,@address,@name)";
                    cmd.Parameters.AddWithValue("@email", txt_email.Text);
                    cmd.Parameters.AddWithValue("@password", (Encrypt.encryptPassword(txt_password.Text)));
                    cmd.Parameters.AddWithValue("@mobile", txt_mobile.Text);
                    cmd.Parameters.AddWithValue("@address", txt_address.Text);
                    cmd.Parameters.AddWithValue("@name", txt_name.Text);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        lbl_log_error.Text = "<span class='alert-success'>You can now login</span>";
                    }
                    catch (SqlException ex)
                    {
                        lbl_error.Text = ex.Message.ToString() + "Error Message";
                    }

                }
            }
        }
        else
        {
            lbl_error.Text = "<span class='alert-danger'>Email already taken</span>";
        }
    }

    private Boolean chechEmail(string email)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT COUNT(*) FROM [User] WHERE email=@email";
                cmd.Parameters.AddWithValue("@email", email);
                conn.Open();
                Int32 count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count>0)
                {
                    return true;
                }else
                {
                    return false;
                }
            }
        }
    }
    public void logout()
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }

    private bool authenticateviaWebConfig()
    {
        if (System.Web.Security.FormsAuthentication.Authenticate(txt_email_login.Text, txt_pwd_login.Text))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        if (authenticateviaWebConfig() == false)
        {

            lbl_log_error.Text = "";
            lbl_error.Text = "";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT password from [User] WHERE email=@email";
                    cmd.Parameters.AddWithValue("@email", txt_email_login.Text);
                    conn.Open();
                    string pwd = "";

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            pwd = Convert.ToString(reader["password"]);
                            if (Encrypt.ValidatePassword(txt_pwd_login.Text, pwd))
                            {
                                // Authenticated
                                lbl_log_error.Text = "<span class='alert-success'>Login successfull</span>";
                                FormsAuthentication.SetAuthCookie(txt_email_login.Text, true);
                                Response.Redirect("/home");
                            }
                            else
                            {
                                lbl_log_error.Text = "<div class='alert-danger'><span class='glyphicon glyphicon-exclamation-sign'></span><span class='sr-only'>Error:</span>Wrong username or password</div>";
                            }
                        }
                        else
                        {
                            lbl_log_error.Text = "<div class='alert-danger'><span class='glyphicon glyphicon-exclamation-sign'></span><span class='sr-only'>Error:</span>Wrong username or password</div>";
                        }


                    }


                }
            }
        }
        else
        {
            FormsAuthentication.SetAuthCookie(txt_email_login.Text, true);
        }
    }
   
}