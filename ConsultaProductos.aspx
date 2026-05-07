<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaProductos.aspx.cs" Inherits="TiendaOnlineP1_LP3.ConsultaProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Neo-Tech - Consulta de Productos</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Listado de Productos</h2>

            <!-- GridView para mostrar los productos -->
            <asp:GridView ID="GridViewProductos" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceProductos" CellPadding="8" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="idProducto" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="categoria" HeaderText="Categoría" />
                </Columns>
            </asp:GridView>

            <!-- SqlDataSource con el JOIN para obtener los productos con su categoría -->
            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MiConexion %>" 
                SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion 
                AS categoria FROM productos p INNER JOIN categorias c ON p.idCategoria = c.idCategoria">
            </asp:SqlDataSource>

            <br /><br />
            <hr />
            <!-- Hipervinculo para ir a la página de modificación de productos -->
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ModificacionProductos.aspx">Modificar un producto</asp:HyperLink>
            <br />
            <br />
            <!-- Hipervinculo para ir a la pagina de baja de productos -->
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/BajaProductos.aspx">Dar de baja un producto</asp:HyperLink>
            <br />
            <br />
            <!-- Hipervinculo para regresar al menu principal -->
            <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/TiendaOnline.aspx">Volver al Menú</asp:HyperLink>
            <hr />
        </div>
    </form>
</body>
</html>
