<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="sklep.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sklep</title>
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
            position: fixed;
            top: 0;
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
        .Category{
            display: flex;
            width: 100%;
            height: 60px;
            margin-bottom: 20px;
            background: white;
            justify-content: space-around;
            align-items: center;
            border-bottom: 5px solid #D72324;
            border-top: 5px solid #D72324;
            position: fixed;
            top: 150px;
        }
        .categorySelect{
            height: 50px;
            width: 150px;
            background: white; 
            color: Black; 
            font-size: 20px;
            text-align: center;
        }
        .categoryButton{
            height: 50px;
            width: 150px;
            background: white; 
            color: #D72324; 
            font-size: 20px;
            text-align: center;
            border-left: 2px solid #D72324;
            border-right: 2px solid #D72324;
            border-bottom: none;
            border-top: none;
        }
        .lvStore{
           width: 100%;
           background: white;
           margin-top: 0px;
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
        .trTwo{
            width: 100%;
            background-color:black;
            color: white;
        }
        .sTitle{
            font-size: 66px;
            color: #D72324;
            font-family: Rockwell;
        }
        .sCategory{
            color: red;
        }
        .sPrice{
            color: #D72324;
            font-size: 40px;
        }
        .tdGame{
            font-size: 30px;
            border: 3px solid white;
        }
        .enter{
            margin-top: 10px;
            padding: 5px;
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: space-around;
            align-items: center;
            background: #EEEEEE;
            border-top: 5px solid #D72324;
            border-bottom: 5px solid #D72324;
            position: fixed;
            top: 230px;
        }
        .enterText{
            font-size: 35px;
            color: black;
        }
        .enterButton{
            padding: 5px;
            font-size: 30px;
            text-decoration: none;
            color: #D72324;
            border-left: 2px solid #D72324;
            border-right: 2px solid #D72324;
            border-top: none;
            border-bottom: none;
            background: #EEEEEE;
        }
        .enterSelect{
            margin: 0 10px 0 10px;
            height: 50px;
            width: 400px;
            background: black; 
            color: white; 
            font-size: 35px;
            text-align: center;
        }
        footer{
            width: 100%;
            clear:both;
            color: white;
            text-align: center;
        }
        .ady
        {
            margin-top:300px;
            margin-bottom:0;
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
        <asp:AdRotator ID="AdRotator1" class="baner" runat="server" Width="800" Height="200" CssClass="ady" AdvertisementFile="~/Advert2.xml"/>
        <div class="Category">
            <div>
                Gatunek
                <asp:CheckBox ID="cbGatunek" runat="server" />  
                <asp:DropDownList ID="ddlCategory" class="categorySelect" runat="server" DataSourceID="Category" DataTextField="kategoria" DataValueField="kategoria">
                </asp:DropDownList>
            </div>
            <div>
                Cena
                <asp:TextBox class="categorySelect" ID="iPrice" runat="server"></asp:TextBox>
            </div>
            <div>
                Nazwa
                <asp:TextBox class="categorySelect" ID="iName" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button class="categoryButton" ID="btSzukaj" runat="server" Text="Szukaj" OnClick="btSzukaj_Click" />
                <asp:Button class="categoryButton" ID="btClear" runat="server" OnClick="btClear_Click" Text="Wyczyść" />
            </div>
        </div>

        <div class="enter">
            <span class="enterText">Przejdź do gry, która cię interesuje: </span>
            <asp:DropDownList ID="ddlGameSerach" class="enterSelect" runat="server" DataSourceID="Store" DataTextField="nazwa" DataValueField="nazwa">
            </asp:DropDownList>
            <asp:Button class="enterButton" ID="btEnter" runat="server" Text="Wejdź" OnClick="btEnter_Click" />
        </div>

        <div class="lvStore">
            <asp:ListView ID="lvStore" runat="server" DataSourceID="Store">
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;">
                        <tr class="empty">
                            <td style="text-align:center;">Niestety, nie posiadany gry spełniającej twoje wymagania</td>
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
                    <tr class="trOne">
                        <td class="tdGame">
                            Kultowy <span class="sCategory"><%# Eval("kategoria") %></span>
                            <br />
                            <span class="sTitle"><%# Eval("nazwa") %></span>
                            <br />
                            Już teraz w naszym sklepie za <span class="sPrice"><%# Eval("cena") %>zł</span>     
                        </td>
                        <td class="tdGame" style="width:300px">
                           <img src ="<%# Eval("obraz") %>" alt="a hoj ci" width="300"/>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <ItemTemplate>
                    <tr class="trTwo">
                        <td class="tdGame">
                            Kultowy <span class="sCategory"><%# Eval("kategoria") %></span>
                            <br />
                            <span class="sTitle"><%# Eval("nazwa") %></span>
                            <br />
                            Już teraz w naszym sklepie za <span class="sPrice"><%# Eval("cena") %>zł</span>     
                        </td>
                        <td class="tdGame" style="width:300px">
                           <img src ="<%# Eval("obraz") %>" alt="a hoj ci" width="300"/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <asp:SqlDataSource ID="Store" runat="server" ConnectionString="<%$ ConnectionStrings:xyk3xnocq6ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:xyk3xnocq6ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM produkty"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Category" runat="server" ConnectionString="<%$ ConnectionStrings:xyk3xnocq6ConnectionString %>" ProviderName="<%$ ConnectionStrings:xyk3xnocq6ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT kategoria FROM produkty"></asp:SqlDataSource>
    </form>
    <footer>Copyrights by Fial and Gambosz</footer>
</body>
</html>
