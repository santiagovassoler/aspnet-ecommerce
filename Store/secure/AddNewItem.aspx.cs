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

public partial class secure_AddNewItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_upload_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString());
        con.Open();
        if (fupl_image.HasFile)
        {
            // default image size is 4MB
            if (fupl_image.PostedFile.ContentLength > 4000000)
            {
                lbl_message.Text = "<p class=alert-danger>file size must be less than 4MB</p>";
            }
            else
            {
                
                var NewDir = Directory.CreateDirectory(@"F:\SSP_MVC\Store\images\"+prod_id_list.SelectedValue);
                var pathF = @"F:\SSP_MVC\Store\images\" + prod_id_list.SelectedValue;
               
                var fileName = DateTime.Now.ToFileTime() + Path.GetFileName(fupl_image.FileName);
                
                fupl_image.SaveAs(Path.Combine(pathF,fileName));

                lbl_message.Text = "Received " + fupl_image.FileName + ", Content Type " + fupl_image.PostedFile.ContentType + ", Length " + fupl_image.PostedFile.ContentLength;
                string mysql;
                mysql = "insert into item (sku,product_id,size_id,price,stock_qty,category_id,colour_id,picture) values (@param1,@param2,@param3,@param4,@param5,@param6,@param7,@param8)";
               
                SqlCommand cmd = new SqlCommand(mysql, con);
                cmd.Parameters.AddWithValue("@param1", txt_sku.Text);
                cmd.Parameters.AddWithValue("@param2", prod_id_list.SelectedValue);
                cmd.Parameters.AddWithValue("@param3", size_id_list.SelectedValue);
                cmd.Parameters.AddWithValue("@param4", txt_price.Text);
                cmd.Parameters.AddWithValue("@param5", txt_stock.Text);
                cmd.Parameters.AddWithValue("@param6", cat_id_list.SelectedValue);
                cmd.Parameters.AddWithValue("@param7", colour_id_list.SelectedValue);
                cmd.Parameters.AddWithValue("@param8", fileName);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();

            }
        }

        else
        {
            lbl_message.Text = "Image was not uploaded";
        }
    }

    public String generateSKU()
    {
        Random random = new Random();
        string input = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder builder = new StringBuilder();
        char ch;
        for (int i = 0; i < 13; i++)
        {
            ch = input[random.Next(0, input.Length)];
            builder.Append(ch);
        }
        return builder.ToString();
    }

    protected void generate_sku_Click(object sender, EventArgs e)
    {
        txt_sku.Text = generateSKU();
    }
}