using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlaceOrder : System.Web.UI.Page
{
    Cart myCart;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated) {
            if (Session["myCart"] == null)
            {
                Session["myCart"] = new Cart();
            }
            myCart = (Cart)Session["myCart"];
            if (!IsPostBack)
            {
                fillData();
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
        
    }
    private void fillData()
    {
        gridShoppingCart.DataSource = myCart.items;
        gridShoppingCart.DataBind();
        if (myCart.items.Count == 0)
        {
            
            lbl_total.Text = "<h3 class='alert alert-danger'>Your basket is empty!<h3>";
        }
        else
        {
            lbl_total.Text = "Total £" + myCart.total.ToString();
            lbl_total.Visible = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
        foreach (CartItem it in myCart.items)
        {
            
            updateStock(Convert.ToInt32(it.ProductId), Convert.ToInt32(it.ProductQuantity));
        }
       
    }
    public void updateStock(int id, int qty)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("PlaceOrder", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@qty", qty);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet dt = new DataSet();
        adp.Fill(dt);
        object result = cmd.ExecuteScalar();
        if (result != DBNull.Value)
        {
            Session["myCart"] = null;
        }
        con.Close();

        
    }

   
}