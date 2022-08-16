using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class u_Admin_adminMaster : System.Web.UI.MasterPage
{
    string pth;
    DataTable dt;
    conn obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new conn();
        if (!IsPostBack)
        {
            HttpCookie cookie = Request.Cookies["r_data"];
            if (cookie != null)
            {
                string admin = cookie["r_authentication"];
                string restaurantId = cookie["r_authId"];
                string loggedIn = cookie["r_auth"];
                string deviceId = cookie["r_did"];
                string username = cookie["r_user"];
                if (admin != "1" || loggedIn != "1")
                {
                    cookie["r_auth"] = "0";
                    Response.Cookies.Set(cookie);
                    Response.Redirect("../panelLogin.aspx");
                }
                else
                {
                    try
                    {
                        dt = obj.show("select name,email,profilepic,firmTitle,username,deviceId,valid_status,logged_in_status,date_expiry from tbAdmin where restaurantId = '" + restaurantId + "' and username = '" + username + "'");
                        if (dt.Rows.Count > 0)
                        {
                            string o_loggedIn = dt.Rows[0]["logged_in_status"].ToString();
                            string o_deviceId = dt.Rows[0]["deviceId"].ToString();
                            string o_valid = dt.Rows[0]["valid_status"].ToString();
                            string o_expiry = dt.Rows[0]["date_expiry"].ToString();

                            if (o_loggedIn != "1")
                            {
                                Response.Redirect("../panelLogin.aspx");
                            }
                            else if (deviceId != o_deviceId)
                            {
                                Response.Redirect("../panelLogin.aspx");
                            }
                            else if (o_valid != "1")
                            {
                                Response.Redirect("../panelLogin.aspx");
                            }
                            else
                            {
                                string name = dt.Rows[0]["name"].ToString();
                                string firmTitle = dt.Rows[0]["firmTitle"].ToString();
                                string email = dt.Rows[0]["email"].ToString();
                                string profilepic = dt.Rows[0]["profilepic"].ToString();

                                imgprofilepic.ImageUrl = profilepic;
                                mainPic.ImageUrl = profilepic;
                                lblName.Text = name;
                                lblName2.Text = name;
                                lblEmail.Text = email;
                                lblFirmtitle.Text = firmTitle;
                                string checkexpiry = "chkexpiry('" + o_expiry + "','" + name + "','" + email + "','" + firmTitle + "');";
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "chk", checkexpiry, true);
                            }
                        }
                        else
                        {
                            Response.Redirect("../panelLogin.aspx");
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
                Response.Redirect("../panelLogin.aspx");
            }
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["r_data"];
        string restaurantId = "";
        if (cookie != null)
        {
            restaurantId = cookie["r_authId"];
            cookie["r_auth"] = "0";
            Response.Cookies.Set(cookie);
        }
        try
        {
            obj.query("update tbAdmin set logged_in_status = '0'  where restaurantId = '" + restaurantId + "'");

        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        }
        Response.Redirect("../panelLogin.aspx");
    }

}
