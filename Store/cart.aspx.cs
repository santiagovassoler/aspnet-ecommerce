using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
    Cart myCart;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["myCart"]==null)
         {
             Session["myCart"] = new Cart();
         }
         myCart = (Cart)Session["myCart"];
        if (!IsPostBack)
        {
            fillData();
        }
      
    }
    /*
     * bind the grid with shopping cart details
     */
    private void fillData()
    {
        gridShoppingCart.DataSource = myCart.items;
          gridShoppingCart.DataBind();
         if(myCart.items.Count ==0)
         {
            lbl_total.Text = "<h3'>Your basket is empty!<h3>";
        }
          else
          {
          lbl_total.Text = "Total £" + myCart.total.ToString();
           lbl_total.Visible = true;
            LinkButton1.Visible = true;
          }
    }


    protected void gridShoppingCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridShoppingCart.EditIndex = -1;
        fillData();
    }

    protected void gridShoppingCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        myCart.delete(e.RowIndex);
        fillData();
    }

    protected void gridShoppingCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtQuantity = (TextBox)gridShoppingCart.Rows[e.RowIndex].Cells[2].Controls[0];
        int quantity = Int32.Parse(txtQuantity.Text);
        myCart.update(e.RowIndex, quantity);
        gridShoppingCart.EditIndex = -1;
        fillData();
    }

    protected void gridShoppingCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gridShoppingCart.EditIndex = e.NewEditIndex;
        fillData();
    }
}

  