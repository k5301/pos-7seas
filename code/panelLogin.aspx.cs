using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class panelLogin : System.Web.UI.Page
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
                string username = cookie["r_user"];
                cookie["r_auth"] = "0";
                Response.Cookies.Set(cookie);

                if (auth == "1")
                {
                    txtadminusername.Text = username;
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "fap", "fap()", true);
                }
                else if(auth == "2")
                {
                    txtbmusername.Text = username;
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "manager", "manager()", true);

                }

                //if (auth == "1")
                //{
                //    if (loggedIn == "1")
                //    {
                //        try
                //        {
                //            dt = obj.show("select username,deviceId,valid_status,logged_in_status,date_expiry from tbAdmin where restaurantId = '" + id + "' and username = '" + username + "'");
                //            if (dt.Rows.Count > 0)
                //            {
                //                string o_loggedIn = dt.Rows[0]["logged_in_status"].ToString();
                //                string o_deviceId = dt.Rows[0]["deviceId"].ToString();
                //                //string o_valid = dt.Rows[0]["valid_status"].ToString();
                //                //string o_expiry = dt.Rows[0]["date_expiry"].ToString();
                //                if (o_loggedIn == "1" && o_deviceId == deviceId)
                //                {
                //                    Response.Redirect("u_Admin/dashboard.aspx");
                //                }
                //            }
                //        }
                //        catch (Exception err) {
                //            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
                //        }
                //    }
                //    txtadminusername.Text = username;
                //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "fap", "fap()", true);
                //}
                //else
                //{
                //    if (loggedIn == "1")
                //    {
                //        try
                //        {
                //            dt = obj.show("select username,deviceId,valid_status,logged_in_status,date_expiry from tbManager where managerId = '" + id + "' and username = '" + username + "'");
                //            if (dt.Rows.Count > 0)
                //            {
                //                string o_loggedIn = dt.Rows[0]["logged_in_status"].ToString();
                //                string o_deviceId = dt.Rows[0]["deviceId"].ToString();
                //                //string o_valid = dt.Rows[0]["valid_status"].ToString();
                //                //string o_expiry = dt.Rows[0]["date_expiry"].ToString();
                //                if (o_loggedIn == "1" && o_deviceId == deviceId)
                //                {
                //                    Response.Redirect("u_Admin/adminDashboard.aspx");
                //                }
                //            }
                //        }
                //        catch (Exception err) {
                //            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
                //        }        
                //    }
                //    txtbmusername.Text = username;
                //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "manager", "manager()", true);
                //}
            }
        }
    }

    protected void lnkAdmin_Click(object sender, EventArgs e)
    {
        SqlParameter[] pr = {
                    new SqlParameter("@ch",1),
                    new SqlParameter("@username",txtadminusername.Text),
                    new SqlParameter("@password",txtadminpassword.Text)

                };

        int x = obj.matchProcedure("prLogin", pr);
        if (x > 0)
        {
            string o_deviceId = "";
            string o_restaurantId = "";
            try
            {
                string updateloggedinstatus = "update tbAdmin set logged_in_status = '1' where username = '" + txtadminusername.Text + "' "; 
                dt = obj.show(updateloggedinstatus + "select restaurantId,username,deviceId,valid_status,logged_in_status,date_expiry from tbAdmin where username = '" + txtadminusername.Text + "'");
                if (dt.Rows.Count > 0)
                {
                    o_restaurantId = dt.Rows[0]["restaurantId"].ToString();
                    //string o_loggedIn = dt.Rows[0]["logged_in_status"].ToString();
                    o_deviceId = dt.Rows[0]["deviceId"].ToString();
                    //string o_valid = dt.Rows[0]["valid_status"].ToString();
                    //string o_expiry = dt.Rows[0]["date_expiry"].ToString();

                    HttpCookie cookie = Request.Cookies["r_data"];
                    if (cookie != null)
                    {
                        string deviceId = cookie["r_did"];
                        if (deviceId != o_deviceId)
                        {
                            obj.query("update tbAdmin set deviceId = '" + deviceId + "' where restaurantId = '" + o_restaurantId + "'");
                        }
                        cookie["r_authentication"] = "1";
                        cookie["r_authId"] = o_restaurantId;
                        cookie["r_auth"] = "1";
                        cookie["r_user"] = txtadminusername.Text;
                        cookie.Expires = DateTime.Now.AddYears(1);
                        Response.Cookies.Set(cookie);

                    }
                    else
                    {

                        string var = Guid.NewGuid().ToString().Substring(0, 6);
                        string deviceId = txtadminusername + var;
                        obj.query("update tbAdmin set deviceId = '" + deviceId + "' where restaurantId = '" + o_restaurantId + "'");
                        cookie = new HttpCookie("r_data");
                        cookie["r_authentication"] = "1";
                        cookie["r_authId"] = o_restaurantId;
                        cookie["r_auth"] = "1";
                        cookie["r_did"] = deviceId;
                        cookie["r_user"] = txtadminusername.Text;
                        cookie.Expires = DateTime.Now.AddYears(1);
                        Response.Cookies.Add(cookie);
                    }
                    Response.Redirect("u_Admin/dashboard.aspx");
                }
            }
            catch (Exception err) {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }
            
        }

        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "wrong", "wrongCredential()", true);
        }
    }

    protected void lnkBranch_Click(object sender, EventArgs e)
    {
        SqlParameter[] pr = {
                    new SqlParameter("@ch",2),
                    new SqlParameter("@username",txtbmusername.Text),
                    new SqlParameter("@password",txtbmpassword.Text)

                };

        int x = obj.matchProcedure("prLogin", pr);
        if (x > 0)
        {
            string o_deviceId = "";
            string o_managerId = "";
            try
            {
                string updateloggedinstatus = "update tbManager set logged_in_status = '1' where username = '" + txtbmusername.Text + "' ";
                dt = obj.show(updateloggedinstatus + "select managerId,username,deviceId,valid_status,logged_in_status,date_expiry from tbManager where username = '" + txtbmusername.Text + "'");
                if (dt.Rows.Count > 0)
                {
                    o_managerId = dt.Rows[0]["managerId"].ToString();
                    //string o_loggedIn = dt.Rows[0]["logged_in_status"].ToString();
                    o_deviceId = dt.Rows[0]["deviceId"].ToString();
                    //string o_valid = dt.Rows[0]["valid_status"].ToString();
                    //string o_expiry = dt.Rows[0]["date_expiry"].ToString();

                    HttpCookie cookie = Request.Cookies["r_data"];
                    if (cookie != null)
                    {
                        string deviceId = cookie["r_did"];
                        if (deviceId != o_deviceId)
                        {
                            obj.query("update tbManager set deviceId = '" + deviceId + "' where managerId = '" + o_managerId + "'");
                        }
                        cookie["r_authentication"] = "2";
                        cookie["r_authId"] = o_managerId;
                        cookie["r_auth"] = "1";
                        cookie["r_user"] = txtbmusername.Text;
                        cookie.Expires = DateTime.Now.AddYears(1);
                        Response.Cookies.Set(cookie);

                    }
                    else
                    {
                        string var = Guid.NewGuid().ToString().Substring(0, 6);
                        string deviceId = txtadminusername + var;
                        obj.query("update tbManager set deviceId = '" + deviceId + "' where managerId = '" + o_managerId + "'");
                        cookie = new HttpCookie("r_data");
                        cookie["r_authentication"] = "2";
                        cookie["r_authId"] = o_managerId;
                        cookie["r_auth"] = "1";
                        cookie["r_did"] = deviceId;
                        cookie["r_user"] = txtbmusername.Text;
                        cookie.Expires = DateTime.Now.AddYears(1);
                        Response.Cookies.Add(cookie);
                    }
                    Response.Redirect("u_BranchManager/dashboard.aspx");
                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }

        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "wrong", "wrongCredential()", true);
        }
    }
}