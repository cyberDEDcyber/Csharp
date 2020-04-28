<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="sklep.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Game</title>
    <style>
        body{
            background: black;
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
        .lvStore{
           width: 100%;
           background: white;
        }
        .tMain{
            width: 100%;
        }
        .trOne{
            width: 100%;
            background-color:black;
            color: white;
        }
        .empty{
            width: 100%;
            background-color:#802F21;
            color: white;
            text-align: center;
        }
        .tdGame{
            font-size: 30px;
        }
        .tdOpis{
            font-size: 20px;
            background: #802F21;
            color: white;
            text-align: center;
            padding: 5px;
        }
        .tdTabela{
            font-size: 40px;
            background: #802F21;
            color: white;
            text-align: center;
            padding: 5px;
            width: 200px;
        }
        .divOrder{
            width: 100%;
            height: 100px;
            font-size: 35px;
            background: #EEEEEE;
            color: black;
            display: flex;
            justify-content: flex-start;
            border-bottom: 2px solid #D72324;
            border-top: 2px solid #D72324;
            align-items: center;
            margin-top: 10px;
        }
        .btOrder{
            margin-left: 20px;
            width: 300px;
            height: 50px;
            background: #EEEEEE;
            color: #D72324;
            border-left: 2px solid #D72324;
            border-right: 2px solid #D72324;
            border-bottom: none;
            border-top: none;
            font-size: 30px;
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
        <div>   
            <asp:ListView ID="lvGames" runat="server" DataSourceID="Store" class="lvStore">
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;">
                    <tr class="empty">
                        <td style="text-align:center;">Niestety, ta gra przestała być produktem w naszym sklepie</td>
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
                <tr class="trOne">
                    <td class="tdTabela" colspan="2">
                        Dane produktu:
                        <table border="1" style="margin: 0 auto;">
                            <tr>
                                <td class="tdTabela">Nazwa</td>
                                <td class="tdTabela"><span><%# Eval("nazwa") %></span></td>
                            </tr>
                            <tr>
                                <td class="tdTabela">Kategoria</td>
                                <td class="tdTabela"><span><%# Eval("kategoria") %></span></td>
                            </tr>
                            <tr>
                                <td class="tdTabela">Cena</td>
                                <td class="tdTabela"><span><%# Eval("cena") %>zł</span></td>
                            </tr>
                        </table>   
                    </td>
                    <td class="tdGame" rowspan="2" style="width:300px">
                       <img src ="<%# Eval("obraz") %>" alt="a hoj ci" width="300"/>
                    </td>
                </tr>
                <tr>
                    <td class="tdOpis" style="width:600px">
                       <span class="sTitle"><%# Eval("opis") %></span>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        </div>
        <div class="divOrder">
            <asp:Label ID="lbGameOrder" runat="server"></asp:Label>
            <asp:Button class="btOrder" ID="btToShoppingCard" runat="server" OnClick="btToShoppingCard_Click" Text="Dodaj do koszyka" ViewStateMode="Enabled" />
        </div>
        <asp:SqlDataSource ID="Store" runat="server" ConnectionString="<%$ ConnectionStrings:xyk3xnocq6ConnectionString %>" ProviderName="<%$ ConnectionStrings:xyk3xnocq6ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM produkty"></asp:SqlDataSource>
    </form>
    <footer>Copyrights by Fial and Gambosz</footer>
</body>
</html>
