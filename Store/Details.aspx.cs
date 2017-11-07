using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Details : System.Web.UI.Page
{
    Cart myCart;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!this.IsPostBack)
        {

            if (Page.RouteData.Values["url"] != null)
            {
                string url = Page.RouteData.Values["url"].ToString();
                populateProductDetails(url);

            }
          
           
        }
    }

    private void populateProductDetails(string url)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString());
        con.Open();
        SqlCommand command = new SqlCommand("SearchByURL", con);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@url", url);
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        productListView.DataSource = ds;
        productListView.DataSourceID = null;
        productListView.DataBind();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
        
        var id = Page.RouteData.Values["url"] as string;
        
        if (Session["myCart"] == null)
        {
            myCart = new Cart();
            Session["myCart"] = myCart;
        }
        myCart = (Cart)Session["myCart"];
        DataTable dt = DataAccess.selectProcedure("SearchByURL", id, "@url");
        DataRow row = dt.Rows[0];
        myCart.insert(new CartItem(Convert.ToInt32(row["id"]),
            row["name"].ToString(),
            row["description"].ToString(),
            Double.Parse(row["price"].ToString()),
            1));
        Response.Redirect("/cart.aspx");
        
    }
    public void getClolourAndSize()
    {
        var id = Page.RouteData.Values["url"] as string;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString());
        con.Open();
        SqlCommand command = new SqlCommand("DisplayBySizeOrColour", con);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@url", id);
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        productListView.DataSource = ds;
        productListView.DataSourceID = null;
        productListView.DataBind();
    }

   

}

      
