using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class u_Admin_dashboard : System.Web.UI.Page
{
    string pth;
    DataTable dt;
    conn obj;

    public void databinddrpPaymentMethod()
    {
        try
        {
            //dt = obj.show("select 0 as sId,' Your State' as sName union select sId,sName from tbState order by sName");
            dt = obj.show("select methodId,method from tbPaymentMethods order by methodId");
            drpPaymentMethod.DataSource = dt;
            drpPaymentMethod.DataTextField = "method";
            drpPaymentMethod.DataValueField = "methodId";
            drpPaymentMethod.DataBind();

            dt = obj.show("select '0' as methodId,'Payment  Method' as method union select methodId,method from tbPaymentMethods order by methodId");
            //DropDownList drpPM = (DropDownList)grdOrdersList.HeaderRow.FindControl("drpPM");
            drpPM.DataSource = dt;
            drpPM.DataTextField = "method";
            drpPM.DataValueField = "methodId";
            drpPM.DataBind();


        }
        catch (Exception e)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
        }
    }

    public void databinddrpBranch()
    {
        string restaurantId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (restaurantId != "")
        {
            try
            {
                dt = obj.show("select branchId,branchTitle from tbBranch where restaurantId= '" + restaurantId + "' order by branchId");
                drpBranch.DataSource = dt;
                drpBranch.DataTextField = "branchTitle";
                drpBranch.DataValueField = "branchId";
                drpBranch.DataBind();

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }

        }
    }
    public void databinddrpManager()
    {
        try
        {
            dt = obj.show("select managerId,counterTitle from tbManager where branchId= '" + drpBranch.SelectedValue.ToString() + "' order by managerId");
            drpManager.DataSource = dt;
            drpManager.DataTextField = "counterTitle";
            drpManager.DataValueField = "managerId";
            drpManager.DataBind();

        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        }
    }
    public void databindCounts()
    {
        string restaurantId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (restaurantId != "")
        {
            try
            {
                string today = DateTime.Now.ToString("yyyy-MM-dd");

                string date = DateTime.Now.ToString("MM-dd-yyyy");
                date = date.Replace("-","/");
                txtDatepicker.Text = date;

                string income = "(select sum(totalAmount-discount) from tbRestaurantOrder where doneStatus = '1' and Date = '"+today+"' and branchId in (select branchId from tbBranch where restaurantId = '" + restaurantId + "')) as income,";
                string orders = "(select count(*) from tbRestaurantOrder where doneStatus = '1' and Date = '" + today + "' and branchId in (select branchId from tbBranch where restaurantId = '" + restaurantId + "')) as orderCount,";
                string managers = "(select count(*) from tbManager where branchId in (select branchId from tbBranch where restaurantId = '" + restaurantId + "')) as managerCount,";
                string validUpto = "(select CONVERT(nvarchar(50),date_Expiry) as date_Expiry from tbAdmin where restaurantId = '" + restaurantId + "') as validUpto";

                dt = obj.show("select " + income + orders + managers + validUpto);
                if (dt.Rows.Count > 0)
                {
                    lblIncome.Text = dt.Rows[0]["income"].ToString();
                    if(lblIncome.Text == "")
                    {
                        lblIncome.Text = "0";
                    }
                    lblOrdersCount.Text = dt.Rows[0]["orderCount"].ToString();
                    lblManagersCount.Text = dt.Rows[0]["managerCount"].ToString();
                    string exp = dt.Rows[0]["validUpto"].ToString();
                    DateTime d = DateTime.ParseExact(exp, "yyyy-MM-dd", new CultureInfo("en-US"));
                    lblValidUpto.Text = d.ToString("dd MMM yyyy");
                }

            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }


        }
    }
    
    public void settotalamount()
    {

        float bill = 0, tax = 0, vat = 0, dis = 0, total = 0;

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
        lblTotalAmount.Text = total.ToString();
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

        txtDiscount.Text = "0";
        lblTaxRate.Text = "5";
        lblVatRate.Text = "18.1";


        grdBill.DataSource = null;
        grdBill.DataBind();
        lblPaymentMethod.Text = "";
        drpPaymentMethod.SelectedValue = "1";
    }

    
    public void databindgrdOrdersList()
    {
        //string managerId = Request.Cookies["r_data"]["r_authId"].ToString();
        string managerId = drpManager.SelectedValue.ToString();
        if (managerId != "")
        {
            try
            {
                //lblTotalAmount.Text = "0";
                //string date = DateTime.Now.ToString("yyyy-MM-dd");
                string format = txtDatepicker.Text;
                DateTime d = DateTime.ParseExact(format, "MM/dd/yyyy", new CultureInfo("en-US"));
                string date = d.ToString("yyyy-MM-dd");


                resetdivBillInfo();
                string query = "select odrId,orderNo,customerName,customerPhone,pmId,paymentMethod,Total,Time,tax,vat,bType,taxAmount,vatAmount,totalAmount,discount,(totalAmount-discount) as income from tbRestaurantOrder where managerId = '" + managerId + "' and date = '" + date + "' and doneStatus ='" + lblodrStatusList.Text + "'";
                string pmCondition = "";
                string billType = "";
                if (drpPM.SelectedValue.ToString() != "0")
                {
                    pmCondition = " and pmId='" + drpPM.SelectedValue.ToString() + "'";
                    //dt = obj.show("select odrId,orderNo,customerName,customerPhone,pmId,paymentMethod,Total,Time,tax,vat,bType,taxAmount,vatAmount,totalAmount from tbRestaurantOrder where managerId = '" + managerId + "' and date = '" + date + "' and doneStatus ='" + lblodrStatusList.Text + "'");

                }
                if (drpBtype.SelectedValue.ToString() != "0")
                {
                    billType = " and bType='" + drpBtype.SelectedItem.ToString() + "'";
                    //dt = obj.show("select odrId,orderNo,customerName,customerPhone,pmId,paymentMethod,Total,Time,tax,vat,bType,taxAmount,vatAmount,totalAmount from tbRestaurantOrder where managerId = '" + managerId + "' and date = '" + date + "' and doneStatus ='" + lblodrStatusList.Text + "' and pmId='"+drpPM.SelectedValue.ToString()+"'");
                }
                dt = obj.show(query + pmCondition + billType);
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
                    Label pmId = (Label)row.FindControl("lblpmId");
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
                    drpPaymentMethod.SelectedValue = pmId.Text;
                    lblTotal.Text = Total.Text;
                    lblTaxRate.Text = tax.Text;
                    lblVatRate.Text = vat.Text;
                    txtDiscount.Text = dis.Text;
                    lblTotalTax.Text = taxAmount.Text;
                    lblTotalVat.Text = vatAmount.Text;
                    lblTotalBillAmount.Text = totalAmount.Text;

                    //DropDownList drpDM = (DropDownList)grdOrdersList.HeaderRow.Cells[4].FindControl("drpPM");

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
                dt = obj.show("select A.billId,A.ItemName,A.varient,A.quantity,A.Price,A.Rate,(select type from tbVarients where varTitle = A.varient) as type from tbOrderBill A where A.orderId = '" + lblodrId.Text + "' and A.orderNo = '" + lblOrderNo.Text + "' order by billId");
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
            databinddrpPaymentMethod();
            databinddrpBranch();
            databinddrpManager();
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
            Label pmId = (Label)row.FindControl("lblpmId");
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
            drpPaymentMethod.SelectedValue = pmId.Text;
            lblTotal.Text = Total.Text;
            lblTaxRate.Text = tax.Text;
            lblVatRate.Text = vat.Text;
            lblTotalTax.Text = taxAmount.Text;
            lblTotalVat.Text = vatAmount.Text;
            txtDiscount.Text = dis.Text;
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


    public void databindTotal()
    {
        int total = 0;
        int rtotal = 0;
        int btotal = 0;
        foreach (GridViewRow row in grdBill.Rows)
        {
            Label lblPrice = (Label)row.FindControl("lblPrice");
            Label lblType = (Label)row.FindControl("lblType");
            if (lblType.Text == "1")//restaurant item
            {
                rtotal = rtotal + Convert.ToInt32(lblPrice.Text);
            }
            else if (lblType.Text == "2")//bar item
            {
                btotal = btotal + Convert.ToInt32(lblPrice.Text);
            }
            total = total + Convert.ToInt32(lblPrice.Text);
        }
        lblTotal.Text = total.ToString();
        float taxRate = float.Parse(lblTaxRate.Text);
        float vatRate = float.Parse(lblVatRate.Text);

        float tax = rtotal * (taxRate / 100);
        float vat = btotal * (vatRate / 100);
        float totalAmount = total + tax + vat;

        lblTotalTax.Text = tax.ToString();
        lblTotalVat.Text = vat.ToString();
        lblTotalBillAmount.Text = (totalAmount - float.Parse(txtDiscount.Text)).ToString(); ;

    }

    protected void grdBill_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //string x = e.CommandArgument.ToString();
        if (e.CommandName == "Cross")
        {
            string billId = e.CommandArgument.ToString();
            if (billId != "")
            {
                try
                {
                    string query = "delete from tbOrderBill where billId = '" + billId + "'";
                    int k = obj.query(query);
                    if (k > 0)
                    {
                        databindgrdBill();
                        databindTotal();
                    }
                }
                catch (Exception err)
                {
                    Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
                }
            }
        }
        else
        {
            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            

            Label lblQty = (Label)row.FindControl("lblQty");
            Label lblPrice = (Label)row.FindControl("lblPrice");
            Label lblRate = (Label)row.FindControl("lblRate");
            LinkButton lnkDecrease = (LinkButton)row.FindControl("lnkQtyDecrease");
            int quantity = Convert.ToInt32(lblQty.Text);
            int rate = Convert.ToInt32(lblRate.Text);
            int total = Convert.ToInt32(lblTotal.Text);
            int price = Convert.ToInt32(lblPrice.Text);
            total = total - price;
            if (e.CommandName == "Decrease")
            {
                if (quantity > 1)
                {
                    quantity = quantity - 1;
                }
            }
            else if (e.CommandName == "Increase")
            {
                quantity = quantity + 1;
            }

            lblQty.Text = quantity.ToString();
            lblPrice.Text = (rate * quantity).ToString();

            total = total + rate * quantity;
            lblTotal.Text = total.ToString();

            databindTotal();
        }


    }

    public void saveOrder(string addquery)
    {
        if (lblodrId.Text != "" && lblOrderNo.Text != "")
        {
            try
            {
                string SaveOrderdetails = "update tbRestaurantOrder set pmId = '" + drpPaymentMethod.SelectedValue.ToString() + "',paymentMethod = '" + drpPaymentMethod.SelectedItem.ToString() + "',total = '" + lblTotal.Text + "',taxAmount = '" + lblTotalTax.Text + "',vatAmount = '" + lblTotalVat.Text + "',totalAmount = '" + lblTotalBillAmount.Text + "',discount = '" + txtDiscount.Text + "' where odrId = '" + lblodrId.Text + "'";
                //string SaveOrderdetails = "update tbRestaurantOrder set total = '" + lblTotal.Text + "' where odrId = '" + lblodrId.Text + "'";
                string savebills = "";
                foreach (GridViewRow row in grdBill.Rows)
                {
                    Label lblbillId = (Label)row.FindControl("lblbillId");
                    Label lblqty = (Label)row.FindControl("lblQty");
                    Label lblPrice = (Label)row.FindControl("lblPrice");

                    savebills = savebills + "update tbOrderBill set quantity = '" + lblqty.Text + "',Price = '" + lblPrice.Text + "' where billId = '" + lblbillId.Text + "'" + " ";
                }

                int k = obj.query(SaveOrderdetails + " " + savebills + addquery);
                if (k > 0)
                {

                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }
        }
    }

    public void databindgrdOrdersListSecondary()
    {
        //string managerId = Request.Cookies["r_data"]["r_authId"].ToString();
        string managerId = drpManager.SelectedValue.ToString();
        if (managerId != "")
        {
            try
            {
                //lblTotalAmount.Text = "0";
                //string date = DateTime.Now.ToString("yyyy-MM-dd");
                string format = txtDatepicker.Text;
                DateTime d = DateTime.ParseExact(format, "MM/dd/yyyy", new CultureInfo("en-US"));
                string date = d.ToString("yyyy-MM-dd");

                resetdivBillInfo();
                string query = "select odrId,orderNo,customerName,customerPhone,pmId,paymentMethod,Total,Time,tax,vat,bType,taxAmount,vatAmount,totalAmount,discount,(totalAmount-discount) as income from tbRestaurantOrder where managerId = '" + managerId + "' and date = '" + date + "' and doneStatus ='" + lblodrStatusList.Text + "'";
                string pmCondition = "";
                string billType = "";
                if (drpPM.SelectedValue.ToString() != "0")
                {
                    pmCondition = " and pmId='" + drpPM.SelectedValue.ToString() + "'";
                    //dt = obj.show("select odrId,orderNo,customerName,customerPhone,pmId,paymentMethod,Total,Time,tax,vat,bType,taxAmount,vatAmount,totalAmount from tbRestaurantOrder where managerId = '" + managerId + "' and date = '" + date + "' and doneStatus ='" + lblodrStatusList.Text + "'");

                }
                if (drpBtype.SelectedValue.ToString() != "0")
                {
                    billType = " and bType='" + drpBtype.SelectedItem.ToString() + "'";
                    //dt = obj.show("select odrId,orderNo,customerName,customerPhone,pmId,paymentMethod,Total,Time,tax,vat,bType,taxAmount,vatAmount,totalAmount from tbRestaurantOrder where managerId = '" + managerId + "' and date = '" + date + "' and doneStatus ='" + lblodrStatusList.Text + "' and pmId='"+drpPM.SelectedValue.ToString()+"'");
                }
                dt = obj.show(query + pmCondition + billType);
                grdOrdersList.DataSource = dt;
                grdOrdersList.DataBind();
                settotalamount();
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }


        }
    }


    protected void lnkSearchOnDate_Click(object sender, EventArgs e)
    {
        databindgrdOrdersList();
        //try
        //{
        //    string date = txtDatepicker.Text;
        //    DateTime d = DateTime.ParseExact(date, "dd/MM/yyyy", new CultureInfo("en-US"));
        //    string format = d.ToString("yyyy-MM-dd");

            
        //}
        //catch (Exception err)
        //{
        //    Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        //}
    }

    protected void drpBranch_SelectedIndexChanged(object sender, EventArgs e)
    {
        databinddrpManager();
        databindgrdOrdersList();
    }

    protected void drpPM_SelectedIndexChanged(object sender, EventArgs e)
    {
        databindgrdOrdersList();
        //databinddrpManager();
        //databindgrdOrdersList();
    }

    protected void drpManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        databindgrdOrdersList();
    }

    protected void drpBType_SelectedIndexChanged(object sender, EventArgs e)
    {
        databindgrdOrdersList();
    }
    protected void lnkUpdate_Click(object sender, EventArgs e)
    {
        saveOrder("");
        databindgrdOrdersListSecondary();
    }
}