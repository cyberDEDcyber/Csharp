<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="sklep.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>O nas</title>
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
            <h1 class="text">O nas</h1>
            <span class="text">
                Jak wygląda nasza firma?
                <br />
                Nie ma tak, że dobrze lub niedobrze. Gdybym miał powiedzieć co ceni nasza firma to ludzi. Ludzi, którzy nauczyli nas tworzyć strony jak ta,
                <br />
                na lekcjach w czasie których grał sobie jazz.
                <br />
                Ludzi, którzy w trakcie jej pisania krzyczą do ciebie, że trzeba iść na hotdożka do żabki.
                <br />
                Mieliśmy to szczęscie w życiu, że znalezliśmy determinacje w posatci mam nadzieje ponad 30 punktów do zrobienia tego projektu.
                <br />
                Życie to taniec, życie to asp.net. Jak go nie ogarniasz to nie bardzo idziesz dalej.
                <br />
                No i kto wie, dzisiaj wpisuje 58 płci do projektu w imie tolerancji i konstytucji rzeczpospolitej,
                <br />
                a jutro na ten przykład będę robił sqlLite w react.native.
            </span>
            <h1 class="text">Zasady</h1>
            <span class="text">
                Strona działa na Gender-Chorizo-Beer-Pat the goat-ware. 
                <br />
                Należy spełnić, któryś z wymogów, by w pełni cieszyć się z strony.
            </span>
        </div>
    </form>
</body>
</html>
