using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class u_Admin_branch : System.Web.UI.Page
{
    string pth;
    DataTable dt;
    conn obj;
    public void databind_drpState()
    {
        try
        {
            //dt = obj.show("select 0 as sId,' Your State' as sName union select sId,sName from tbState order by sName");
            dt = obj.show("select sId,sName from tbState order by sName");
            drpState.DataSource = dt;
            drpState.DataTextField = "sName";
            drpState.DataValueField = "sId";
            drpState.DataBind();
            //drpState.SelectedValue = "0";
        }
        catch (Exception e)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
        }
    }

    public void databind_drpCity()
    {
        try
        {
            //dt = obj.show("select 0 as cId,' Your City' as cName union select C.cId,C.cName from tbCity C where C.sId = '" + drpState.SelectedValue.ToString() + "' order by cName");
            dt = obj.show("select C.cId,C.cName from tbCity C where C.sId = '" + drpState.SelectedValue.ToString() + "' order by cName");
            drpCity.DataSource = dt;
            drpCity.DataTextField = "cName";
            drpCity.DataValueField = "cId";
            drpCity.DataBind();
            //drpCity.SelectedValue = "0";
        }
        catch (Exception e)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
        }
    }

    public void databindrptbranches()
    {
        string restaurantId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (restaurantId != "")
        {
            try
            {
                dt = obj.show("select B.branchTitle,B.branchId,(select count(*) from tbManager where branchId = B.branchId) as mcount,'' as sale from tbBranch B where B.restaurantId = '" + restaurantId + "'  order by branchId");
                rptBranch.DataSource = dt;
                rptBranch.DataBind();
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
            }
        }
    }
    public void databindbrnachInfo(string branchId)
    {
        try
        {
            dt = obj.show("select B.branchTitle,B.Address,(select sId from tbState where sName = B.State) as State,(select cId from tbCity where cName = B.City) as City from tbBranch B where branchId = '" + branchId + "'");
            if (dt.Rows.Count > 0)
            {
                lblBranchId.Text = branchId;
                txtBranchtitle.Text = dt.Rows[0]["branchTitle"].ToString();
                txtBranchAddress.Text = dt.Rows[0]["Address"].ToString();
                drpState.SelectedValue = dt.Rows[0]["State"].ToString();
                string cityId = dt.Rows[0]["City"].ToString();
                databind_drpCity();
                drpCity.SelectedValue = cityId;
            }

        }
        catch (Exception e)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
        }
    }

    public void databindrptManager(string branchId)
    {
        try
        {
            dt = obj.show("select M.counterTitle,M.managerId,'' as sale from tbManager M  where M.branchId = '"+branchId+ "' order by managerId");
            rptManager.DataSource = dt;
            rptManager.DataBind();

        }
        catch (Exception e)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
        }

        
    }
    public void databindmanagerinfo(string managerId)
    {
        try
        {
            dt = obj.show("select counterTitle,name,phone,email,username,password,date_expiry,valid_status from tbManager where managerId = '" + managerId + "'");
            if (dt.Rows.Count > 0)
            {
                lblmanagerId.Text = managerId;
                txtcountertitle.Text = dt.Rows[0]["counterTitle"].ToString();
                txtmanagername.Text = dt.Rows[0]["name"].ToString();
                txtmanagerphone.Text = dt.Rows[0]["phone"].ToString();
                txtmanageremail.Text = dt.Rows[0]["email"].ToString();
                txtusername.Text = dt.Rows[0]["username"].ToString();
                txtusername.Enabled = true;
                if (txtusername.Text != "") { txtusername.Enabled = false; }

                int status = Convert.ToInt32(dt.Rows[0]["valid_status"]);
                if(status == 1)
                {
                    lblStatus.Text = "Valid";
                    string exp = dt.Rows[0]["date_expiry"].ToString();
                    DateTime d = DateTime.ParseExact(exp, "dd-MM-yyyy hh:mm:ss", new CultureInfo("en-US"));
                    lblValidUpto.Text = d.ToString("dd MMM yyyy");
                }
                else
                {
                    lblStatus.Text = "Invalid";
                    lblValidUpto.Text = "---";
                }
                txtpassword.Text = dt.Rows[0]["password"].ToString();

            }

        }
        catch (Exception e)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(e.Message) + "')</script>");
        }

    }

    

    public void defaultdatabind()
    {
        RepeaterItem first = rptBranch.Items[0];
        Label branchId = (Label)first.FindControl("lblBranchId");
        databindbrnachInfo(branchId.Text);
        databindrptManager(branchId.Text);

        RepeaterItem firstmanager = rptManager.Items[0];
        Label managerId = (Label)firstmanager.FindControl("lblmanagerId");
        databindmanagerinfo(managerId.Text);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new conn();
        if (!IsPostBack)
        {
            databind_drpState();
            databind_drpCity();
            databindrptbranches();
            defaultdatabind();
        }
    }
    protected void drpState_SelectedIndexChanged(object sender, EventArgs e)
    {
        databind_drpCity();
    }
    protected void rptBranch_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //RepeaterItem first = rptBranch.Items[0];
        //Label branch = (Label)first.FindControl("lblTitle");

        string branchId = e.CommandArgument.ToString();
        databindbrnachInfo(branchId);
        databindrptManager(branchId);

        RepeaterItem firstmanager = rptManager.Items[0];
        Label managerId = (Label)firstmanager.FindControl("lblmanagerId");
        databindmanagerinfo(managerId.Text);
        
        //RepeaterItem row = e.Item;
        //LinkButton lnkTitle = (LinkButton)row.FindControl("lnkTitle");
    }

    protected void rptManager_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //RepeaterItem first = rptBranch.Items[0];
        //Label branch = (Label)first.FindControl("lblTitle");

        string managerId = e.CommandArgument.ToString();
        databindmanagerinfo(managerId);
        //RepeaterItem row = e.Item;
        //LinkButton lnkTitle = (LinkButton)row.FindControl("lnkTitle");
    }

    protected void lnkBranchSave_Click(object sender, EventArgs e)
    {
        if (txtBranchtitle.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "brancherr", "berror()", true);
            return;
        }
        else
        {
            try
            {
                int k = obj.query("update tbBranch set branchTitle = '"+txtBranchtitle.Text+"',state = '"+drpState.SelectedItem.ToString()+"',city = '"+drpCity.SelectedItem.ToString()+"',Address = '"+txtBranchAddress.Text+"' where branchId = '"+lblBranchId.Text+"'");
                if (k > 0)
                {
                    databindrptbranches();
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "branchsave", "bsave()", true);
                }

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }

        }

    }
    protected void lnkManagerSave_Click(object sender, EventArgs e)
    {
        if (txtcountertitle.Text == ""||txtusername.Text == "" ||txtpassword.Text=="")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "managererr", "merror(1)", true);
            return;
        }
        
        else
        {
            try
            {
                if (txtusername.Enabled)
                {
                    int m = obj.match("select count(*) from tbManager where username = '" + txtusername.Text + "'");
                    if (m > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "managererr", "merror(2)", true);
                        return;
                    }

                }


                int k = obj.query("update tbManager set counterTitle = '" + txtcountertitle.Text + "',name = '" + txtmanagername.Text + "',phone = '" + txtmanagerphone.Text + "',email = '" + txtmanageremail.Text + "',username = '" + txtusername.Text + "',password = '" + txtpassword.Text + "',logged_in_status = '0' where managerId = '" + lblmanagerId.Text + "'");
                if (k > 0)
                {
                    databindrptManager(lblBranchId.Text);
                    databindmanagerinfo(lblmanagerId.Text);
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "managersave", "msave()", true);
                }

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }

        }

    }

    
    protected void lnkAddBranch_Click(object sender, EventArgs e)
    {
        string now = DateTime.Now.ToString("yyyy-MM-dd");
        string upto = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
        int count = rptBranch.Items.Count + 1;
        string branchTitle = "Branch" + count.ToString();
        string restaurantId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (restaurantId != "")
        {
            try
            {
                int m = obj.match("select count(*) from tbManager where  branchId in (select branchId from tbBranch where restaurantId = '"+restaurantId+ "') and valid_status <>1");
                if (m > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "verror", "verror(1)", true);
                    return;
                }
                string insertbranch = "insert into tbBranch values ('" + restaurantId + "','" + branchTitle + "',(select state from tbAdmin where restaurantId = '" + restaurantId + "'),(select city from tbAdmin where restaurantId = '" + restaurantId + "'),(select address from tbAdmin where restaurantId = '" + restaurantId + "'))";
                string insertmanager = "insert into tbManager values ((select top 1 branchId from tbBranch where restaurantId = '" + restaurantId + "' and branchTitle = '" + branchTitle + "' order by branchId desc),'Counter1','','','','','','../images/custom/default.jfif','" + now + "','" + now + "','" + upto + "','','0','0','0','0','"+now+"')";

                int k = obj.query(insertbranch + " " + insertmanager);
                if (k > 0)
                {
                    databindrptbranches();
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "branchsave", "bsave()", true);
                }

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }

        }
    }

    protected void lnkAddManager_Click(object sender, EventArgs e)
    {
        string now = DateTime.Now.ToString("yyyy-MM-dd");
        string upto = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
        int count = rptManager.Items.Count + 1;
        string counterTitle = "Counter" + count.ToString();
        
        try
        {
            string restaurantId = Request.Cookies["r_data"]["r_authId"].ToString();
            if (restaurantId != "")
            {
                int m = obj.match("select count(*) from tbManager where  branchId in (select branchId from tbBranch where restaurantId = '" + restaurantId + "') and valid_status <>1");
                if (m > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "verror", "verror(2)", true);
                    return;
                }

            }

            string insertmanager = "insert into tbManager values ('"+lblBranchId.Text+"','"+counterTitle+ "','','','','','','../images/custom/default.jfif','" + now + "','" + now + "','" + upto + "','','0','0','0','0','" + now + "')";

            int k = obj.query(insertmanager);
            if (k > 0)
            {
                databindrptManager(lblBranchId.Text);
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "branchsave", "bsave()", true);
            }

        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        }

        
    }
}