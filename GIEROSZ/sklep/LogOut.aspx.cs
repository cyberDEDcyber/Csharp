using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklep
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application.Get("logged").ToString() == "none")
            {
                hpLogin.Text = "Logowanie";
                hpLogin.NavigateUrl = "~/LoginForm.aspx";
                hpRegister.Text = "Rejestracja";
                hpRegister.NavigateUrl = "~/RegisterForm.aspx";
            }
            else
            {
                if (Convert.ToBoolean(Application.Get("IsAdmin")))
                {
                    hpLogin.NavigateUrl = "~/AdminForm.aspx";
                }
                else
                {
                    hpLogin.NavigateUrl = "~/UserForm.aspx";
                }
                hpLogin.Text = Application.Get("logged").ToString();
                hpRegister.Text = "Wyloguj";
                hpRegister.NavigateUrl = "~/LogOut.aspx";
            }
        }

        protected void btLogOut_Click(object sender, EventArgs e)
        {
            Application.Set("logged", "none");
            Response.Redirect("~/Store.aspx");
        }

        protected void ibLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AboutUs.aspx");
        }
    }
}