<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminForm.aspx.cs" Inherits="sklep.WebForm8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Admin</title>
    <style>
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
            clear:both;
            color: white;
            text-align: center;
        }
        .lvStore{
           width: 100%;
           background: white;
        }
        .tMain{
            margin: 0 auto;
            width: 60%;
            color: white;
        }
        td{
            border: 1px solid white;
        }
        .tdTitle{
            background: #EEEEEE;
            color: black;
            width: 30%;
        }
        .tdTitleNumber{
            background: black;
            color: white;
            width: 30%;
        }
        .tbChange{
            border: none;
            width: 100%;
        }
        .tdData{
            width: 36%;
            background: #bf360c;
            color: white;
            text-align: left;
            border: none;
        }
        .btDelete{
            margin: 10px;
            padding: 10px;
        }
        .tbForm{
            width: 100%;
            background: #bf360c;
            color: white;
            text-align: left;
            border: none;
        }
        .ddlOrder{
            width: 300px;
            height: 50px;
            background: #EEEEEE;
            color: black;
            font-size: 20px;
            margin: 10px;
        }
        .tdSpace{
            height: 20px;
            background: #802F21;
            border: none;
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
        <h1 class="text">Zarządzanie kontem</h1>
        <h2 class="text">Twoje Dane:</h2>
        <asp:ListView ID="lvUser" runat="server" DataSourceID="User" class="lvStore">
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;">
                    <tr class="empty">
                        <td style="text-align:center;">Coś poszło nie tak</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <LayoutTemplate>
                 <table class="tMain" id="itemPlaceholderContainer" runat="server">
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                 </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td class="tdTitle">IMIE</td>
                    <td class="tdData"><%# Eval("imie") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">NAZWISKO</td>
                    <td class="tdData"><%# Eval("nazwisko") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">TELEFON</td>
                    <td class="tdData"><%# Eval("telefon") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">PŁEĆ</td>
                    <td class="tdData"><%# Eval("plec") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">EMAIL</td>
                    <td class="tdData"><%# Eval("email") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">LOGIN</td>
                    <td class="tdData"><%# Eval("login") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">PASSWORD</td>
                    <td class="tdData"><%# Eval("haslo") %></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="User" runat="server" ConnectionString="<%$ ConnectionStrings:xyk3xnocq6ConnectionString %>" ProviderName="<%$ ConnectionStrings:xyk3xnocq6ConnectionString.ProviderName %>" SelectCommand="SELECT nazwa, kategoria, cena, obraz FROM produkty"></asp:SqlDataSource>
        <h2 class="text">
            <asp:SqlDataSource ID="Orders" runat="server" ConnectionString="<%$ ConnectionStrings:xyk3xnocq6ConnectionString %>" ProviderName="<%$ ConnectionStrings:xyk3xnocq6ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM zamowienia"></asp:SqlDataSource>
            Modyfikacja konta:</h2>        
        <table class="tMain">
            <tr>
                <td class="tdTitle">IMIE</td>
                <td class="tdData">
                    <asp:TextBox ID="tbName" runat="server" class="tbForm"></asp:TextBox>
                </td>
                <td class="tdTitle"></td>
            </tr>
            <tr>
                <td class="tdTitle">NAZWISKO</td>
                <td class="tdData">
                    <asp:TextBox ID="tbLastName" runat="server" class="tbForm"></asp:TextBox>
                </td>
                <td class="tdTitle"></td>
            </tr>
            <tr>
                <td class="tdTitle">TELEFON</td>
                <td class="tdData">
                    <asp:TextBox ID="tbPhone" runat="server" class="tbForm"></asp:TextBox>
                </td>
                <td class="tdTitle">
                    <asp:Label ID="lbNumber" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="tdTitle">PŁEĆ</td>
                <td class="tdData">
                    <asp:DropDownList ID="ddlGender" runat="server" Width="100%" style="margin-bottom: 0px" Height="25px" class="tbForm">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Helikopter bojowy radzieckiej produkcji</asp:ListItem>
                        <asp:ListItem>Helikopter bojowy amerykańskiej produkcji</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="tdTitle"></td>
            </tr>
            <tr>
                <td class="tdTitle">EMAIL</td>
                <td class="tdData">
                    <asp:TextBox ID="tbEmail" runat="server" class="tbForm"></asp:TextBox>
                </td>
                <td class="tdTitle">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" ErrorMessage="nieprawidłowy email" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="tdTitle">PASSWORD</td>
                <td class="tdData">
                    <asp:TextBox ID="tbPassword" runat="server" class="tbForm" TextMode="Password"></asp:TextBox>
                </td>
                <td class="tdTitle"></td>
            </tr>
        </table>
        <asp:Button ID="btUpdate" runat="server" Text="Aktualizuj Dane" class="btDelete" Width="180px" BackColor="#F9683A" ForeColor="White" OnClick="btUpdate_Click"/>
        <br />
        <asp:Label ID="lbCommand" runat="server"></asp:Label>
        <h2 class="text">Usuń konto:</h2>
        <asp:Button ID="btDelete" runat="server" Text="Usuń konto" class="btDelete" Width="180px" BackColor="#F9683A" ForeColor="White" OnClick="btDelete_Click"/>
        <br />
        <h1 class="text">Zarządzanie użytkownikami</h1>
        <h2 class="text">Konta użytkowników:</h2>
        <br />
        <asp:ListView ID="lvUsers" runat="server" DataSourceID="sdsUserBaseAll" class="lvStore">
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;">
                    <tr class="empty">
                        <td style="text-align:center;">Coś poszło nie tak</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <LayoutTemplate>
                 <table class="tMain" id="itemPlaceholderContainer" runat="server">
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                 </table>
            </LayoutTemplate>
            <AlternatingItemTemplate>
                <tr>
                    <td class="tdTitle">Nazwa</td>
                    <td class="tdData"><%# Eval("login") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">Dostepność</td>
                    <td class="tdData"><%# Eval("typ") %></td>
                </tr>
                <tr>
                    <td colspan="2" class="tdSpace"></td>
                </tr>
            </AlternatingItemTemplate>
            <ItemTemplate>
                <tr>
                    <td class="tdTitle">Nazwa</td>
                    <td class="tdData"><%# Eval("login") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">Dostepność</td>
                    <td class="tdData"><%# Eval("typ") %></td>
                </tr>
                <tr>
                    <td colspan="2" class="tdSpace"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        <asp:DropDownList ID="ddlUserBase" runat="server" DataSourceID="sdsUserBase" DataTextField="login" DataValueField="login" class="ddlOrder">
        </asp:DropDownList>
        <br />
        <asp:Button Width="180px" Height="40px" BackColor="#F9683A" ForeColor="White" ID="btDeleteUserBase" runat="server" OnClick="btDeleteUserBase_Click" Text="Usuń użytkownika" />
        <br />
        <asp:SqlDataSource ID="sdsUserBase" runat="server" ConnectionString="<%$ ConnectionStrings:xyk3xnocq6ConnectionString %>" ProviderName="<%$ ConnectionStrings:xyk3xnocq6ConnectionString.ProviderName %>" SelectCommand="SELECT login, typ FROM userzy WHERE typ=&quot;user&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsUserBaseAll" runat="server" ConnectionString="<%$ ConnectionStrings:xyk3xnocq6ConnectionString %>" ProviderName="<%$ ConnectionStrings:xyk3xnocq6ConnectionString.ProviderName %>" SelectCommand="SELECT login, typ FROM userzy"></asp:SqlDataSource>
        <h1 class="text">Zarządzanie produktami</h1>
        <h2 class="text">Produkty:</h2>
        <br />
        <asp:ListView ID="lvProducts" runat="server" DataSourceID="sdsProductsBase" class="lvStore">
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;">
                    <tr class="empty">
                        <td style="text-align:center;">Coś poszło nie tak</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <LayoutTemplate>
                 <table class="tMain" id="itemPlaceholderContainer" runat="server">
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                 </table>
            </LayoutTemplate>
            <AlternatingItemTemplate>
                <tr>
                    <td class="tdTitle">Nazwa</td>
                    <td class="tdData"><%# Eval("nazwa") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">Dostepność</td>
                    <td class="tdData"><%# Eval("dostepnosc") %></td>
                </tr>
                <tr>
                    <td colspan="2" class="tdSpace"></td>
                </tr>
            </AlternatingItemTemplate>
            <ItemTemplate>
                <tr>
                    <td class="tdTitle">Nazwa</td>
                    <td class="tdData"><%# Eval("nazwa") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">Dostepność</td>
                    <td class="tdData"><%# Eval("dostepnosc") %></td>
                </tr>
                <tr>
                    <td colspan="2" class="tdSpace"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        <asp:DropDownList ID="ddlProducts" runat="server" DataSourceID="sdsProductsBase" DataTextField="nazwa" DataValueField="nazwa" class="ddlOrder">
        </asp:DropDownList>
        <br />
        <asp:Button Width="180px" Height="40px" BackColor="#F9683A" ForeColor="White" ID="btDeleteProductsBase" runat="server" Text="Usuń produkt" OnClick="btDeleteProductsBase_Click" />
        <br />
        <br />
        <asp:Button Width="180px" Height="40px" BackColor="#F9683A" ForeColor="White" ID="btChangeValueProducts" runat="server" Text="Zmień dostępność" OnClick="btChangeValueProducts_Click" />
        <br />
        <asp:SqlDataSource ID="sdsProductsBase" runat="server" ConnectionString="<%$ ConnectionStrings:xyk3xnocq6ConnectionString %>" ProviderName="<%$ ConnectionStrings:xyk3xnocq6ConnectionString.ProviderName %>" SelectCommand="SELECT nazwa, dostepnosc FROM produkty"></asp:SqlDataSource>
        <br />
        <h1 class="text">Zarządzanie zamówieniami</h1>
        <h2 class="text">Zamówienia:</h2>
        <br />
        <asp:ListView ID="lvOrders" runat="server" DataSourceID="sdsOrders" class="lvStore">
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;">
                    <tr class="empty">
                        <td style="text-align:center;">Brak zamówień</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <LayoutTemplate>
                 <table class="tMain" id="itemPlaceholderContainer" runat="server">
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                 </table>
            </LayoutTemplate>
            <AlternatingItemTemplate>
                <tr>
                    <td class="tdTitle">Nazwa</td>
                    <td class="tdData"><%# Eval("id_zamow") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">Dostepność</td>
                    <td class="tdData"><%# Eval("status") %></td>
                </tr>
                <tr>
                    <td colspan="2" class="tdSpace"></td>
                </tr>
            </AlternatingItemTemplate>
            <ItemTemplate>
                <tr>
                    <td class="tdTitle">Nazwa</td>
                    <td class="tdData"><%# Eval("id_zamow") %></td>
                </tr>
                <tr>
                    <td class="tdTitle">Dostepność</td>
                    <td class="tdData"><%# Eval("status") %></td>
                </tr>
                <tr>
                    <td colspan="2" class="tdSpace"></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        <br />
        <asp:DropDownList ID="ddlOrders" runat="server" DataSourceID="sdsOrders" DataTextField="id_zamow" DataValueField="id_zamow" class="ddlOrder">
        </asp:DropDownList>
        <br />
        <asp:DropDownList ID="ddlStatus" runat="server" class="ddlOrder">
            <asp:ListItem>przygotowanie</asp:ListItem>
            <asp:ListItem>gotowe</asp:ListItem>
            <asp:ListItem>wysłane</asp:ListItem>
            <asp:ListItem>odebrane</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button Width="220px" Height="40px" BackColor="#F9683A" ForeColor="White" ID="btChangeStatus" runat="server" Text="Zmień status zamówienia" OnClick="btChangeStatus_Click" />
        <br />
        <br />
        <asp:Button Width="180px" Height="40px" BackColor="#F9683A" ForeColor="White" ID="btDeleteOrders" runat="server" OnClick="btDeleteOrders_Click" Text="Usuń zamówienie" />
        <br />
        <asp:SqlDataSource ID="sdsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:xyk3xnocq6ConnectionString %>" ProviderName="<%$ ConnectionStrings:xyk3xnocq6ConnectionString.ProviderName %>" SelectCommand="SELECT id_zamow, status FROM zamowienia"></asp:SqlDataSource>
    </form>
    <footer>Copyrights by Fial and Gambosz</footer>
</body>
</html>
