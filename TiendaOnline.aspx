<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TiendaOnline.aspx.cs" Inherits="TiendaOnlineP1_LP3.TiendaOnline" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Neo-Tech Hardware &amp; Cyberware</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Sistema de Gestión AMB</h1>
            <h2>Neo-Tech Hardware &amp; Cyberware</h2>
            <p>Bienvenido a nuestra tienda en línea. Aquí podrás explorar y adquirir los mejores productos de hardware y cyberware.</p>
        </div>
        <br />
        <br />
        <hr />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AltaProductos.aspx">Dar de alta un producto</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ConsultaProductos.aspx">Consultar un producto</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ModificacionProductos.aspx">Modificar un producto</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/BajaProductos.aspx">Dar de baja un producto</asp:HyperLink>
        <hr />
    </form>
</body>
</html>
