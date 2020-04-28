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
    public partial class WebForm8 : System.Web.UI.Page
    {

        public int userID;
        public String availabilityProduct;

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

        public void clear()
        {
            tbName.Text = "";
            tbLastName.Text = "";
            tbPhone.Text = "";
            tbEmail.Text = "";
            ddlGender.Items[1].Selected = false;
            ddlGender.Items[2].Selected = false;
            ddlGender.Items[0].Selected = true;
            lbNumber.Text = "";
        }
        public void send()
        {
            SmtpClient client;
            MailMessage message;
            string companyEmail = "GieroszByFialAndGamb@gmail.com";
            try
            {
                message = new MailMessage(companyEmail, tbEmail.Text);
                message.Subject = "Zmiana adresu email w Gierosz";
                message.Body = "Od teraz to jest email podpięty do twojego konta, " + Application.Get("logged");
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

        public void check()
        {
            MySqlConnection conn = connect();

            if (tbName.Text == "")
            {

            }
            else
            {
                MySqlCommand command = conn.CreateCommand();
                command.CommandText = "UPDATE `userzy` SET  imie = '" + tbName.Text + "' WHERE login = '" + Application.Get("logged") + "'";
                command.ExecuteNonQuery();
            }
            if (tbLastName.Text == "")
            {

            }
            else
            {
                MySqlCommand command = conn.CreateCommand();
                command.CommandText = "UPDATE `userzy` SET  nazwisko = '" + tbLastName.Text + "' WHERE login = '" + Application.Get("logged") + "'";
                command.ExecuteNonQuery();
            }
            if (ddlGender.SelectedValue == "")
            {

            }
            else
            {
                MySqlCommand command = conn.CreateCommand();
                command.CommandText = "UPDATE `userzy` SET  plec = '" + ddlGender.SelectedValue + "' WHERE login = '" + Application.Get("logged") + "'";
                command.ExecuteNonQuery();
            }
            if (tbPassword.Text == "")
            {

            }
            else
            {
                MySqlCommand command = conn.CreateCommand();
                command.CommandText = "UPDATE `userzy` SET  haslo = '" + tbPassword.Text + "' WHERE login = '" + Application.Get("logged") + "'";
                command.ExecuteNonQuery();
            }
            if (tbEmail.Text == "")
            {

            }
            else
            {
                MySqlCommand command = conn.CreateCommand();
                command.CommandText = "UPDATE `userzy` SET  email = '" + tbEmail.Text + "' WHERE login = '" + Application.Get("logged") + "'";
                command.ExecuteNonQuery();
                send();
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
            }
            else
            {
                hpLogin.Text = Application.Get("logged").ToString();
                hpLogin.NavigateUrl = "~/UserForm.aspx";
                hpRegister.Text = "Wyloguj";
                hpRegister.NavigateUrl = "~/LogOut.aspx";
            }

            User.SelectCommand = "SELECT * FROM userzy WHERE login = '" + Application.Get("logged").ToString() + "'";

            MySqlCommand command1 = connMain.CreateCommand();
            command1.CommandText = "SELECT id FROM userzy WHERE login = '" + Application.Get("logged") + "'";
            MySqlDataReader reader1 = command1.ExecuteReader();
            while (reader1.Read())
            {
                userID = Convert.ToInt32(reader1["id"]);
            }
            reader1.Close();
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = connect();
            MySqlCommand command = conn.CreateCommand();
            command.CommandText = "DELETE FROM `userzy` WHERE login = '" + Application.Get("logged") + "'";
            command.ExecuteNonQuery();
            Application.Set("logged", "none");
            Response.Redirect("~/Store.aspx");
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (tbPhone.Text == "")
                {
                    check();
                    Response.Redirect("~/UserForm.aspx");
                    clear();
                }
                else
                {
                    try
                    {
                        MySqlConnection conn = connect();
                        int number = Convert.ToInt32(tbPhone.Text);
                        MySqlCommand command = conn.CreateCommand();
                        command.CommandText = "UPDATE `userzy` SET  telefon = '" + number + "' WHERE login = '" + Application.Get("logged") + "'";
                        command.ExecuteNonQuery();
                        check();
                        Response.Redirect("~/UserForm.aspx");
                        clear();
                    }
                    catch
                    {
                        lbNumber.Text = "Zły numer";
                        lbCommand.Text = "Niewypełniono poprawnie formularza";
                        lbCommand.ForeColor = Color.Red;
                    }
                }
            }
            else
            {
                lbCommand.Text = "Niewypełniono poprawnie formularza";
                lbCommand.ForeColor = Color.Red;
            }
        }

        protected void btDeleteUserBase_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = connect();
            MySqlCommand command = conn.CreateCommand();
            command.CommandText = "DELETE FROM `userzy` WHERE login = '" + ddlUserBase.SelectedValue + "'";
            command.ExecuteNonQuery();
            Response.Redirect("~/AdminForm.aspx");
        }

        protected void btDeleteProductsBase_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = connect();
            MySqlCommand command = conn.CreateCommand();
            command.CommandText = "DELETE FROM produkty WHERE nazwa = '" + ddlProducts.SelectedValue + "'";
            command.ExecuteNonQuery();
            Response.Redirect("~/AdminForm.aspx");
        }

        protected void btDeleteOrders_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = connect();
            MySqlCommand command = conn.CreateCommand();
            command.CommandText = "DELETE FROM zamowienia WHERE id_zamow = '" + ddlOrders.SelectedValue + "'";
            command.ExecuteNonQuery();
            Response.Redirect("~/AdminForm.aspx");
        }

        protected void btChangeValueProducts_Click(object sender, EventArgs e)
        {
            MySqlCommand command2 = connMain.CreateCommand();
            command2.CommandText = "SELECT dostepnosc FROM produkty WHERE nazwa = '" + ddlProducts.SelectedValue + "'";
            MySqlDataReader reader2 = command2.ExecuteReader();
            while (reader2.Read())
            {
                availabilityProduct = (reader2["dostepnosc"]).ToString();
            }
            reader2.Close();

            MySqlConnection conn = connect();
            MySqlCommand command = conn.CreateCommand();
            if (availabilityProduct == "brak")  
            {
                command.CommandText = "UPDATE `produkty` SET  dostepnosc = 'dostępny' WHERE nazwa = '" + ddlProducts.SelectedValue + "'"; 
            }
            else
            {
                command.CommandText = "UPDATE `produkty` SET  dostepnosc = 'brak' WHERE nazwa = '" + ddlProducts.SelectedValue + "'";
            }
            command.ExecuteNonQuery();
            Response.Redirect("~/AdminForm.aspx");
        }

        protected void btChangeStatus_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = connect();
            MySqlCommand command = conn.CreateCommand();
            command.CommandText = "UPDATE `zamowienia` SET  status = '" + ddlStatus.SelectedValue + "' WHERE id_zamow = '" + ddlOrders.SelectedValue + "'";
            command.ExecuteNonQuery();
            Response.Redirect("~/AdminForm.aspx");
        }

        protected void ibLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AboutUs.aspx");
        }
    }
}