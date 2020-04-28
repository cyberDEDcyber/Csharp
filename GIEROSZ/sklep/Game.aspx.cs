using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklep
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        public String status;
        public Double cena;
        public bool isOrder;
        public int howMuch;

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

        public MySqlConnection connMain;

        protected void Page_Load(object sender, EventArgs e)
        {
            connMain = connect();

            if (Application.Get("logged").ToString() == "none")
            {
                hpLogin.Text = "Logowanie";
                hpLogin.NavigateUrl = "~/LoginForm.aspx";
                hpRegister.Text = "Rejestracja";
                hpRegister.NavigateUrl = "~/RegisterForm.aspx";
                lbGameOrder.Text = "Musisz być zalogowany, żeby zamówić gre";
                btToShoppingCard.Visible = false;
            }
            else
            {
                if (Convert.ToBoolean(Application.Get("IsAdmin")))
                {
                    hpLogin.Text = Application.Get("logged").ToString();
                    hpLogin.NavigateUrl = "~/AdminForm.aspx";
                    hpRegister.Text = "Wyloguj";
                    hpRegister.NavigateUrl = "~/LogOut.aspx";
                    lbGameOrder.Text = "Z konta administratora nie możesz zamawiać";
                    btToShoppingCard.Visible = false;
                }
                else
                {
                    hpLogin.Text = Application.Get("logged").ToString();
                    hpLogin.NavigateUrl = "~/UserForm.aspx";
                    hpRegister.Text = "Wyloguj";
                    hpRegister.NavigateUrl = "~/LogOut.aspx";
                    try
                    {
                        MySqlCommand command1 = connMain.CreateCommand();
                        command1.CommandText = "SELECT dostepnosc FROM produkty WHERE nazwa = '" + Application.Get("game") + "'";
                        status = "dostepny";
                        MySqlDataReader reader1 = command1.ExecuteReader();
                        while (reader1.Read())
                        {
                            if (reader1["dostepnosc"].ToString() == "brak")
                            {
                                status = "brak";
                            }
                        }
                        reader1.Close();
                        if (status == "dostepny")
                        {
                            lbGameOrder.Text = "Produkt: Dostępny";
                            btToShoppingCard.Visible = true;
                        }
                        else
                        {
                            lbGameOrder.Text = "Produkt: Niedostępny";
                            btToShoppingCard.Visible = false;
                        }
                    }
                    catch
                    {
                        Response.Redirect("~/Game.aspx");
                    }
                }
            }

            Store.SelectCommand = "SELECT id_produktu, nazwa, kategoria, obraz, cena, opis, dostepnosc FROM produkty WHERE nazwa = '" + Application.Get("game") + "'";
        }

        protected void btToShoppingCard_Click(object sender, EventArgs e)
        {
            MySqlCommand command2 = connMain.CreateCommand();
            command2.CommandText = "SELECT nazwa_prod, ilosc FROM koszyk WHERE nazwa_prod = '" + Application.Get("game") + "'";
            isOrder = false;
            MySqlDataReader reader2 = command2.ExecuteReader();
            while (reader2.Read())
            {
                if (reader2["nazwa_prod"].ToString().Length > 0)
                {
                    isOrder = true;
                    howMuch = Convert.ToInt32(reader2["ilosc"]);
                }
            }
            reader2.Close();

            if(isOrder == true)
            {
                howMuch = howMuch + 1;

                MySqlCommand command3 = connMain.CreateCommand();
                command3.CommandText = "SELECT cena FROM produkty WHERE nazwa = '" + Application.Get("game") + "'";
                cena = 0;
                MySqlDataReader reader3 = command3.ExecuteReader();
                while (reader3.Read())
                {
                    cena = Convert.ToDouble(reader3["cena"]);
                }
                reader3.Close();

                cena = cena * howMuch;

                MySqlCommand command4 = connMain.CreateCommand();
                command4.CommandText = "UPDATE koszyk SET ilosc = '" + howMuch + "', cena = '" + cena + "' WHERE nazwa_prod = '" + Application.Get("game") + "'";
                command4.ExecuteNonQuery();
            }
            else
            {
                MySqlCommand command5 = connMain.CreateCommand();
                command5.CommandText = "SELECT cena FROM produkty WHERE nazwa = '" + Application.Get("game") + "'";
                cena = 0;
                MySqlDataReader reader5 = command5.ExecuteReader();
                while (reader5.Read())
                {
                    cena = Convert.ToDouble(reader5["cena"]);
                }
                reader5.Close();

                MySqlCommand command6 = connMain.CreateCommand();
                command6.CommandText = "INSERT INTO koszyk(login, nazwa_prod, cena, ilosc) VALUES('" + Application.Get("logged") + "', '" + Application.Get("game") + "'," + cena + "," + 1 + ")";
                command6.ExecuteNonQuery(); 
            }
        }

        protected void ibLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AboutUs.aspx");
        }
    }
}