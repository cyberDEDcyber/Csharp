using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace sklep
{
    public partial class WebForm3 : System.Web.UI.Page
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

        public String status;
        public String user;
        public String type;
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

        public object MessageBox { get; private set; }

        public void clear()
        {
            tbUsername.Text = "";
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
        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MySqlCommand command = connMain.CreateCommand();
                command.CommandText = "SELECT login, haslo FROM userzy";
                status = "brak";
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    if (tbUsername.Text == reader["login"].ToString())
                    {
                        status = "login";
                        Debug.WriteLine(Encrypt(tbPassword.Text));
                        if (Encrypt(tbPassword.Text) == reader["haslo"].ToString())
                        {
                            status = "zalogowano";
                            user = reader["login"].ToString();
                        }
                    }
                }
                reader.Close();
                if (status == "login")
                {
                    lbMessage.Text = "Podano złe hasło";
                    lbMessage.ForeColor = Color.Red;
                }
                else if (status == "zalogowano")
                {
                    Application.Set("logged", user);
                    lbMessage.Text = "Zalogowano";
                    lbMessage.ForeColor = Color.Green;
                    MySqlCommand command1 = connMain.CreateCommand();
                    command1.CommandText = "SELECT typ FROM userzy WHERE login = '" + Application.Get("logged") + "'";
                    MySqlDataReader reader1 = command1.ExecuteReader();
                    while (reader1.Read())
                    {
                        type = reader1["typ"].ToString();
                    }
                    reader1.Close();

                    if (type == "admin")
                    {
                        Application.Set("IsAdmin", true);
                    }
                    else
                    {
                        Application.Set("IsAdmin", false);
                    }
                    clear();
                    Response.Redirect("~/Store.aspx");
                }
                else
                {
                    lbMessage.Text = "Podany użytkownik nie jest w bazie";
                    lbMessage.ForeColor = Color.Red;
                    clear();
                }
            }
            else
            {
                lbMessage.Text = "Uzupełnij prawidłowo formularz";
                lbMessage.ForeColor = Color.Red;
            }
        }

        protected void ibLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/AboutUs.aspx");
        }
    }
}