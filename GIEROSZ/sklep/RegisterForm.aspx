<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="sklep.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Rejestracja</title>
    <style type="text/css">
        body{
            background: #802F21;
            width: 100%;
            text-align: center;
            overflow-x: hidden;
        }
        .tForm {
            margin: 20px 40%;
            width: 62%;
            text-align: start;
        }
        .menu{
            display: flex;
            width: 100%;
            height: 120px;
            margin-bottom: 20px;
            background: #EEEEEE;
            justify-content: space-around;
            align-items: center;
            border-bottom: 5px solid #D72324;
        }
        .menuButton{
            margin: 10px;
            padding: 5px;
            font-size: 30px;
            text-decoration: none;
            color: #D72324;
            border-left: 2px solid black;
            border-right: 2px solid black;
        }
        .menuImage{
            Height: 120px; 
            Width: 120px;
        }
        .menuPom{
            display:flex;
            justify-content:space-around;
            width: 30%;
        }
        .text{
            color: white;
            margin: 10px auto;
        }
        .tdLabel{
            width: 141px;
            background: #bf360c;
            color: white;
        }
        tdTextBox{
            width: 141px;
        }
        footer{
            width: 100%;
            position: absolute;
            bottom: 0;
            clear:both;
            color: white;
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="menu">
            <div class="menuPom">
                <asp:HyperLink class="menuButton" ID="hpStore" runat="server" NavigateUrl="~/Store.aspx">Sklep</asp:HyperLink>
                <asp:HyperLink class="menuButton" ID="hpOrder" runat="server" NavigateUrl="~/ShoppingCard.aspx">Koszyk</asp:HyperLink>
            </div>
            <asp:ImageButton class="menuImage" ID="ibLogo" runat="server" ImageUrl="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/400726c9-eb5c-4046-8d40-68d90e2e256a/ddkcwu7-75710788-9c0e-44d1-8f55-496c4e7e99be.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzQwMDcyNmM5LWViNWMtNDA0Ni04ZDQwLTY4ZDkwZTJlMjU2YVwvZGRrY3d1Ny03NTcxMDc4OC05YzBlLTQ0ZDEtOGY1NS00OTZjNGU3ZTk5YmUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.YtNMpZUJAXrgRKGn89g0seAzmkdifh5ff6qGfRK3Nx8&amp;fbclid=IwAR23BSYL0PqzZK-75V65N1QJE2eb1JwyGr6tht9nJS6JvK2c9sB6xiJhaLY" OnClick="ibLogo_Click"/>
            <div class="menuPom">
                <asp:HyperLink class="menuButton" ID="hpLogin" runat="server" NavigateUrl="~/LoginForm.aspx">Logowanie</asp:HyperLink>
                <asp:HyperLink class="menuButton" ID="hpRegister" runat="server" NavigateUrl="~/RegisterForm.aspx">Rejestracja</asp:HyperLink>
            </div>
        </div>
        <h1 class="text">Rejestracja</h1>
        <span class="text">Prosze wypełnić arkusz:</span>
        <table class="tForm">
           <tr>
                <td class="tdLabel">
                    <asp:Label ID="lbFirstName" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="tbTextBox">
                    <asp:TextBox ID="tbFirstName" runat="server" Width="150px"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="tbFirstName" ErrorMessage="Pole Name jest wymagane" ForeColor="Red">Pole FirstName jest wymagane</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">
                    <asp:Label ID="lbLastName0" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="tbTextBox">
                    <asp:TextBox ID="tbLastName" runat="server" Width="150px"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="tbLastName" ErrorMessage="Pole LastName jest wymagane" ForeColor="Red">Pole LastName jest wymagane</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">
                    <asp:Label ID="lbPhoneNumber" runat="server" Text="Contact"></asp:Label>
                </td>
                <td class="tbTextBox">
                    <asp:TextBox ID="tbPhoneNumber" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">
                    <asp:Label ID="lbGender" runat="server" Text="Gender"></asp:Label>
                </td>
                <td class="tbTextBox">
                    <asp:DropDownList ID="ddlGender" runat="server" Width="154px" style="margin-bottom: 0px" Height="25px" AutoPostBack="True">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Helikopter bojowy radzieckiej produkcji</asp:ListItem>
                        <asp:ListItem>Helikopter bojowy amerykańskiej produkcji</asp:ListItem>
            </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">
                    <asp:Label ID="lbEmail" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="tbTextBox">
                    <asp:TextBox ID="tbEmail" runat="server" Width="150px"></asp:TextBox>
                    <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Pole Email jest wymagane" ForeColor="Red">Pole Email jest wymagane</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Zły format Email</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">
                    <asp:Label ID="lbUsername" runat="server" Text="Username"></asp:Label>
                </td>
                <td class="tbTextBox">
                    <asp:TextBox ID="tbUsername" runat="server" Width="150px"></asp:TextBox>
                    <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="tbUsername" ErrorMessage="Pole Username jest wymagane" ForeColor="Red">Pole Username jest wymagane</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">
                    <asp:Label ID="lbPassword" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="tbTextBox">
                    <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                    <asp:Label ID="lbPasswordCheck" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Pole Password jest wymagane" ForeColor="Red">Pole Password jest wymagane</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">
                    <asp:Label ID="lbConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td class="tbTextBox">
                    <asp:TextBox ID="tbConfirmPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                    <asp:Label ID="lbConfirmPasswordCheck" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="tbConfirmPassword" ErrorMessage="Pole Confirm Password jest wymagane" ForeColor="Red">Pole Confirm Password jest wymagane</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="tbTextBox">
                    <asp:Button ID="btRegister" runat="server" Text="Register" OnClick="btRegister_Click" Width="108px" BackColor="#F9683A" ForeColor="White"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbMessageEmail" runat="server"></asp:Label>
                </td>
                <td class="tbTextBox">
                    <asp:Label ID="lbMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
    <footer>Copyrights by Fial and Gambosz</footer>
 </body>
</html>
