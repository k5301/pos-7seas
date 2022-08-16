using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
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
                string auth = cookie["r_authentication"];
                string id = cookie["r_authId"];
                string loggedIn = cookie["r_auth"];
                string deviceId = cookie["r_did"];
                string username = cookie["r_user"];

                if(loggedIn == "1")
                {
                    if(auth == "1")
                    {
                        try
                        {
                            dt = obj.show("select deviceId,logged_in_status from tbAdmin where restaurantId = '" + id + "' and username = '" + username + "'");
                            if (dt.Rows.Count > 0)
                            {
                                string o_loggedIn = dt.Rows[0]["logged_in_status"].ToString();
                                string o_deviceId = dt.Rows[0]["deviceId"].ToString();

                                if (o_loggedIn == "1" && o_deviceId == deviceId)
                                {
                                    Response.Redirect("u_Admin/dashboard.aspx");
                                }

                            }
                        }
                        catch(Exception err)
                        {
                            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
                        }

                    }
                    else if (auth == "2")
                    {
                        try
                        {
                            dt = obj.show("select deviceId,logged_in_status from tbManager where managerId = '" + id + "' and username = '" + username + "'");
                            if (dt.Rows.Count > 0)
                            {
                                string o_loggedIn = dt.Rows[0]["logged_in_status"].ToString();
                                string o_deviceId = dt.Rows[0]["deviceId"].ToString();

                                if (o_loggedIn == "1" && o_deviceId == deviceId)
                                {
                                    Response.Redirect("u_BranchManager/dashboard.aspx");
                                }

                            }
                        }
                        catch (Exception err)
                        {
                            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
                        }
                    }
                }
                Response.Redirect("panelLogin.aspx");
                
            }
            Response.Redirect("panelLogin.aspx");
        }
    }
}