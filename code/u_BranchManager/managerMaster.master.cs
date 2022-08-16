using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class u_BranchManager_managerMaster : System.Web.UI.MasterPage
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
                string managerId = cookie["r_authId"];
                string loggedIn = cookie["r_auth"];
                string deviceId = cookie["r_did"];
                string username = cookie["r_user"];
                if (admin == "1" || loggedIn != "1")
                {
                    cookie["r_auth"] = "0";
                    Response.Cookies.Set(cookie);
                    Response.Redirect("../panelLogin.aspx");
                }
                else
                {
                    try
                    {
                        dt = obj.show("select A.name,A.email,A.profileimg,A.countertitle,(select firmTitle from tbAdmin where restaurantId = (select restaurantId from tbBranch where branchId = A.branchId)) as firmTitle,username,deviceId,valid_status,logged_in_status,date_expiry from tbManager A where managerId = '" + managerId+"' and username = '"+username+"'");

                    }
                    catch (Exception err)
                    {
                        Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
                    }
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
                            string firmTitle = dt.Rows[0]["firmTitle"].ToString() + ": " + dt.Rows[0]["countertitle"].ToString();
                            string email = dt.Rows[0]["email"].ToString();
                            string profilepic = dt.Rows[0]["profileimg"].ToString();
                            lblMName.Text = name;
                            imgprofilepic.ImageUrl = profilepic;
                            mainPic.ImageUrl = profilepic;
                            string checkexpiry = "chkexpiry('" + o_expiry + "','" + name + "','" + email + "','" + firmTitle + "');";
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "chk", checkexpiry, true);
                        }
                    }
                    else
                    {
                        Response.Redirect("../panelLogin.aspx");
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
        string managerId = "";
        if (cookie != null)
        {
            managerId = cookie["r_authId"];
            cookie["r_auth"] = "0";
            Response.Cookies.Set(cookie);
        }
        try
        {
            obj.query("update tbManager set logged_in_status = '0'  where managerId = '" + managerId + "'");

        }
        catch (Exception err)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
        }
        Response.Redirect("../panelLogin.aspx");
    }

    public void sendmail(string email,string subject,string msg)
    {
        try
        {
            SmtpClient smtpclient = new SmtpClient();
            MailMessage mail = new MailMessage();
            mail.IsBodyHtml = true;

            //Set the email from address of mail message -  Change this as per your settings

            //MailAddress fromaddress = new MailAddress("otptocheck@gmail.com");
            MailAddress fromaddress = new MailAddress("oilbazaar.dealer@gmail.com");
            //Set the email smtp host -  Change this as per your settings
            smtpclient.Host = "smtp.gmail.com";
            //Set the email client port -  Change this as per your settings
            smtpclient.Port = 587;
            smtpclient.EnableSsl = true;
            mail.From = fromaddress;

            string MailText = msg;
            mail.To.Add(email.Trim());

            //Set the email subject
            mail.Subject = (subject);

            //Set the email body - Change this as per your logic
            mail.Body = MailText;
            smtpclient.DeliveryMethod = SmtpDeliveryMethod.Network;
            //smtpclient.Credentials = new System.Net.NetworkCredential("otptocheck@gmail.com", "hesoYAMK5");
            smtpclient.Credentials = new System.Net.NetworkCredential("oilbazaar.dealer@gmail.com", "7015480251");
            //Sending Email//
            smtpclient.Send(mail);
            //ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"alertMessage","alert('Mail Sent')",true);

            // Page.ClientScript.RegisterClientScriptBlock(this.GetType(),"script","alert('Mail Sent')",true);
        }
        catch (Exception e)
        {
            //Response.Write("<script>alert(" + e.Message + ")</script>");
        }

    }


    protected void lnkSendMail_Click(object sender, EventArgs e)
    {
        string managerId = Request.Cookies["r_data"]["r_authId"].ToString();
        if (managerId != "")
        {
            try
            {
                string date = DateTime.Now.ToString("yyyy-MM-dd");
                
                string income = "(select sum(Total) from tbRestaurantOrder where managerId = '"+managerId+"' and Date = '"+date+"' and doneStatus = '1') as income,";
                string orders = "(select count(*) from tbRestaurantOrder where managerId = '" + managerId + "' and Date = '" + date + "' and doneStatus = '1') as orders,";
                string mailId = "(select email from tbAdmin where restaurantId = (select restaurantId from tbBranch where branchId = (select branchId from tbManager where managerId = '" + managerId + "'))) as email";
                dt = obj.show("select " + income + orders + mailId);
                if (dt.Rows.Count > 0)
                {
                    income = dt.Rows[0]["income"].ToString();
                    if(income == "")
                    {
                        income = "0";
                    }
                    orders = dt.Rows[0]["orders"].ToString();
                    mailId = dt.Rows[0]["email"].ToString();
                    string subject = lblMName.Text + ": Shut Down";
                    string msg = "Today's orders: " + orders + ";Today's sale Amount: " + income;
                    sendmail(mailId,subject,msg);
                }

            }
            catch (Exception err)
            {
                Response.Write("<script>alert('" + Server.HtmlEncode(err.Message) + "')</script>");
            }
        }
        
    }

}
