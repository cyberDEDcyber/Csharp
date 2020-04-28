<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCard.aspx.cs" Inherits="sklep.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Koszyk</title>
    <style>
        body{
            background: #802F21;
            width: 100%;
            text-align: center;
            overflow-x: hidden;
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
            margin-top: 10px;
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
        footer{
            width: 100%;
            clear:both;
            color: white;
            text-align: center;
        }
        .tMain{
            width: 100%;
            border-top: 3px solid #D72324;
            background: #EEEEEE;
        }
        .tPrice{
            width: 100%;
            border-bottom: 3px solid #D72324;
            background: #EEEEEE;
        }
        .trFirst{
            background: #D72324;
            border-bottom: 3px solid white;
        }
        .tdFirst{
            font-size: 25px;
            color: white;
            height: 50px;
        }
        .tdOther{
            font-size: 25px;
            height: 40px;
        }
        .divEmpty{
            width: 100%;
            background: #D72324;
            border-top: 3px solid white;
            display:flex;
            justify-content: center;
            align-items: center;
            height: 100px;
            color: white;
            font-size: 30px;
        }
        .shopping{
            color: white;
            margin: 10px auto;
        }
        .lvStore{
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .ddlShopping{
            background: #D72324;
            color: white;
            height: 40px;
            width: 180px;
        }
        .tMain2{
            margin: 0 auto;
            width: 60%;
            color: white;
        }
        .tdTitle{
            background: #EEEEEE;
            color: black;
            width: 30%;
        }
        .tdData{
            width: 36%;
            background: #bf360c;
            color: white;
            text-align: left;
        }
        .tbForm{
            background: #bf360c;
            color: white;
            text-align: left;
            border: none;
        }
        h3{
            color: white;
        }
        .ddlOrder{
            width: 300px;
            height: 50px;
            background: #EEEEEE;
            color: black;
            font-size: 20px;
            margin-bottom: 10px;
        }
        .tOrderPrice{
            margin: 10px auto;
            width: 50%;
            border-bottom: 3px solid #D72324;
            background: #EEEEEE;
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
        <asp:AdRotator ID="AdRotator1" class="baner" runat="server" Width="800" Height="200" AdvertisementFile="~/Advert2.xml"/>
        <h2 class="shopping"><asp:Label ID="lbShoppingCard" runat="server" ForeColor="White" Text="Label"></asp:Label></h2>
        <div class="lvStore">
            <asp:ListView ID="lvStore" runat="server" DataSourceID="ShoppingCard">
                <EmptyDataTemplate>
                    <div class="divEmpty">W koszyku nic nie ma</div>
                </EmptyDataTemplate>
                <LayoutTemplate>
                     <table class="tMain" id="itemPlaceholderContainer" runat="server">
                         <tr class="trFirst">
                            <td class="tdFirst">Konto</td>
                            <td class="tdFirst">Nazwa Produktu</td>
                            <td class="tdFirst">Cena</td>
                            <td class="tdFirst">Ilość</td>
                         </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                     </table>
                </LayoutTemplate>
                <AlternatingItemTemplate>
                    <tr>
                        <td class="tdOther">
                            <span><%# Eval("login") %></span>   
                        </td>
                        <td class="tdOther">
                            <span><%# Eval("nazwa_prod") %></span>   
                        </td>
                        <td class="tdOther">
                           <span><%# Eval("cena") %></span>
                        </td>
                        <td class="tdOther">
                           <span><%# Eval("ilosc") %></span>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="tdOther">
                            <span><%# Eval("login") %></span>   
                        </td>
                        <td class="tdOther">
                            <span><%# Eval("nazwa_prod") %></span>   
                        </td>
                        <td class="tdOther">
                           <span><%# Eval("cena") %></span>
                        </td>
                        <td class="tdOther">
                           <span><%# Eval("ilosc") %></span>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <table class="tPrice">
                <tr class="trFirst">
                   <td colspan="3" class="tdFirst">Cena razem:</td>
                    <td class="tdFirst"><asp:Label ID="lbPriceTogether" runat="server" ForeColor="White" Text=""></asp:Label></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="ShoppingCard" runat="server" ConnectionString="<%$ ConnectionStrings:xyk3xnocq6ConnectionString %>" ProviderName="<%$ ConnectionStrings:xyk3xnocq6ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM koszyk"></asp:SqlDataSource>
        </div>
        <h2 class="shopping">Usuwanie z koszyka:</h2>
        <asp:DropDownList ID="ddlGame" runat="server" DataSourceID="ShoppingCard" DataTextField="nazwa_prod" DataValueField="nazwa_prod" class="ddlShopping">
        </asp:DropDownList>
        <asp:Button ID="btDelete" runat="server" OnClick="btDelete_Click" Text="Delete" Width="180px" Height="40px" BackColor="#F9683A" ForeColor="White"/>
        <asp:Button ID="btAdd" runat="server" OnClick="btAdd_Click" Text="Add" class="btDelete" Width="180px" Height="40px" BackColor="#F9683A" ForeColor="White" ValidateRequestMode="Disabled"/>
        <h2 class="shopping">Wypełnij dane do zamówienia:</h2>

        <br />
        <table class="tMain2">
            <tr>
                <td class="tdTitle">
                    <asp:Label ID="Label1" runat="server" Text="Adres zamieszkania:"></asp:Label>
                </td>
                <td class="tdData">
                    <asp:TextBox ID="tbAdress" runat="server" Width="333px" class="tbForm"></asp:TextBox>
                </td>
                <td class="tdTitle">
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="tbAdress" ErrorMessage="Pole adres jest wymagane" ForeColor="Red">*Pole adres jest wymagane</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdTitle">
                    <asp:Label ID="lbCity" runat="server" Text="Miasto:"></asp:Label>
                </td>
                <td class="tdData">
                    <asp:TextBox ID="tbCity" runat="server" Width="332px" class="tbForm"></asp:TextBox>
                </td>
                <td class="tdTitle">
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="tbCity" ErrorMessage="Pole miasto jest wymagane" ForeColor="Red">*Pole miasto jest wymagane</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdTitle">
                    <asp:Label ID="Label3" runat="server" Text="Kod pocztowy"></asp:Label>
                </td>
                <td class="tdData">
                    <asp:TextBox ID="tbCode" runat="server" Width="331px" class="tbForm"></asp:TextBox>
                </td>
                <td class="tdTitle">
                    <asp:RequiredFieldValidator ID="rfvCode" runat="server" ControlToValidate="tbCode" ErrorMessage="Pole kod jest wymagane" ForeColor="Red">*Pole kod jest wymagane</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbCode" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="(D-)?\d{5}">Zły format</asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <h3>Sposób płatności:</h3>
        <asp:DropDownList class="ddlOrder" ID="ddlPayment" runat="server">
            <asp:ListItem>Przelew</asp:ListItem>
            <asp:ListItem>Przy odbiorze</asp:ListItem>
            <asp:ListItem>Blik</asp:ListItem>
        </asp:DropDownList>
        <h3>Sposób dostawy:</h3>
        <asp:DropDownList class="ddlOrder" ID="ddlCurier" runat="server" OnSelectedIndexChanged="ddlCurier_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem Value="DHL">DHL(20zł)</asp:ListItem>
            <asp:ListItem Value="Poczta polska">Poczta polska(10zł)</asp:ListItem>
            <asp:ListItem Value="DPD">DPD(18zł)</asp:ListItem>
            <asp:ListItem Value="Paczkomaty">Paczkomaty(15zł)</asp:ListItem>
            <asp:ListItem Value="Paczkomaty kurier">Paczkomaty kurier(21zł)</asp:ListItem>
        </asp:DropDownList>
        <br />
        <table class="tOrderPrice">
           <tr class="trFirst">
              <td colspan="3" class="tdFirst">Cena Zamówienia:</td>
              <td class="tdFirst"><asp:Label ID="lbOrderPrice" runat="server" ForeColor="White" Text=""></asp:Label></td>
           </tr>
        </table>
        <asp:Button ID="btOrder" runat="server" Text="Zamów" class="btDelete" Width="180px" Height="40px" BackColor="#F9683A" ForeColor="White" OnClick="btOrder_Click"/>
        <br />
        <asp:Label ID="lbOrder" runat="server" ForeColor="Red"></asp:Label>
    </form>
    <footer>Copyrights by Fial and Gambosz</footer>
</body>
</html>
