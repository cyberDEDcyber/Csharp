using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;


namespace sklep
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static string Encrypt(string clearText)
        {
            string EncryptionKey = "abc123";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
        public void send()
        {
            SmtpClient client;
            MailMessage message;
            string companyEmail = "GieroszByFialAndGamb@gmail.com";
            try
            {
                message = new MailMessage(companyEmail, tbEmail.Text);
                message.Subject = "Witmay w Gierosz";
                message.Body = "Dziękujemy że jesteś z nami " + tbUsername.Text;
                client = new SmtpClient("smtp.gmail.com", 25);
                client.UseDefaultCredentials = false;
                client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential(companyEmail, "zaq1@WSX");
                client.Send(message);
                lbMessageEmail.Text = "Wysłano mail";
                lbMessageEmail.ForeColor = Color.Green;
            }
            catch (Exception ex)
            {
                lbMessageEmail.Text = "Nie można było wysłać mailu" + ex;
                lbMessageEmail.ForeColor = Color.Red;
            }
        }
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
        public void clear()
        {
            tbFirstName.Text = "";
            tbLastName.Text = "";
            tbPhoneNumber.Text = "";
            tbEmail.Text = "";
            tbUsername.Text = "";
                ddlGender.Items[1].Selected = false;
                ddlGender.Items[2].Selected = false;
                ddlGender.Items[0].Selected = true;
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

        protected void btRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (tbConfirmPassword.Text == tbPassword.Text)
                {
                    lbPasswordCheck.Text = "*";
                    lbConfirmPasswordCheck.Text = "*";
                    MySqlConnection conn = connect();
                    try
                    {
                        if (tbPhoneNumber.Text == "")
                        {
                            try
                            {
                                MySqlCommand command = conn.CreateCommand();
                                command.CommandText = "INSERT INTO userzy (imie,nazwisko,plec,email,login,haslo,typ) VALUES ('" + tbFirstName.Text + "','" + tbLastName.Text + "','" + ddlGender.SelectedValue + "','" + tbEmail.Text + "','" + tbUsername.Text + "','" + Encrypt(tbPassword.Text) + "','user')";
                                command.ExecuteNonQuery();
                                lbMessage.Text = "Utworzono konto";
                                lbMessage.ForeColor = Color.Green;
                                send();
                                clear();
                            }
                            catch (MySql.Data.MySqlClient.MySqlException ex)
                            {
                                string error = Convert.ToString(ex);
                                string klucz = "login";
                                if (error.IndexOf(klucz) == -1)
                                {
                                    lbMessage.Text = "Konto z podanym mailem już istnieje" + ex;
                                    lbMessage.ForeColor = Color.Red;
                                }
                                else
                                {
                                    lbMessage.Text = "Konto z podanym loginem już istnieje";
                                    lbMessage.ForeColor = Color.Red;
                                }

                            }
                        }
                        else
                        {
                            try
                            {
                                int number = Convert.ToInt32(tbPhoneNumber.Text);
                                MySqlCommand command = conn.CreateCommand();
                                command.CommandText = "INSERT INTO userzy (imie,nazwisko,telefon,plec,email,login,haslo,typ) VALUES ('" + tbFirstName.Text + "','" + tbLastName.Text + "','" + number + "','" + ddlGender.SelectedValue + "','" + tbEmail.Text + "','" + tbUsername.Text + "','" + Encrypt(tbPassword.Text) + "','user')";
                                command.ExecuteNonQuery();
                                lbMessage.Text = "Utworzono konto";
                                lbMessage.ForeColor = Color.Green;
                                send();
                                clear();
                            }
                            catch (MySql.Data.MySqlClient.MySqlException ex)
                            {
                                string error = Convert.ToString(ex);
                                string klucz = "login";
                                if (error.IndexOf(klucz) == -1)
                                {
                                    lbMessage.Text = "Konto z podanym mailem już istnieje";
                                    lbMessage.ForeColor = Color.Red;
                                }
                                else
                                {
                                    lbMessage.Text = "Konto z podanym loginem już istnieje";
                                    lbMessage.ForeColor = Color.Red;
                                }

                            }
                        }
                    }
                    catch
                    {
                        lbMessage.Text = "Numer telefonu musi się składać z liczb";
                        lbMessage.ForeColor = Color.Red;
                    }
                }
                else
                {
                    lbPasswordCheck.Text = "*Hasła muszą się zgadzać";
                    lbConfirmPasswordCheck.Text = "*Hasła muszą się zgadzać";
                    lbMessage.Text = "Błąd, nie utworzono konta";
                    lbMessage.ForeColor = Color.Red;
                }
            }
            else
            {
                lbMessage.Text = "Błąd, nie utworzono konta";
                lbMessage.ForeColor = Color.Red;
            }
        }

        protected void ibLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AboutUs.aspx");
        }
    }
}