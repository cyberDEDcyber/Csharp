using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace sklep
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public string sCategory = "";
        MySqlConnection connect()
        {
            string myconnection =
               "Server=localhost;" +
               "Database=xYk3XNoCQ6;" +
               "User=root;" +
               "Password=;";

            MySqlConnection connection = new MySqlConnection(myconnection);

            try
            {

                connection.Open();
                Console.WriteLine("Connected");
                return connection;

            }
            catch
            {
                Console.WriteLine("Error");
                return null;
            }
        }

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
        protected void btSzukaj_Click(object sender, EventArgs e)
        {
            if (cbGatunek.Checked)
            {
                sCategory = ddlCategory.SelectedValue;
                try
                {
                    int price = Convert.ToInt32(iPrice.Text);
                    string name = iName.Text;
                    if (name.Length > 0)
                    {
                        Store.SelectCommand = "SELECT nazwa, kategoria, obraz, cena FROM produkty WHERE kategoria = '" + ddlCategory.SelectedValue + "' and cena <= '" + price + "' and nazwa = '" + name + "'";
                    }
                    else
                    {
                        Store.SelectCommand = "SELECT nazwa, kategoria, obraz, cena FROM produkty WHERE kategoria = '" + ddlCategory.SelectedValue + "' and cena <= '" + price + "' ";
                    }
                }
                catch
                {
                    Store.SelectCommand = "SELECT nazwa, kategoria, obraz, cena FROM produkty WHERE kategoria = '" + ddlCategory.SelectedValue + "' ";
                    string name = iName.Text;
                    if (name.Length > 0)
                    {
                        Store.SelectCommand = "SELECT nazwa, kategoria, obraz, cena FROM produkty WHERE kategoria = '" + ddlCategory.SelectedValue + "' and nazwa = '" + name + "'";
                    }
                    else
                    {
                        Store.SelectCommand = "SELECT nazwa, kategoria, obraz, cena FROM produkty WHERE kategoria = '" + ddlCategory.SelectedValue + "'";
                    }
                }
            }
            else{
                try
                {
                    int price = Convert.ToInt32(iPrice.Text);
                    string name = iName.Text;
                    if (name.Length > 0)
                    {
                        Store.SelectCommand = "SELECT nazwa, kategoria, obraz, cena FROM produkty WHERE cena <= '" + price + "' and nazwa = '" + name + "'";
                    }
                    else
                    {
                        Store.SelectCommand = "SELECT nazwa, kategoria, obraz, cena FROM produkty WHERE cena <= '" + price + "' ";
                    }
                }
                catch
                {
                    string name = iName.Text;
                    if (name.Length > 0)
                    {
                        Store.SelectCommand = "SELECT nazwa, kategoria, obraz, cena FROM produkty WHERE nazwa = '" + name + "'";
                    }
                    else
                    {
                        Store.SelectCommand = "SELECT nazwa, kategoria, obraz, cena FROM produkty WHERE 1";
                    }
                }
            }
        }

        protected void btClear_Click(object sender, EventArgs e)
        {
            Store.SelectCommand = "SELECT nazwa, kategoria, obraz, cena FROM produkty WHERE 1";
            cbGatunek.Checked = false;
            iPrice.Text = "";
            iName.Text = "";
        }

        protected void btEnter_Click(object sender, EventArgs e)
        {
            Application.Set("game", ddlGameSerach.SelectedValue);
            Response.Redirect("~/Game.aspx");
        }

        protected void ibLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AboutUs.aspx");
        }
    }
}