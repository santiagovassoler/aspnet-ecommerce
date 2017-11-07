using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string category = string.Empty;
    string size = string.Empty;
    string colour = string.Empty;
    private static byte[] _optionalEntropy = { 9, 8, 7, 6, 5 };

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
       
    }
    
        
      protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;
                          AttachDbFilename=F:\SSP_MVC\Store\App_Data\Database.mdf;
                          Integrated Security=True;
                          Connect Timeout=10;";
        SqlCommand command = new SqlCommand("SortByPrice", conn);
        command.CommandType = CommandType.StoredProcedure;
        SqlParameter parameter = new SqlParameter();
        parameter.ParameterName = "@param1";
        parameter.SqlDbType = SqlDbType.Int;
        parameter.Value = DropDownList1.SelectedItem.Value;
        command.Parameters.Add(parameter);
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        productsList.DataSource = ds;
        productsList.DataSourceID = null;
        productsList.DataBind();

   }


    protected void CheckBoxListCategory_SelectedIndexChanged(object sender, EventArgs e)
    {

        
        for (int i = 0; i < CheckBoxListCategory.Items.Count; i++)
        {
            if (CheckBoxListCategory.Items[i].Selected)
            {
                category += CheckBoxListCategory.Items[i].Value + ",";
            }
            filterBy(category, size, colour);
        }
    }

    protected void CheckBoxListSize_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        for (int i = 0; i < CheckBoxListSize.Items.Count; i++)
        {
            if (CheckBoxListSize.Items[i].Selected)
            {
                size += CheckBoxListSize.Items[i].Value + ",";
            }
            filterBy(category, size, colour);
        }
    }

    protected void CheckBoxListColour_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        for (int i = 0; i < CheckBoxListColour.Items.Count; i++)
        {
            if (CheckBoxListColour.Items[i].Selected)
            {
                colour += CheckBoxListColour.Items[i].Value + ",";
            }
            filterBy(category, size, colour);
        }
    }
    public void filterBy(string ctg, string sz, string cl)
    {
        Label5.Text = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("test", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@list", ctg);
        cmd.Parameters.AddWithValue("@sizelist", sz);
        cmd.Parameters.AddWithValue("@colourlist", cl);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet dt = new DataSet();
        adp.Fill(dt);
        con.Close();
        productsList.DataSource = dt;
        productsList.DataSourceID = null;
        productsList.DataBind();
    }

   public void search(string search)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("Search", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@search", search);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet dt = new DataSet();
        adp.Fill(dt);
        con.Close();
        productsList.DataSource = dt;
        productsList.DataSourceID = null;
        productsList.DataBind();
    }


    protected void btn_search_Click(object sender, EventArgs e)
    {
        search(txt_search.Text);
        if (productsList.Items.Count == 0)
        {
            Label5.Text = "Your search - " + txt_search.Text + " - did not match any products.<br> Suggestions: <br>" +
                "<ul><li>Make sure that all words are spelled correctly." +
                "<li>Try different keywords.</li>" +
                "<li>Try more general keywords.</li></ul>";
        }else
        {
            Label5.Text = "";
        }
    }
}
