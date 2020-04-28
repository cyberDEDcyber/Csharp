using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklep
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        public Double cenaRazem;
        public Double cenaZamow;
        public Double cena;
        public int howMuch;
        public int userID;
        public String games;
        public String userEmail;
        public int idOrder;

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

        public void send()
        {
            SmtpClient client;
            MailMessage message;
            string companyEmail = "GieroszByFialAndGamb@gmail.com";

            MySqlCommand commandS1 = connMain.CreateCommand();
            commandS1.CommandText = "SELECT email FROM userzy WHERE login = '" + Application.Get("logged") + "'";
            MySqlDataReader readerS1 = commandS1.ExecuteReader();
            while (readerS1.Read())
            {
                userEmail = (readerS1["email"].ToString());
            }
            readerS1.Close();

            MySqlCommand commandS2 = connMain.CreateCommand();
            commandS2.CommandText = "SELECT max(id_zamow) FROM zamowienia WHERE id_usera = '" + userID + "'";
            MySqlDataReader readerS2 = commandS2.ExecuteReader();
            while (readerS2.Read())
            {
                idOrder = Convert.ToInt32(readerS2["max(id_zamow)"]);
            }
            readerS2.Close();

            try
            {
                message = new MailMessage(companyEmail, userEmail);
                message.Subject = "Witmay w Gierosz";
                message.Body = "Dziękujemy za skorzystanie z naszego sklepu " + Application.Get("logged") +".Zamówienie numer: " + idOrder + ".Status zamówienia może sprawdzać na swoim koncie na Gierosz";
                client = new SmtpClient("smtp.gmail.com", 25);
                client.UseDefaultCredentials = false;
                client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential(companyEmail, "zaq1@WSX");
                client.Send(message);
            }
            catch (Exception ex)
            {
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            connMain = connect();

            if (Application.Get("logged").ToString() == "none")
            {
                hpLogin.Text = "Logowanie";
                hpLogin.NavigateUrl = "~/LoginForm.aspx";
                hpRegister.Text = "Rejestracja";
                hpRegister.NavigateUrl = "~/RegisterForm.aspx";
                lbShoppingCard.Text = "Musisz być zalogowany, żeby móc zamawiać";
                ddlGame.Visible = false;
                btDelete.Visible = false;
                btAdd.Visible = false;
                btOrder.Visible = false;
                lvStore.Visible = false;
            }
            else
            {
                if (Convert.ToBoolean(Application.Get("IsAdmin")))
                {
                    hpLogin.NavigateUrl = "~/AdminForm.aspx";
                    lbShoppingCard.Text = "Admin nie ma koszyka";
                    lbPriceTogether.Text = "Koszyk jest pusty";
                    ddlGame.Visible = false;
                    btDelete.Visible = false;
                    btAdd.Visible = false;
                    btOrder.Visible = false;
                    lvStore.Visible = false;
                    lbOrderPrice.Text = "20";
                }
                else
                {
                    hpLogin.NavigateUrl = "~/UserForm.aspx";
                    lbShoppingCard.Text = "Koszyk użytkownika: " + Application.Get("logged");
                    ShoppingCard.SelectCommand = "SELECT * FROM koszyk WHERE login = '" + Application.Get("logged") + "'";
                    lvStore.Visible = true;
                    try
                    {
                        MySqlCommand command1 = connMain.CreateCommand();
                        command1.CommandText = "SELECT SUM(cena) as suma FROM koszyk WHERE login = '" + Application.Get("logged") + "'";
                        cenaRazem = 0;
                        MySqlDataReader reader1 = command1.ExecuteReader();
                        while (reader1.Read())
                        {
                            cenaRazem = Convert.ToDouble(reader1["suma"]);
                        }
                        reader1.Close();
                        lbPriceTogether.Text = cenaRazem.ToString();
                        ddlGame.Visible = true;
                        btDelete.Visible = true;
                        btAdd.Visible = true;
                        btOrder.Visible = true;

                        cenaZamow = cenaRazem + 20;
                        lbOrderPrice.Text = cenaZamow.ToString();
                    }
                    catch
                    {
                        lbPriceTogether.Text = "Koszyk jest pusty";
                        ddlGame.Visible = false;
                        btDelete.Visible = false;
                        btAdd.Visible = false;
                        btOrder.Visible = false;
                        lbOrderPrice.Text = "20";
                    }
                }
                hpLogin.Text = Application.Get("logged").ToString();
                hpRegister.Text = "Wyloguj";
                hpRegister.NavigateUrl = "~/LogOut.aspx";
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            MySqlCommand command2 = connMain.CreateCommand();
            command2.CommandText = "SELECT ilosc FROM koszyk WHERE nazwa_prod = '" + ddlGame.SelectedValue + "'";
            MySqlDataReader reader2 = command2.ExecuteReader();
            while (reader2.Read())
            {
                howMuch = Convert.ToInt32(reader2["ilosc"]);
            }
            reader2.Close();

            if(howMuch > 1)
            {
                howMuch = howMuch - 1;

                MySqlCommand command3 = connMain.CreateCommand();
                command3.CommandText = "SELECT cena FROM produkty WHERE nazwa = '" + ddlGame.SelectedValue + "'";
                MySqlDataReader reader3 = command3.ExecuteReader();
                while (reader3.Read())
                {
                    cena = Convert.ToDouble(reader3["cena"]);
                }
                reader3.Close();

                cena = cena * howMuch;

                MySqlCommand command4 = connMain.CreateCommand();
                command4.CommandText = "UPDATE koszyk SET ilosc = '" + howMuch + "', cena = '" + cena + "' WHERE nazwa_prod = '" + ddlGame.SelectedValue + "'"; ;
                command4.ExecuteNonQuery();
            }
            else
            {
                MySqlCommand command5 = connMain.CreateCommand();
                command5.CommandText = "DELETE FROM koszyk WHERE nazwa_prod = '" + ddlGame.SelectedValue + "'";
                command5.ExecuteNonQuery();
            }
            Response.Redirect("~/ShoppingCard.aspx");
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            MySqlCommand command12 = connMain.CreateCommand();
            command12.CommandText = "SELECT ilosc FROM koszyk WHERE nazwa_prod = '" + ddlGame.SelectedValue + "'";
            MySqlDataReader reader12 = command12.ExecuteReader();
            while (reader12.Read())
            {
               howMuch = Convert.ToInt32(reader12["ilosc"]);
            }
            reader12.Close();

            howMuch = howMuch + 1;

            MySqlCommand command10 = connMain.CreateCommand();
            command10.CommandText = "SELECT cena FROM produkty WHERE nazwa = '" + ddlGame.SelectedValue + "'";
            MySqlDataReader reader10 = command10.ExecuteReader();
            while (reader10.Read())
            {
               cena = Convert.ToDouble(reader10["cena"]);
            }
                reader10.Close();

            cena = cena * howMuch;

            MySqlCommand command11 = connMain.CreateCommand();
            command11.CommandText = "UPDATE koszyk SET ilosc = '" + howMuch + "', cena = '" + cena + "' WHERE nazwa_prod = '" + ddlGame.SelectedValue + "'"; ;
            command11.ExecuteNonQuery();
            Response.Redirect("~/ShoppingCard.aspx");
        }

        protected void btOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                MySqlCommand command6 = connMain.CreateCommand();
                command6.CommandText = "SELECT id FROM userzy WHERE login = '" + Application.Get("logged") + "'";
                MySqlDataReader reader6 = command6.ExecuteReader();
                while (reader6.Read())
                {
                    userID = Convert.ToInt32(reader6["id"]);
                }
                reader6.Close();

                games = "";
                MySqlCommand command7 = connMain.CreateCommand();
                command7.CommandText = "SELECT nazwa_prod, ilosc FROM koszyk WHERE login = '" + Application.Get("logged") + "'";
                MySqlDataReader reader7 = command7.ExecuteReader();
                while (reader7.Read())
                {
                    games = games + " " + (reader7["ilosc"]).ToString() + "x" + (reader7["nazwa_prod"]).ToString();
                }
                reader7.Close();

                MySqlCommand command8 = connMain.CreateCommand();
                command8.CommandText = "INSERT INTO zamowienia(id_usera, nazwy_prod, cena, status, metoda_dost, metoda_plat, adres, miasto, kod) VALUES ('" + userID + "','" + games + "','" + cenaZamow + "','przygotowanie','" + ddlCurier.SelectedValue + "','" + ddlPayment.SelectedValue + "','" + tbAdress.Text + "','" + tbCity.Text + "','" + tbCode.Text + "')";
                command8.ExecuteNonQuery();

                MySqlCommand command9 = connMain.CreateCommand();
                command9.CommandText = "DELETE FROM koszyk WHERE login = '" + Application.Get("logged") + "'";
                command9.ExecuteNonQuery();

                lbOrder.Text = "Złożono zamówienie, można zobaczyć status zamówienia na stronie użytkownika lub w mailu";
                lbOrder.ForeColor = Color.Green;
                send();
                Response.Redirect("~/UserForm.aspx");
            }
            else
            {
                lbOrder.Text = "Musisz wypełnić formularz";
                lbOrder.ForeColor = Color.Red;
            }
        }

        protected void ddlCurier_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlCurier.SelectedValue == "DHL")
            {
                cenaZamow = cenaRazem + 20;
            }
            if (ddlCurier.SelectedValue == "Poczta polska")
            {
                cenaZamow = cenaRazem + 10;
            }
            if (ddlCurier.SelectedValue == "DPD")
            {
                cenaZamow = cenaRazem + 18;
            }
            if (ddlCurier.SelectedValue == "Paczkomaty")
            {
                cenaZamow = cenaRazem + 15;
            }
            if (ddlCurier.SelectedValue == "Paczkomaty kurier")
            {
                cenaZamow = cenaRazem + 21;
            }

            lbOrderPrice.Text = cenaZamow.ToString();
        }

        protected void ibLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AboutUs.aspx");
        }
    }
}