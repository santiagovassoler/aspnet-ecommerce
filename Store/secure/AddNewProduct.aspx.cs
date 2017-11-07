using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class secure_AddNewProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void addProduct()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString());
        con.Open();
        string mysql;
        mysql = "insert into Product (name,description,url) values (@param1,@param2,@param3)";
        SqlCommand cmd = new SqlCommand(mysql, con);
        cmd.Parameters.AddWithValue("@param1", txt_name.Text);
        cmd.Parameters.AddWithValue("@param2", txt_description.Text);
        cmd.Parameters.AddWithValue("@param3", txt_url.Text);
        cmd.CommandType = CommandType.Text;
        //cmd.ExecuteNonQuery();

        try
        {
            cmd.ExecuteNonQuery();
            msg.Text = "<div class='alert alert-success'><a href='#' class='close' data-dismiss='alert'>&times;</a> <strong>Success!</strong>" + "Your product has been saved successfully.</div>";
        }
        catch (Exception ex)
        {
            msg.Text = "<div class='alert alert-danger'><a href='#' class='close' data-dismiss='alert'>&times;</a> <strong>OW SNAP!</strong>" + "Something went wrong, please try again :(.</div>";
           
        }
    }

    protected void generate_url_Click(object sender, EventArgs e)
    {
        txt_url.Text = generateURL();
    }

    protected void Save_Click(object sender, EventArgs e)
    {
        addProduct();
       
       // Response.Redirect("AddNewProduct.aspx");
    }
    public String generateURL()
    {
        Random random = new Random();
        string input = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!_=-+";
        StringBuilder builder = new StringBuilder();
        char ch;
        for (int i = 0; i < 11; i++)
        {
            ch = input[random.Next(0, input.Length)];
            builder.Append(ch);
        }
        return builder.ToString();
    }
}