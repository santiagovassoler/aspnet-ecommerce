using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin : System.Web.UI.Page
{
    string txt = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
    }

 
    protected void grid_item_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
      string txt =  ((TextBox)grid_item.Rows[e.RowIndex].FindControl("txt_url")).Text;
    }
   
    protected void upload_click(object sender , EventArgs e)
    {
        /*
        if (fupl_image.HasFile)
        {
            // default image size is 4MB
            if (fupl_image.PostedFile.ContentLength > 4000000)
            {
                lbl_message.Text = "<p class=alert-danger>file size must be less than 4MB</p>";
            }
            else
            {
                //String sPath = MapPath(fupl_image.FileName);
                //save image as combining path and image name
                var fileName = Path.GetFileName(fupl_image.FileName);
                fupl_image.SaveAs(Path.Combine(@"F:\SSP-ASP\svassoler\images", fileName));
                //fupl_image.PostedFile.SaveAs(sPath);

                lbl_message.Text = "Received " + fupl_image.FileName + ", Content Type " + fupl_image.PostedFile.ContentType + ", Length " + fupl_image.PostedFile.ContentLength;
                string mysql;
                mysql = "insert into pictures (picture,title) values ('" + fupl_image.FileName + "','" + txt_title.Text + "')";
                SqlDataSource1.SelectCommand = mysql;
                dl_pictures.DataBind();
                Response.Redirect("exercise13.aspx");
            }
        }

        else
        {
            lbl_message.Text = "Image was not uploaded";
        }

    }
    */
}

}