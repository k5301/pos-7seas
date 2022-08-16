using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class u_Admin_productItems : System.Web.UI.Page
{
    string pth;
    DataTable dt;
    conn obj;

    public void showgrd(int x)
    {
        divItemsgrd.Visible = false;
        divItemList.Visible = false;
        if (x == 2)
        {
            divItemList.Visible = true;
        }
        else
        {
            divItemsgrd.Visible = true;

        }
    }
    public void showbtn(int x)
    {

        divShowInsertbtn.Visible = false;
        divShowUpdatebtn.Visible = false;
        if (x == 2)
        {
            divShowUpdatebtn.Visible = true;

        }
        else
        {
            divShowInsertbtn.Visible = true;
        }
    }
    public void databinddrpCategory()
    {

        string restaurantId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (restaurantId != "")
        {
            try
            {
                dt = obj.show("select rcId,ctitle from tbRestaurantCategory where restaurantId= '"+restaurantId+"' and cFor = '"+drpType.SelectedItem.ToString()+"' order by ctitle");
                drpCategory.DataSource = dt;
                drpCategory.DataTextField = "ctitle";
                drpCategory.DataValueField = "rcId";
                drpCategory.DataBind();

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }

        }
    }

    public void databinddrpCategory2()
    {

        string restaurantId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (restaurantId != "")
        {
            try
            {
                dt = obj.show("select rcId,ctitle from tbRestaurantCategory where restaurantId= '" + restaurantId + "' and cFor = '" + drpType.SelectedItem.ToString() + "' order by ctitle");
                drpCategory2.DataSource = dt;
                drpCategory2.DataTextField = "ctitle";
                drpCategory2.DataValueField = "rcId";
                drpCategory2.DataBind();

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }

        }
    }


    public void databinddrpVarient()
    {
        try
        {
            dt = obj.show("select varId,varTitle from tbVarients where type = '"+drpType.SelectedValue.ToString()+"' order by varId");
            drpVarient.DataSource = dt;
            drpVarient.DataTextField = "varTitle";
            drpVarient.DataValueField = "varId";
            drpVarient.DataBind();

        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        }
    }

    public void databindgrdItems()
    {
        try
        {
            dt = obj.show("select A.rscId,A.rcId,A.sctitle,A.scIcon,A.varient,A.rate,(select varId from tbVarients where varTitle = A.varient) as varId from tbRestaurantSubCategory A where rcId = '" + drpCategory.SelectedValue.ToString() + "' order by A.rcId,A.scTitle,varId");
            grdItems.DataSource = dt;
            grdItems.DataBind();
            lblCount.Text = "(" + dt.Rows.Count.ToString() + ")";

        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        }
        
    }

    public void databindgrdItemsList()
    {
        string restaurantId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (restaurantId != "")
        {
            try
            {
                dt = obj.show("select distinct rcId,sctitle,scIcon from tbRestaurantSubCategory where rcId = '"+drpCategory2.SelectedValue.ToString()+"'");
                grdItemsList.DataSource = dt;
                grdItemsList.DataBind();
                lblCount.Text = "(" + dt.Rows.Count.ToString() + ")";

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }
        }
        

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new conn();
        if (!IsPostBack)
        {
            resetCol1();
            resetCol2();
            databinddrpCategory();
            databinddrpVarient();
            databindgrdItems();
        }
    }
    protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        databindgrdItems();
    }
    protected void drpCategory2_SelectedIndexChanged(object sender, EventArgs e)
    {
        databindgrdItemsList();
        txtItemName.Text = "";
        lbloscTitle.Text = "";
        lbloscIcon.Text = "";
        btnUpdate.Enabled = false;

        if (divhideRaterow.Visible)
        {
            foreach (GridViewRow row in grdItemsList.Rows)
            {
                LinkButton lnkEdit = (LinkButton)row.FindControl("lnkEdit");
                lnkEdit.Text = "Add";
            }
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int distance;
        if (txtItemName.Text == "" || txtRate.Text == "" || !int.TryParse(txtRate.Text, out distance))
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "itemerror", "ierror(1)", true);
            return;
        }

        pth = imgDefault.ImageUrl;
        if (divshow.Visible)
        {
            pth = imgUploaded.ImageUrl;
        }
        try
        {
            int k = obj.match("select count(*) from tbRestaurantSubCategory where sctitle = '" + txtItemName.Text.ToUpper() + "' and rcId = '" + drpCategory.SelectedValue.ToString() + "' and varient = '" + drpVarient.SelectedItem.ToString() + "'");
            if (k > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "itemerror", "ierror(2)", true);
                databindgrdItems();
                return;
            }
            if (profile_choose.HasFile)
            {
                string var = Guid.NewGuid().ToString().Substring(0, 6);
                pth = "../images/r_subcategory/" + var + "_" + profile_choose.FileName;
                profile_choose.PostedFile.SaveAs(Server.MapPath(pth));
            }

            k = obj.query("insert into tbRestaurantSubCategory values('" + drpCategory.SelectedValue.ToString() + "','" + txtItemName.Text.ToUpper() + "','" + pth + "','" + drpVarient.SelectedItem.ToString() + "','" + Convert.ToInt32(txtRate.Text) + "')");
            if (k > 0)
            {
                drpCategory.Enabled = false;
                txtItemName.Enabled = false;
                divupload.Visible = false;
                divshow.Visible = true;
                imgUploaded.ImageUrl = pth;
                resetCol2();
                txtRate.Text = "";
                //txtItemName.Text = "";
                databindgrdItems();
            }

        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        }

    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        string value = "";
        CheckBox cb;
        foreach (GridViewRow row in grdItems.Rows)
        {
            cb = (CheckBox)row.FindControl("Chk");
            if (cb.Checked)
            {
                Label id = (Label)row.FindControl("lblrscId");
                Label del = (Label)row.FindControl("lblscIcon");
                if (value == "")
                {
                    value = value + "'" + id.Text + "'";
                }
                else
                {
                    value = value + ",'" + id.Text + "'";
                }
                if(del.Text != imgDefault.ImageUrl)
                {
                    var filepath = Server.MapPath(del.Text);
                    if (File.Exists(filepath))
                    {
                        File.Delete(filepath);

                    }
                }
                
            }
        }
        if (value != "")
        {
            try
            {
                int k = obj.query("delete from tbRestaurantSubCategory where rscId in (" + value + ")");
                if (k > 0)
                {
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "cnerror", "cnerror(2)", true);
                    //txtItemName.Text = "";
                }

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }
            //obj.query("delete from tbModel where mid in ( " + value + ")");
        }

        databindgrdItems();

    }

    protected void ChkAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)grdItems.HeaderRow.FindControl("ChkAll");
        CheckBox cb;
        foreach (GridViewRow row in grdItems.Rows)
        {
            cb = (CheckBox)row.FindControl("Chk");
            cb.Checked = chk.Checked;
        }

    }

    protected void Chk_CheckedChanged(object sender, EventArgs e)
    {
        bool f = false;
        CheckBox cb;

        foreach (GridViewRow row in grdItems.Rows)
        {
            cb = (CheckBox)row.FindControl("Chk");
            if (!cb.Checked)
            {
                f = true;
                break;
            }

        }
        CheckBox chk = (CheckBox)grdItems.HeaderRow.FindControl("ChkAll");
        chk.Checked = !f;

    }

    protected void grdItemsList_RowEditing(object sender, GridViewEditEventArgs e)
    {
        
        GridViewRow row = grdItemsList.Rows[e.NewEditIndex];
        LinkButton lnkEdit = (LinkButton)row.FindControl("lnkEdit");

        Label rcId = (Label)row.FindControl("lblrcId");
        Label sctitle = (Label)row.FindControl("lblsctitle");
        Label scIcon = (Label)row.FindControl("lblscIcon");
        lbloscTitle.Text = sctitle.Text;
        lbloscIcon.Text = scIcon.Text;
        drpCategory.SelectedValue = rcId.Text;

        if (lnkEdit.Text == "Edit")
        {
            btnUpdate.Enabled = true;
            lblisIcon.Text = "1";
            txtItemName.Text = sctitle.Text;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "setlogo", "setlogo('" + scIcon.Text + "')", true);

        }
        else
        {

            imgUploaded.ImageUrl = scIcon.Text;
            txtItemName.Text = sctitle.Text;
            btnAdd.Enabled = true;
            databindgrdItems();
            showgrd(1);
            btnDone.Text = "Option";
        }
    }



    
    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        if (lbloscTitle.Text == "" || lbloscTitle.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "uperror", "uperror(1)", true);
            return;
        }
        if (txtItemName.Text == "")
        {
            lblisIcon.Text = "1";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "uperror", "uperror(2);setlogo('" + lbloscIcon.Text + "')", true);
            return;
        }

        pth = lbloscIcon.Text;

        if (lblisIcon.Text == "0")
        {
            if (pth != imgDefault.ImageUrl)
            {
                var filepath = Server.MapPath(pth);
                if (File.Exists(filepath))
                {
                    File.Delete(filepath);

                }
            }
            
            pth = imgDefault.ImageUrl;
        }

        if (profile_choose.HasFile)
        {
            if(lbloscIcon.Text != imgDefault.ImageUrl)
            {
                var filepath = Server.MapPath(lbloscIcon.Text);
                if (File.Exists(filepath))
                {
                    File.Delete(filepath);

                }
            }
            
            string var = Guid.NewGuid().ToString().Substring(0, 6);
            pth = "../images/r_subcategory/" + var + "_" + profile_choose.FileName;
            profile_choose.PostedFile.SaveAs(Server.MapPath(pth));
        }


        try
        {
            int k = obj.query("update tbRestaurantSubCategory set sctitle = '" + txtItemName.Text.ToUpper() + "' , scIcon = '" + pth + "' where sctitle = '" + lbloscTitle.Text + "' and scIcon = '"+lbloscIcon.Text+"' and rcId = '"+drpCategory2.SelectedValue.ToString()+"'");
            if (k > 0)
            {
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "cnerror", "cnerror(2)", true);
                txtItemName.Text = "";
                databindgrdItemsList();

                //Response.Redirect("productItems.aspx");
            }

        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }

    protected void btnCancelUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("productItems.aspx");
    }

    protected void btnEnableDeletion_Click(object sender, EventArgs e)
    {
        if (btnEnableDeletion.Text == "Deletion")
        {
            btnEnableDeletion.Text = "Done";
            //BrandsModels.Columns[0].Visible = false;
            btnEnableUpdation.Text = "Updation";
            grdItems.Columns[6].Visible = false;

            grdItems.Columns[5].Visible = true;
            //btnAddModel.Enabled = false;
        }
        else
        {
            btnEnableDeletion.Text = "Deletion";
            //if (txtModelName.Enabled) { btnAddModel.Enabled = true; }

            //BrandsModels.Columns[0].Visible = true;
            grdItems.Columns[5].Visible = false;
        }
    }
    protected void btnEnableUpdation_Click(object sender, EventArgs e)
    {
        if (btnEnableUpdation.Text == "Updation")
        {
            grdItems.Columns[5].Visible = false;
            btnEnableDeletion.Text = "Deletion";
            grdItems.Columns[6].Visible = true;
            btnEnableUpdation.Text = "Done";
            //btnAddSize.Enabled = false;
        }
        else
        {
            grdItems.Columns[6].Visible = false;
            btnEnableUpdation.Text = "Updation";
            Response.Redirect("productItems.aspx");
            //if (VehicleType.SelectedValue.ToString() != "0") { btnAddSize.Enabled = true; }

            //Sizes.Columns[0].Visible = true;
            //Sizes.Columns[4].Visible = false;
        }


    }

    protected void btnIsicon_Click(object sender, EventArgs e)
    {
        lblisIcon.Text = "0";
    }

    public void resetgrdItems()
    {
        foreach (GridViewRow row in grdItems.Rows)
        {
            //Label lblRate = (Label)row.FindControl("lblRate");
            TextBox txtRate = (TextBox)row.FindControl("txtRate");
            HtmlGenericControl divlblRate = (HtmlGenericControl)row.FindControl("divlblRate");
            //lblRate.Visible = false;
            txtRate.Visible = false;
            divlblRate.Visible = true;
        }
        grdItems.Columns[5].Visible = false;
    }
    public void resetgrdItemsList()
    {
        foreach (GridViewRow row in grdItemsList.Rows)
        {
            LinkButton lnkEdit = (LinkButton)row.FindControl("lnkEdit");
            lnkEdit.Text = "Edit";
        }
    }
    public void resetCol1()
    {
        drpCategory.Enabled = true;
        txtItemName.Text = "";
        txtRate.Text = "";
        txtItemName.Enabled = true;
        divupload.Visible = true;
        divshow.Visible = false;
        imgUploaded.ImageUrl = "";
        divShowInsertbtn.Visible = true;
        divShowUpdatebtn.Visible = false;
        divhideRaterow.Visible = true;
        btnAdd.Enabled = true;
        btnUpdate.Enabled = true;
    }
    public void resetCol2()
    {
        divItemsgrd.Visible = true;
        divItemList.Visible = false;
        divUpdateRates.Visible = false;
        btnDone.Text = "Options";
        resetgrdItems();
        resetgrdItemsList();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        resetCol1();
        //Response.Redirect("productItems.aspx");
    }

    protected void btnDone_Click(object sender, EventArgs e)
    {
        if(btnDone.Text == "Done")
        {
            Response.Redirect("productItems.aspx");
        }
    }

    protected void lnkDeletion_Click(object sender, EventArgs e)
    {
        resetCol1();
        resetCol2();
        //showgrd(1);
        btnDone.Text = "Done";
        
        grdItems.Columns[5].Visible = true;

    }

    protected void lnkUpdateRates_Click(object sender, EventArgs e)
    {
        resetCol1();
        resetCol2();
        foreach (GridViewRow row in grdItems.Rows)
        {
            //Label lblRate = (Label)row.FindControl("lblRate");
            TextBox txtRate = (TextBox)row.FindControl("txtRate");
            HtmlGenericControl divlblRate = (HtmlGenericControl)row.FindControl("divlblRate");
            //lblRate.Visible = false;
            txtRate.Visible = true;
            divlblRate.Visible = false;
        }
        divUpdateRates.Visible = true;
        btnDone.Text = "Done";
    }

    protected void lnkUpdateItem_Click(object sender, EventArgs e)
    {
        resetCol1();
        resetCol2();

        showgrd(2);
        showbtn(2);

        databinddrpCategory2();
        databindgrdItemsList();
        divhideRaterow.Visible = false;
        drpCategory.Enabled = false;
        btnUpdate.Enabled = false;
        btnDone.Text = "Done";

    }

    protected void lnkAddVarient_Click(object sender, EventArgs e)
    {
        resetCol1();
        resetCol2();

        showgrd(2);
        //showbtn(1);
        databinddrpCategory2();
        databindgrdItemsList();
        foreach (GridViewRow row in grdItemsList.Rows)
        {
            LinkButton lnkEdit = (LinkButton)row.FindControl("lnkEdit");
            lnkEdit.Text = "Add";
        }

        divupload.Visible = false;
        divshow.Visible = true;
        txtItemName.Enabled = false;
        drpCategory.Enabled = false;
        btnDone.Text = "Done";
        btnAdd.Enabled = false;
    }

    protected void btnUpdateRates_Click(object sender, EventArgs e)
    {
        int distance;
        string query="";
        foreach (GridViewRow row in grdItems.Rows)
        {
            Label lblrowrscId = (Label)row.FindControl("lblrscId");
            TextBox txtrowRate = (TextBox)row.FindControl("txtRate");
            HtmlGenericControl divlblrowRate = (HtmlGenericControl)row.FindControl("divlblRate");
            //lblRate.Visible = false;
            if(txtrowRate.Text != "" && int.TryParse(txtrowRate.Text, out distance))
            {
                query = query + "update tbRestaurantSubCategory set Rate = '"+Convert.ToInt32(txtrowRate.Text)+"' where rscId = '"+lblrowrscId.Text+"'"  + " "; 
            }

            txtRate.Visible = false;
            divlblrowRate.Visible = true;
        }
        try
        {
            if (query != "")
            {
                int k = obj.query(query);
                if (k > 0)
                {
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "cnerror", "cnerror(2)", true);
                    //txtItemName.Text = "";
                    //databindgrdItems();
                    databindgrdItems();
                    btnDone.Text = "Options";
                    divUpdateRates.Visible = false;
                    //Response.Redirect("productItems.aspx");
                }
            }

        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        }

    }

    protected void drpType_SelectedIndexChanged(object sender, EventArgs e)
    {
        resetCol1();resetCol2();
        databinddrpCategory();
        databindgrdItems();
        databinddrpCategory2();
        databinddrpVarient();
        //databindgrdCategory();
    }
}