using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// class to represent the items in the shooping cart
/// </summary>
public class CartItem
{
    private int productId;
    private string productName;
    private double productPrice;
    private int productQuantity; 
    private string productDescription;
    public CartItem()
    {
    }
    public CartItem(int productId, string productName, string productDescription, double productPrice,int productQuantity)
    {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productDescription = productDescription;
        this.productQuantity = productQuantity;
    }
    public int ProductId
    {
        get { return productId; }
        set { productId = value; }
    }

    public string ProductName
    {
        get { return productName; }
        set { productName = value; }
    }

    public double ProductPrice
    {
        get { return productPrice; }
        set { productPrice = value; }
    }
    public string ProductDescription
    {
        get { return productDescription; }
        set { ProductDescription = value; }
    }
    public int ProductQuantity
    {
        get { return productQuantity; }
        set { productQuantity = value; }
    }
}