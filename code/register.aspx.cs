using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Net.Mail;

public partial class register : System.Web.UI.Page
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
        catch(Exception e)
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
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new conn();
        if (!IsPostBack)
        {
            databind_drpState();
            databind_drpCity();
        }
        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "pop", "fun();", true);
    }
    protected void lnkbtnSave_Click(object sender, EventArgs e)
    {

        //var httpRequest = HttpContext.Current.Request;
        
        JavaScriptSerializer JSON = new JavaScriptSerializer();
        admin record = (admin)JSON.Deserialize(Request["__EVENTARGUMENT"], typeof(admin));

        record.state = drpState.SelectedItem.ToString();
        record.city = drpCity.SelectedItem.ToString();

        if (profile_choose.HasFile && record.profilepic == "1")
        {
            string var = Guid.NewGuid().ToString().Substring(0, 6);
            pth = "~//u_Admin//assets//images//profile-logo//" + var + "_" + profile_choose.FileName;
            profile_choose.PostedFile.SaveAs(Server.MapPath(pth));
            record.profilepic = pth;
            //profilePic2.ImageUrl = pth;
            lblProfile.Text = pth;
        }
        if (logo_choose.HasFile && record.firmicon == "1")
        {
            string var = Guid.NewGuid().ToString().Substring(0, 6);
            pth = "~//u_Admin//assets//images//profile-logo//" + var + "_" + logo_choose.FileName;
            logo_choose.PostedFile.SaveAs(Server.MapPath(pth));
            record.firmicon = pth;
            //logopic.ImageUrl = pth;
            lblLogo.Text = pth;
        }

        try
        {
            string var = Guid.NewGuid().ToString().Substring(0, 6);
            string deviceId = record.username + var;

            string insert = "insert into tbAdmin values('" + record.name + "','" + record.phone + "','" + record.email + "','" + record.username + "','" + record.password + "','" + record.profilepic + "','" + record.firmtitle + "','" + record.firmicon + "','" + record.state + "','" + record.city + "','" + record.address + "','" + record.date_started + "','" + record.date_registered + "','" + record.date_expiry + "','" + deviceId + "','1','1','1')";
            string insertbranch = "insert into tbBranch values ((select restaurantId from tbAdmin where username = '"+record.username+"'),'Branch1','"+record.state+ "','" + record.city + "','" + record.address + "')";
            string insertmanager = "insert into tbManager values ((select branchId from tbBranch where restaurantId = (select restaurantId from tbAdmin where username = '" + record.username + "')),'Counter1','','','','','','../images/custom/default.jfif','" + record.date_started + "','" + record.date_registered + "','" + record.date_expiry + "','','0','0','0','0')";
            string extract = "select * from tbAdmin where username = '"+record.username+"'";
            dt = obj.show(insert + " " + insertbranch + " " + insertmanager + " " + extract);
            if (dt.Rows.Count > 0)
            {
                string id = dt.Rows[0]["restaurantId"].ToString();
                HttpCookie cookie = Request.Cookies["r_data"];
                if(cookie != null)
                {
                    cookie["r_authentication"] = "1";
                    cookie["r_authId"] = id;
                    cookie["r_auth"] = "1";
                    cookie["r_did"] = deviceId;
                    cookie["r_user"] = record.username;
                    cookie.Expires = DateTime.Now.AddYears(5);
                    Response.Cookies.Set(cookie);
                    
                }
                else
                {
                    cookie = new HttpCookie("r_data");
                    cookie["r_authentication"] = "1";
                    cookie["r_authId"] = id;
                    cookie["r_auth"] = "1";
                    cookie["r_did"] = deviceId;
                    cookie["r_user"] = record.username;
                    cookie.Expires = DateTime.Now.AddYears(1);
                    Response.Cookies.Add(cookie);
                }
                //string fun = "done('"+ JSON.Serialize(record) + "');";
                //string fun = "done('" + id + "');";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "pop", "fun()", true);

            }

        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "err","alert('Error : '"+err+")", true);
        }
        



        //var name = record.name;
        //var phone = record.phone;
        //var email = record.email;
        //var username = record.username;
        //var password = record.password;
        //var profilepic = record.profilepic;
        //var firmtitle = record.firmtitle;
        //var firmicon = record.firmicon;
        //var sate = record.state;
        //var city = record.city;
        //var address = record.address;
        //var date_start = record.date_started;
        //var date_reg = record.date_registered;
        //var date_end = record.date_expiry;



        //var profile = profile_choose.FileName;
        //var Logo = logo_choose.FileName;
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "fun()", true);
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert(Profle : '" + profile_choose.FileName + "', Logo : '" + logo_choose.FileName + "' )", true);
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "fun();", true);
        //ClientScript.RegisterStartupScript(this.GetType(), "pop","<script>fun();</script>");
        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "pop", "fun();", true);

        //if (profile != "")
        //{
        //    string var = Guid.NewGuid().ToString().Substring(0, 6);
        //    pth = "u_Admin/assets/images/profile-logo/" + var + profile;
        //    profile_choose.PostedFile.SaveAs(Server.MapPath(pth));
        //    profilePic2.ImageUrl = pth;
        //    lblProfile.Text = pth;
        //}
        //if (Logo != "")
        //{
        //    string var = Guid.NewGuid().ToString().Substring(0, 6);
        //    pth = "u_Admin/assets/images/profile-logo/" + var + Logo;
        //    logo_choose.PostedFile.SaveAs(Server.MapPath(pth));
        //    logopic.ImageUrl = pth;
        //    lblProfile.Text = pth;
        //}


        //string fun = "done('"+ JSON.Serialize(record) + "');";
        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "pop", fun, true);

        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "pop", "fun()", true);


    }
    protected void drpState_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        databind_drpCity();
    }

    [WebMethod]
    public static string checkaccount(string email)
    {
        string found = "false";
        try
        {
            conn obj = new conn();
            int match = obj.match("select count(*) from tbAdmin where email = '"+email+"'");
            if (match != 0)
            {
                found = "true";
            }
        }
        catch (Exception e)
        {

        }
        return found;
    }


    [WebMethod]
    public static string checkusername(string username)
    {
        string found = "false";
        try
        {
            conn obj = new conn();
            int match = obj.match("select count(*) from tbAdmin where username = '" + username + "'");
            if (match != 0)
            {
                found = "true";
            }
        }
        catch (Exception e)
        {

        }
        return found;
    }

    [WebMethod]
    public static string sendotp(adminInfo record)
    {
        string otp = Guid.NewGuid().ToString().Substring(0, 6);
        try
        {
            conn obj = new conn();
            int match = obj.match("select count(*) from tbAdminVerified where email = '" + record.email + "'");
            if (match != 0)//found -- update the existing record
            {
                obj.query("update tbAdminVerified set name = '"+record.name+ "',phone = '" + record.phone + "',title = '" + record.title + "',otp='"+otp+"' where email = '"+record.email+"'");
            }
            else// inserting new record
            {
                obj.query("insert into tbAdminVerified values ('"+record.name+ "','" + record.phone + "','" + record.email + "','" + record.title + "','" + otp + "','0','0')");
            }
        }
        catch(Exception e)
        {

        }


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

            string MailText = "Hi " + record.name + ", welcome to our platform,  your one time password is " + otp;
            mail.To.Add(record.email.Trim());

            //Set the email subject
            mail.Subject = ("Verification of Email");

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
        
        return "done";
    }


    [WebMethod]
    public static string checkotp(string otp,string email)
    {
        string same = "false";
        try
        {
            conn obj = new conn();
            int match = obj.match("select count(*) from tbAdminVerified where email = '" + email + "' and otp = '"+otp+"'");
            if (match != 0)
            {
                same = "true";
            }
        }
        catch (Exception e)
        {

        }
        return same;
    }
}