using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// class to represent the shopping cart
/// </summary>
public class Cart
{
    private List<CartItem> Items;
    public Cart()
    {
        Items = new List<CartItem>();
    }
    public List<CartItem> items
    {
        set { Items = value; }
        get { return Items; }
    }
    private int ItemIndexOf(int id)
    {
        foreach (CartItem item in Items)
        {
            if (item.ProductId.Equals(id))
            {
                return Items.IndexOf(item);
            }
        }
        return -1;
    }
   
    public void insert(CartItem item)
    {
        int index = ItemIndexOf(item.ProductId);
        if (index==-1)
        {
            Items.Add(item);
        }
        else
        {
            Items[index].ProductQuantity++;
        }

    }

    public void delete(int rowID)
    {
        Items.RemoveAt(rowID);
    }
    public void update(int row, int quantity)
    {
        if(quantity>0)
        {
            Items[row].ProductQuantity = quantity;
        }
        else
        {
            delete(row);
        }
    }
    public double total
    {
       get
            {
            if(Items==null)
            {
                return 0;
            }
            else
            {
                double total = 0;
                foreach(CartItem item in Items)
                {
                    total += item.ProductQuantity * item.ProductPrice;
                }
                return total;
            }
        }
    }
}