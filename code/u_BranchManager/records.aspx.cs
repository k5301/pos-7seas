using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class u_BranchManager_records : System.Web.UI.Page
{
    string pth;
    DataTable dt;
    conn obj;

    public void settotalamount()
    {
        float bill = 0,tax=0,vat =0,dis=0, total =0;

        foreach (GridViewRow row in grdOrdersList.Rows)
        {
            Label _total = (Label)row.FindControl("lblInpocket");
            Label _bill = (Label)row.FindControl("lblTotal");
            Label _tax = (Label)row.FindControl("lblTaxAmount");
            Label _vat = (Label)row.FindControl("lblVatAmount");
            Label _dis = (Label)row.FindControl("lblDiscount");
            total = total + float.Parse(_total.Text);
            bill = bill + float.Parse(_bill.Text);
            tax = tax + float.Parse(_tax.Text);
            vat = vat + float.Parse(_vat.Text);
            dis = dis + float.Parse(_dis.Text);
        }
        lblTotalIn.Text = total.ToString();
        lblTotalTaxAmount.Text = tax.ToString();
        lblTotalVatAmount.Text = vat.ToString();
        lblTotalBill.Text = bill.ToString();
        lblTotalDiscount.Text = dis.ToString();

    }
    public void resetdivBillInfo()
    {
        lblodrId.Text = "";
        lblOrderNo.Text = "";
        lblCustomerContact.Text = "";
        lblCustomerName.Text = "";
        lblTime.Text = "";
        lblTotal.Text = "0";

        lblTotalTax.Text = "0";
        lblTotalVat.Text = "0";
        lblTotalBillAmount.Text = "0";

        lblTaxRate.Text = "5%";
        lblVatRate.Text = "18.1%";

        grdBill.DataSource = null;
        grdBill.DataBind();
        lblPaymentMethod.Text = "";
    }

    public void databindCounts()
    {
        string managerId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (managerId != "")
        {
            try
            {
                string date = DateTime.Now.ToString("yyyy-MM-dd");
                dt = obj.show("select (select count(*) from tbRestaurantOrder where managerId = '"+managerId+"' and date = '"+date+ "' and doneStatus = '1') as odrDone,(select count(*) from tbRestaurantOrder where managerId = '" + managerId + "' and date = '" + date + "' and doneStatus = '0') as odrStack,(select count(*) from tbRestaurantOrder where managerId = '" + managerId + "' and date = '" + date + "' and doneStatus = '2') as odrCancel");
                if (dt.Rows.Count > 0)
                {
                    lblodrComplete.Text = dt.Rows[0]["odrDone"].ToString();
                    lblodrInStack.Text = dt.Rows[0]["odrStack"].ToString();
                    lblodrCancel.Text = dt.Rows[0]["odrCancel"].ToString();   
                }
                DateTime d = DateTime.ParseExact(date, "yyyy-MM-dd", new CultureInfo("en-US"));
                lblodrDate.Text = d.ToString("dd MMM yyyy");

            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }


        }
    }

    public void databindgrdOrdersList()
    {
        string managerId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (managerId != "")
        {
            try
            {
                string date = DateTime.Now.ToString("yyyy-MM-dd");
                resetdivBillInfo();
                dt = obj.show("select odrId,orderNo,customerName,customerPhone,paymentMethod,Total,Time,tax,vat,taxAmount,vatAmount,totalAmount,discount,bType, (totalAmount - discount) as income  from tbRestaurantOrder where managerId = '"+managerId+"' and date = '"+date+"' and doneStatus ='"+lblodrStatusList.Text+"'");
                grdOrdersList.DataSource = dt;
                grdOrdersList.DataBind();
                if (dt.Rows.Count > 0)
                {
                    

                    GridViewRow row = grdOrdersList.Rows[0];
                    Label odrId = (Label)row.FindControl("lblodrId");
                    Label orderNo = (Label)row.FindControl("lblorderNo");
                    Label customerName = (Label)row.FindControl("lblcustomerName");
                    Label time = (Label)row.FindControl("lbltime");
                    Label customerContact = (Label)row.FindControl("lblcustomerContact");
                    Label paymentMethod = (Label)row.FindControl("lblpaymentMethod");
                    Label Total = (Label)row.FindControl("lblTotal");
                    Label tax = (Label)row.FindControl("lblTaxRate");
                    Label vat = (Label)row.FindControl("lblVatRate");
                    Label dis = (Label)row.FindControl("lblDiscount");
                    Label taxAmount = (Label)row.FindControl("lblTaxAmount");
                    Label vatAmount = (Label)row.FindControl("lblVatAmount");
                    Label totalAmount = (Label)row.FindControl("lblInpocket");

                    lblodrId.Text = odrId.Text;
                    lblOrderNo.Text = orderNo.Text;
                    lblCustomerName.Text = customerName.Text;
                    lblTime.Text = time.Text;
                    lblCustomerContact.Text = customerContact.Text;
                    lblPaymentMethod.Text = paymentMethod.Text;
                    lblTotal.Text = Total.Text;
                    lblTaxRate.Text = tax.Text + "%";
                    lblVatRate.Text = vat.Text + "%";
                    lblTotalTax.Text = taxAmount.Text;
                    lblTotalVat.Text = vatAmount.Text;
                    lblTotalBillAmount.Text = totalAmount.Text;
                    lblDiscount.Text = dis.Text;
                    databindgrdBill();

                }
                settotalamount();
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }


        }
    }

    public void databindgrdBill()
    {
        if (lblodrId.Text != "" && lblOrderNo.Text != "")
        {
            try
            {
                dt = obj.show("select billId,ItemName,varient,quantity,Price,Rate from tbOrderBill where orderId = '" + lblodrId.Text + "' and orderNo = '" + lblOrderNo.Text + "' order by billId");
                grdBill.DataSource = dt;
                grdBill.DataBind();
                if (dt.Rows.Count > 0)
                {

                }
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }
        }
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new conn();
        if (!IsPostBack)
        {
            databindCounts();
            databindgrdOrdersList();
        }

    }

    protected void grdOrdersList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            string x = e.CommandArgument.ToString();

            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            Label odrId = (Label)row.FindControl("lblodrId");
            Label orderNo = (Label)row.FindControl("lblorderNo");
            Label customerName = (Label)row.FindControl("lblcustomerName");
            Label time = (Label)row.FindControl("lbltime");
            Label customerContact = (Label)row.FindControl("lblcustomerContact");
            Label paymentMethod = (Label)row.FindControl("lblpaymentMethod");
            Label Total = (Label)row.FindControl("lblTotal");
            Label tax = (Label)row.FindControl("lblTaxRate");
            Label vat = (Label)row.FindControl("lblVatRate");
            Label dis = (Label)row.FindControl("lblDiscount");
            Label taxAmount = (Label)row.FindControl("lblTaxAmount");
            Label vatAmount = (Label)row.FindControl("lblVatAmount");
            Label totalAmount = (Label)row.FindControl("lblInpocket");

            lblodrId.Text = odrId.Text;
            lblOrderNo.Text = orderNo.Text;
            lblCustomerName.Text = customerName.Text;
            lblTime.Text = time.Text;
            lblCustomerContact.Text = customerContact.Text;
            lblPaymentMethod.Text = paymentMethod.Text;
            lblTotal.Text = Total.Text;
            lblTaxRate.Text = tax.Text + "%";
            lblVatRate.Text = vat.Text + "%";
            lblTotalTax.Text = taxAmount.Text;
            lblTotalVat.Text = vatAmount.Text;
            lblDiscount.Text = dis.Text;
            lblTotalBillAmount.Text = totalAmount.Text;

            databindgrdBill();

        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        }
    }

    protected void lnkodrComplete_Click(object sender, EventArgs e)
    {
        lblodrStatusList.Text = "1";
        databindgrdOrdersList();
    }

    protected void lnkodrStack_Click(object sender, EventArgs e)
    {
        lblodrStatusList.Text = "0";
        databindgrdOrdersList();

    }

    protected void lnkodrCanceled_Click(object sender, EventArgs e)
    {
        lblodrStatusList.Text = "2";
        databindgrdOrdersList();

    }
}