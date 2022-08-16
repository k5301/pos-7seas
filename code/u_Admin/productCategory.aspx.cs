using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class u_Admin_productCategory : System.Web.UI.Page
{
    string pth;
    DataTable dt;
    conn obj;

    public void databindgrdCategory()
    {
        string restaurantId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (restaurantId != "")
        {   
            try
            {
                dt = obj.show("select rcId,ctitle,cIcon from tbRestaurantCategory where restaurantId = '"+restaurantId+"' and cfor = '"+drpType.SelectedItem.ToString()+"'");
                grdCategory.DataSource = dt;
                grdCategory.DataBind();
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
            databindgrdCategory();
        }
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        string value = "";
        CheckBox cb;
        foreach (GridViewRow row in grdCategory.Rows)
        {
            cb = (CheckBox)row.FindControl("Chk");
            if (cb.Checked)
            {
                Label id = (Label)row.FindControl("lblrcId");
                Label del = (Label)row.FindControl("lblcIcon");
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
                        //File.Delete(filepath);

                    }
                }
                
            }
        }
        if (value != "")
        {
            try
            {
                //int k = obj.query("delete from tbRestaurantSubCategory where rcId in (" + value + ")  delete from tbRestaurantCategory where rcId in (" + value+")");
                //if (k > 0)
                //{
                //    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "cnerror", "cnerror(2)", true);
                //    txtCategoryName.Text = "";
                //}

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }
            //obj.query("delete from tbModel where mid in ( " + value + ")");
        }

        databindgrdCategory();
        
    }

    protected void ChkAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)grdCategory.HeaderRow.FindControl("ChkAll");
        CheckBox cb;
        foreach (GridViewRow row in grdCategory.Rows)
        {
            cb = (CheckBox)row.FindControl("Chk");
            cb.Checked = chk.Checked;
        }

    }

    protected void Chk_CheckedChanged(object sender, EventArgs e)
    {
        bool f = false;
        CheckBox cb;

        foreach (GridViewRow row in grdCategory.Rows)
        {
            cb = (CheckBox)row.FindControl("Chk");
            if (!cb.Checked)
            {
                f = true;
                break;
            }

        }
        CheckBox chk = (CheckBox)grdCategory.HeaderRow.FindControl("ChkAll");
        chk.Checked = !f;

    }

    protected void grdCategory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        drpType.Enabled = false;

        btnAdd.Visible = false;
        btnCancel.Visible = false;
        btnCancelUpdate.Visible = true;
        btnUpdate.Visible = true;

        GridViewRow row = grdCategory.Rows[e.NewEditIndex];
        Label id = (Label)row.FindControl("lblrcId");
        lblrcId.Text = id.Text;
        Label ctitle = (Label)row.FindControl("lblctitle");
        Label cIcon = (Label)row.FindControl("lblcIcon");
        lblcIcon.Text = cIcon.Text;
        lblisIcon.Text = "1";
        txtCategoryName.Text = ctitle.Text;
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "setlogo", "setlogo('"+cIcon.Text+"')", true);
    }



    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string restaurantId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (restaurantId != "")
        {
            if(txtCategoryName.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "cnerror", "cnerror(1)", true);
                return;
            }

            pth = imgDefault.ImageUrl;
            
            try
            {
                int k = obj.match("select count(*) from tbRestaurantCategory where ctitle = '"+ txtCategoryName.Text.ToUpper() + "' and restaurantId = '"+restaurantId+"'");
                if (k > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "cnerror", "cnerror(2)", true);
                    databindgrdCategory();
                    return;
                }
                if (profile_choose.HasFile)
                {
                    string var = Guid.NewGuid().ToString().Substring(0, 6);
                    pth = "../images/r_category/" + var + "_" + profile_choose.FileName;
                    profile_choose.PostedFile.SaveAs(Server.MapPath(pth));
                }

                k = obj.query("insert into tbRestaurantCategory values('"+restaurantId+"','"+txtCategoryName.Text.ToUpper() +"','"+pth+"','"+drpType.SelectedItem.ToString() +"')");
                if (k > 0)
                {
                    txtCategoryName.Text = "";
                    databindgrdCategory();
                }

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }

        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (txtCategoryName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "cnerror", "cnerror(1)", true);
            return;
        }

        pth = lblcIcon.Text;

        if(lblisIcon.Text == "0")
        {
            if (pth != imgDefault.ImageUrl)
            {
                var filepath = Server.MapPath(pth);
                if (File.Exists(filepath))
                {
                    File.Delete(filepath);

                }
                pth = imgDefault.ImageUrl;

            }
        }

        if (profile_choose.HasFile)
        {
            if (lblcIcon.Text != imgDefault.ImageUrl)
            {
                var filepath = Server.MapPath(lblcIcon.Text);
                if (File.Exists(filepath))
                {
                    File.Delete(filepath);

                }
            }
            
            string var = Guid.NewGuid().ToString().Substring(0, 6);
            pth = "../images/r_category/" + var + "_" + profile_choose.FileName;
            profile_choose.PostedFile.SaveAs(Server.MapPath(pth));
        }


        try
        {
            int k = obj.query("update tbRestaurantCategory set ctitle = '" + txtCategoryName.Text.ToUpper() + "' , cIcon = '" + pth + "' where rcId = '"+lblrcId.Text+"'");
            if (k > 0)
            {
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "cnerror", "cnerror(2)", true);
                //txtCategoryName.Text = "";
                //databindgrdCategory();

                Response.Redirect("productCategory.aspx");
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
        Response.Redirect("productCategory.aspx");
    }
    
    protected void btnEnableDeletion_Click(object sender, EventArgs e)
    {
        if (btnEnableDeletion.Text == "Deletion")
        {
            btnEnableDeletion.Text = "Done";
            //BrandsModels.Columns[0].Visible = false;
            btnEnableUpdation.Text = "Updation";
            grdCategory.Columns[4].Visible = false;

            grdCategory.Columns[3].Visible = true;
            //btnAddModel.Enabled = false;
        }
        else
        {
            btnEnableDeletion.Text = "Deletion";
            //if (txtModelName.Enabled) { btnAddModel.Enabled = true; }

            //BrandsModels.Columns[0].Visible = true;
            grdCategory.Columns[3].Visible = false;
        }
    }
    protected void btnEnableUpdation_Click(object sender, EventArgs e)
    {
        if (btnEnableUpdation.Text == "Updation")
        {
            grdCategory.Columns[3].Visible = false;
            btnEnableDeletion.Text = "Deletion";
            grdCategory.Columns[4].Visible = true;
            btnEnableUpdation.Text = "Done";
            //btnAddSize.Enabled = false;
        }
        else
        {
            grdCategory.Columns[4].Visible = false;
            btnEnableUpdation.Text = "Updation";
            Response.Redirect("productCategory.aspx");
            //if (VehicleType.SelectedValue.ToString() != "0") { btnAddSize.Enabled = true; }

            //Sizes.Columns[0].Visible = true;
            //Sizes.Columns[4].Visible = false;
        }


    }

    protected void btnIsicon_Click(object sender, EventArgs e)
    {
        lblisIcon.Text = "0";
    }


    protected void drpType_SelectedIndexChanged(object sender, EventArgs e)
    {
        databindgrdCategory();
    }
}