using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class u_BranchManager_dashboard : System.Web.UI.Page
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
            //drpState.SelectedValue = "0";
        }
        catch (Exception e)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
        }
    }

    public void databindrbId()
    {
        HttpCookie m = Request.Cookies["r_data"];
        string managerId = "";
        if (m!=null)
        {
            managerId = Request.Cookies["r_data"]["r_authId"].ToString();
        }
        if (managerId != "")
        {
            try
            {
                dt = obj.show("select B.branchId,B.restaurantId,(select OrderNo from tbManager where managerId = '"+managerId+ "') as orderNo,(select convert(nvarchar(50),ondate) from tbManager where managerId = '" + managerId + "') as ondate from tbBranch B where B.branchId = (select branchId from tbManager where managerId = '" + managerId + "')");
                if (dt.Rows.Count > 0)
                {
                    lblRestaurantId.Text = dt.Rows[0]["restaurantId"].ToString();
                    lblBranchId.Text = dt.Rows[0]["branchId"].ToString();
                    lblOrderNo.Text = (Convert.ToInt32(dt.Rows[0]["orderNo"]) + 1).ToString();
                    
                    string iDate = dt.Rows[0]["ondate"].ToString();
                    DateTime d = DateTime.ParseExact(iDate, "yyyy-MM-dd", new CultureInfo("en-US"));
                    lblOnDateChk.Text = d.ToString("yyyy-MM-dd");
                }
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }
            

        }
    }


    public void databindrptCategoryList()
    {
        if (lblRestaurantId.Text != "")
        {
            try
            {
                if (drpType.SelectedValue.ToString() == "0")
                {
                    dt = obj.show("select A.rcId,A.ctitle,A.cIcon,(select count(distinct sctitle) from tbRestaurantSubCategory S where S.rcId = A.rcId ) as scCount from tbRestaurantCategory A where A.restaurantId = '" + lblRestaurantId.Text + "' order by A.ctitle");

                }
                else
                {
                    dt = obj.show("select A.rcId,A.ctitle,A.cIcon,(select count(distinct sctitle) from tbRestaurantSubCategory S where S.rcId = A.rcId ) as scCount from tbRestaurantCategory A where A.restaurantId = '" + lblRestaurantId.Text + "' and A.cfor = '"+drpType.SelectedItem.ToString()+ "' order by A.ctitle");

                }
                rptCategoryList.DataSource = dt;
                rptCategoryList.DataBind();

                if (dt.Rows.Count > 0)
                {
                    RepeaterItem defaultCategory = rptCategoryList.Items[0];
                    Label rcId = (Label)defaultCategory.FindControl("lblrcId");
                    LinkButton ctitle = (LinkButton)defaultCategory.FindControl("lnkctitle");
                    lblSelectedCategoryId.Text = rcId.Text;
                    lblSelectedCategoryName.Text = ctitle.Text;
                }
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }
        }
    }

    public void databindrptCategoryItemsList()
    {
        if (lblSelectedCategoryId.Text != "")
        {
            try
            {
                dt = obj.show("select distinct A.sctitle,A.scIcon from tbRestaurantSubCategory A where rcId = '"+lblSelectedCategoryId.Text+"'");
                rptCategoryItemsList.DataSource = dt;
                rptCategoryItemsList.DataBind();

                if (dt.Rows.Count > 0)
                {
                    RepeaterItem defaultSubCategory = rptCategoryItemsList.Items[0];
                    LinkButton sctitle = (LinkButton)defaultSubCategory.FindControl("lnksctitle");
                    ImageButton imgscIcon = (ImageButton)defaultSubCategory.FindControl("imgscIcon");
                    imgSelectedscIcon.ImageUrl = imgscIcon.ImageUrl;
                    lblSelectedSubCategoryName.Text = sctitle.Text;
                    databindgrdItemVarients();
                }
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }
        }

    }

    public void databindgrdItemVarients()
    {
        if (lblSelectedCategoryId.Text != "" && lblSelectedSubCategoryName.Text !="")
        {
            try
            {   
                dt = obj.show("select rscId,varient,rate from tbRestaurantSubCategory where rcId = '" + lblSelectedCategoryId.Text + "' and sctitle='"+lblSelectedSubCategoryName.Text+"' order by rate");
                grdItemVarients.DataSource = dt;
                grdItemVarients.DataBind();
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }
        }
    }

    public void databindrptOrderStack()
    {
        HttpCookie m = Request.Cookies["r_data"];
        string managerId = "";
        if (m != null)
        {
            managerId = Request.Cookies["r_data"]["r_authId"].ToString();
        }
        if (managerId != "")
        {
            try
            {
                dt = obj.show("select odrId, convert(nvarchar(50),OrderNo) + '/' + convert(nvarchar(50),tableNo) as info from tbRestaurantOrder where managerId = '"+managerId+"' and doneStatus = '0' order by odrId desc");
                rptOrderStack.DataSource = dt;
                rptOrderStack.DataBind();
                if (dt.Rows.Count > 0)
                {
                    RepeaterItem defaultodr = rptOrderStack.Items[0];
                    Label odrId = (Label)defaultodr.FindControl("lblodrId");
                    lblodrId.Text = odrId.Text;
                    databinddivBillInfo();
                    
                }
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }


        }
    }

    public void databinddivBillInfo()
    {
        divShowBillInfo.Visible = false;
        if(lblodrId.Text != "")
        {
            divShowBillInfo.Visible = true;
            try
            {
                dt = obj.show("select orderNo,customerName,customerPhone,pmId,Total,Date,tax,vat,taxAmount,vatAmount,totalAmount from tbRestaurantOrder where odrId = '"+lblodrId.Text+"'");
                if (dt.Rows.Count > 0)
                {
                    lblTax.Text = dt.Rows[0]["tax"].ToString();
                    lblVat.Text = dt.Rows[0]["vat"].ToString();
                    lblTaxRate.Text = lblTax.Text + "%";
                    lblVatRate.Text = lblVat.Text + "%";

                    lblOnOrderNo.Text = dt.Rows[0]["orderNo"].ToString();
                    lblBillOrderNo.Text = lblOnOrderNo.Text;
                    lblCustomerName.Text = dt.Rows[0]["customerName"].ToString();
                    lblCustomerContact.Text = dt.Rows[0]["customerPhone"].ToString();

                    string iDate = dt.Rows[0]["Date"].ToString();
                    DateTime d = DateTime.ParseExact(iDate, "yyyy-MM-dd", new CultureInfo("en-US"));
                    lblonDate.Text = d.ToString("dd MMM yyyy");
                    lblBillDate.Text = d.ToString("dd MMM yyyy");
                    lblTotal.Text = dt.Rows[0]["Total"].ToString();
                    lblTotal2.Text = lblTotal.Text;
                    lblTotalTax.Text = dt.Rows[0]["taxAmount"].ToString();
                    lblTotalVat.Text = dt.Rows[0]["vatAmount"].ToString();
                    lblTotalAmount.Text = dt.Rows[0]["totalAmount"].ToString();
                    if (dt.Rows[0]["pmId"].ToString() != "0")
                    {
                        drpPaymentMethod.SelectedValue = dt.Rows[0]["pmId"].ToString();
                    }
                    databindgrdBill();
                }
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }

        }
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
            if(lblType.Text == "1")//restaurant item
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
        lblTotal2.Text = lblTotal.Text;
        float taxRate = float.Parse(lblTax.Text);
        float vatRate = float.Parse(lblVat.Text);

        float tax = rtotal * (taxRate/100);
        float vat = btotal * (vatRate / 100);
        float totalAmount = total + tax + vat;

        lblTotalTax.Text = tax.ToString();
        lblTotalVat.Text = vat.ToString();
        lblTotalAmount.Text = totalAmount.ToString();

        if (txtDiscountAmount.Text == "")
        {
            txtDiscountAmount.Text = "0";
        }
        lblDiscount.Text = txtDiscountAmount.Text;
        float discount;
        if (float.TryParse(txtDiscountAmount.Text, out discount))
        {
            lblTotalBill.Text = (totalAmount - discount).ToString();
        }

    }

    public void databindgrdBill()
    {
        divTheBill.Visible = false;
        divStartBill.Visible = true;
        if(lblodrId.Text!="" && lblOnOrderNo.Text != "")
        {
            try
            {
                dt = obj.show("select A.billId,A.ItemName,A.varient,A.quantity,A.Price,A.Rate,(select type from tbVarients where varTitle = A.varient) as type from tbOrderBill A where A.orderId = '"+lblodrId.Text+"' and A.orderNo = '"+lblOnOrderNo.Text+"' order by billId");
                grdBill.DataSource = dt;
                grdBill.DataBind();
                if (dt.Rows.Count>0)
                {
                    divTheBill.Visible = true;
                    divStartBill.Visible = false;
                    databindTotal();

                }
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }
        }
    }

    public void chkDateSetOrder()
    {
        HttpCookie m = Request.Cookies["r_data"];
        string managerId = "";
        if (m != null)
        {
            managerId = Request.Cookies["r_data"]["r_authId"].ToString();
        }
        if(managerId != "")
        {
            string now = DateTime.Now.ToString("yyyy-MM-dd");
            if (lblOnDateChk.Text != now)
            {
                lblOnDateChk.Text = now;
                lblOrderNo.Text = "1";
                string totalOrder = "update tbManager set TotalOrders = TotalOrders + OrderNo,ondate = '" + now + "' where managerId = '" + managerId + "'";
                string OrderNo = "update tbManager set OrderNo = 0 where managerId = '" + managerId + "'";
                int k = obj.query(totalOrder + " " + OrderNo);
            }
        }
        
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new conn();
        if (!IsPostBack)
        {
            HttpCookie m = Request.Cookies["r_data"];
            string managerId = "";
            if (m != null)
            {
                managerId = Request.Cookies["r_data"]["r_authId"].ToString();
            }
            if (managerId == "")
            {
                Response.Redirect("../panelLogin.aspx");
            }
            databinddrpPaymentMethod();
            databindrbId();
            chkDateSetOrder();
            databindrptCategoryList();
            databindrptCategoryItemsList();
            databindrptOrderStack();
        }
        
    }

    protected void rptCategoryList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //RepeaterItem first = rptBranch.Items[0];
        //Label branch = (Label)first.FindControl("lblTitle");

        string categoryId = e.CommandArgument.ToString();
        RepeaterItem row = e.Item;
        LinkButton cTitle = (LinkButton)row.FindControl("lnkctitle");
        lblSelectedCategoryId.Text = categoryId;
        lblSelectedCategoryName.Text = cTitle.Text;
        databindrptCategoryItemsList();

        //databindbrnachInfo(branchId);
        //databindrptManager(branchId);

        //RepeaterItem firstmanager = rptManager.Items[0];
        //Label managerId = (Label)firstmanager.FindControl("lblmanagerId");
        //databindmanagerinfo(managerId.Text);

        ////RepeaterItem row = e.Item;
        ////LinkButton lnkTitle = (LinkButton)row.FindControl("lnkTitle");
    }

    protected void rptCategoryItemsList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //RepeaterItem first = rptBranch.Items[0];
        //Label branch = (Label)first.FindControl("lblTitle");

        string scTitle = e.CommandArgument.ToString();
        RepeaterItem row = e.Item;
        //LinkButton scTitle = (LinkButton)row.FindControl("lnksctitle");
        ImageButton imgscIcon = (ImageButton)row.FindControl("imgscIcon");
        lblSelectedSubCategoryName.Text = scTitle;
        imgSelectedscIcon.ImageUrl = imgscIcon.ImageUrl;
        databindgrdItemVarients();

        //databindbrnachInfo(branchId);
        //databindrptManager(branchId);

        //RepeaterItem firstmanager = rptManager.Items[0];
        //Label managerId = (Label)firstmanager.FindControl("lblmanagerId");
        //databindmanagerinfo(managerId.Text);

        ////RepeaterItem row = e.Item;
        ////LinkButton lnkTitle = (LinkButton)row.FindControl("lnkTitle");
    }

    protected void grdItemVarients_RowEditing(object sender, GridViewEditEventArgs e)
    {

        GridViewRow row = grdItemVarients.Rows[e.NewEditIndex];
        Label id = (Label)row.FindControl("lblrscId");
        Label varient = (Label)row.FindControl("lblvarient");
        Label rate = (Label)row.FindControl("lblRate");

        string addquery = "";
        saveOrder(addquery);

        if (lblodrId.Text!="" && lblOnOrderNo.Text != "")
        {
            try
            {
                string query = "insert into tbOrderBill values('"+lblodrId.Text+"','"+lblOnOrderNo.Text+"','"+id.Text+"','"+lblSelectedSubCategoryName.Text+"','"+varient.Text+"','1','"+rate.Text+"','"+rate.Text+"')";
                int k = obj.query(query);
                if (k > 0)
                {

                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "makeorder", "alert('Make the order first')", true);
            return;
        }
        databinddivBillInfo();
        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "setlogo", "setlogo('" + cIcon.Text + "')", true);
    }

    protected void btnMakeOrder_Click(object sender, EventArgs e)
    {
        string date = DateTime.Now.ToString("yyyy-MM-dd");
        string time = DateTime.Now.ToString("hh:mm tt");
        string managerId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (managerId != "" && lblBranchId.Text!="")
        {
            try
            {
                string updateorderNo = "update tbManager set orderNo = orderNo + 1 where managerId = '"+managerId+"'";
                string makeorder = "insert into tbRestaurantOrder values('"+managerId+"',(select branchId from tbManager where managerId = '"+managerId+"'),(select orderNo from tbManager where managerId= '"+managerId+"'),'"+txtTable.Text+"','"+txtCustomerName.Text+"','"+txtCustomerPhone.Text+"','0','','0','"+date+"','"+time+"','0','"+txtTax.Text+"','"+txtVat.Text+"','"+drpBtype.SelectedItem.ToString()+"','0','0','0','0')";
                string getData = "select (select odrId from tbRestaurantOrder where managerId = '"+managerId+"' and OrderNo = (select OrderNo from tbManager where managerId='"+managerId+"') and date = '"+date+"' and time='"+time+"' and customerName = '"+txtCustomerName.Text+ "') as odrId,(select OrderNo from tbManager where managerId='" + managerId + "') as orderNo";

                dt = obj.show(updateorderNo + " " + makeorder + " " + getData);
                if (dt.Rows.Count > 0)
                {
                    lblOrderNo.Text = (Convert.ToInt32(dt.Rows[0]["orderNo"]) + 1).ToString();
                    txtCustomerName.Text = "";
                    txtCustomerPhone.Text = "";
                    txtTable.Text = "";
                    txtTax.Text = "5";
                    txtVat.Text = "18";

                    string addquery = "";
                    saveOrder(addquery);

                    lblodrId.Text = dt.Rows[0]["odrId"].ToString();
                    

                    databindrptOrderStack();

                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }
        }

        
    }

    protected void rptOrderStack_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string addquery = "";
        saveOrder(addquery);
        string odrId = e.CommandArgument.ToString();
        lblodrId.Text = odrId;
        databinddivBillInfo();
    }

    protected void grdBill_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //string x = e.CommandArgument.ToString();
        if (e.CommandName == "Cross")
        {
            string billId = e.CommandArgument.ToString();
            if(billId != "")
            {
                try
                {
                    string query = "delete from tbOrderBill where billId = '"+billId+"'";
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

            lblTotal2.Text = lblTotal.Text;
            databindTotal();
        }
        
        
    }
    
    public void saveOrder(string addquery)
    {
        if(lblodrId.Text!="" && lblOnOrderNo.Text != "")
        {
            try
            {
                string SaveOrderdetails = "update tbRestaurantOrder set pmId = '"+drpPaymentMethod.SelectedValue.ToString()+"',paymentMethod = '"+drpPaymentMethod.SelectedItem.ToString()+"',total = '"+lblTotal.Text+ "',taxAmount = '" + lblTotalTax.Text + "',vatAmount = '" + lblTotalVat.Text + "',totalAmount = '" + lblTotalAmount.Text + "',discount = '" + txtDiscountAmount.Text + "' where odrId = '" + lblodrId.Text+"'";
                string savebills = "";
                foreach (GridViewRow row in grdBill.Rows)
                {
                    Label lblbillId = (Label)row.FindControl("lblbillId");
                    Label lblqty = (Label)row.FindControl("lblQty");
                    Label lblPrice = (Label)row.FindControl("lblPrice");

                    savebills = savebills + "update tbOrderBill set quantity = '"+lblqty.Text+"',Price = '"+lblPrice.Text+"' where billId = '"+lblbillId.Text+"'" + " ";
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
    

    public void resetdivBillInfo()
    {
        lblodrId.Text = "";
        lblOnOrderNo.Text = "";
        lblBillOrderNo.Text = "";
        lblCustomerContact.Text = "";
        lblCustomerName.Text = "";
        lblonDate.Text = "";
        lblBillDate.Text = "";
        lblTotal.Text = "0";

        lblTotal2.Text = lblTotal.Text;
        lblTotalTax.Text = "0";
        lblTotalVat.Text = "0";
        lblTotalAmount.Text = "0";

        lblTotalBill.Text = "0";
        txtDiscountAmount.Text = "0";
        lblDiscount.Text = "0";

        lblTaxRate.Text = "5%";
        lblVatRate.Text = "18%";

        grdBill.DataSource = null;
        grdBill.DataBind();
        divTheBill.Visible = false;
        divStartBill.Visible = true;
        drpPaymentMethod.SelectedValue = "1";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string addquery = "update tbRestaurantOrder set doneStatus = '2' where odrId = '" + lblodrId.Text + "'";
        saveOrder(addquery);
        resetdivBillInfo();
        databindrptOrderStack();

        //string value = "";
        //string deletebills = "";
        //string deleteorder = "delete from tbRestaurantOrder where odrId = '"+lblodrId.Text+"'";
        //foreach (GridViewRow row in grdBill.Rows)
        //{
        //    Label id = (Label)row.FindControl("lblbillId");
        //    if (value == "")
        //    {
        //        value = value + "'" + id.Text + "'";
        //    }
        //    else
        //    {
        //        value = value + ",'" + id.Text + "'";
        //    }
        //}

        //if (value != "")
        //{
        //    deletebills = "delete from tbOrderBill where billId in (" + value + ")";
        //}
        //try
        //{
        //    int k = obj.query(deletebills + " " + deleteorder);
        //    if (k > 0)
        //    {
        //        lblodrId.Text = "";
        //        databindrptOrderStack();
        //        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "cnerror", "cnerror(2)", true);
        //    }

        //}
        //catch (Exception err)
        //{
        //    Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        //}
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string addquery = "";
        saveOrder(addquery);
        resetdivBillInfo();
        
    }


    protected void btnOrderDone_Click(object sender, EventArgs e)
    {
        string addquery = "update tbRestaurantOrder set doneStatus = '1' where odrId = '" + lblodrId.Text + "'";
        saveOrder(addquery);
        resetdivBillInfo();
        databindrptOrderStack();
    }

    protected void btnSetDiscount_Click(object sender, ImageClickEventArgs e)
    {
        databindTotal();
    }
    protected void drpType_SelectedIndexChanged(object sender, EventArgs e)
    {
        databindrptCategoryList();
        databindrptCategoryItemsList();
        databindgrdItemVarients();
        //databindgrdCategory();
    }

}