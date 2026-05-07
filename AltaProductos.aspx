<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaProductos.aspx.cs" Inherits="TiendaOnlineP1_LP3.AltaProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Neo-Tech - Alta de Productos</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Neo-Tech Hardware &amp; Cyberware</h2>
            <p>Aquí podrás agregar nuevos productos a nuestro catálogo.</p>
            <hr />
            <h3>Cargar Nuevo Producto</h3>

            <!-- Campo Nombre -->
            <asp:Label ID="lblNombre" runat="server" Text="Nombre del Producto:"></asp:Label><br />
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br /><br />

            <!-- Campo Precio -->
            <asp:Label ID="lblPrecio" runat="server" Text="Precio:"></asp:Label><br />
            <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
            <br /><br />

            <!-- Campo Categoría -->
            <asp:Label ID="lblCategoria" runat="server" Text="Seleccionar Categoría:"></asp:Label><br />

            <!-- El DropDownList se llena automáticamente con las categorías de la BD -->
            <asp:DropDownList ID="ddlCategorias" runat="server" DataSourceID="SqlDataSourceCategorias" 
                DataTextField="descripcion" DataValueField="idCategoria">
            </asp:DropDownList>
            
            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MiConexion %>" 
                SelectCommand="SELECT idCategoria, descripcion FROM categorias">
            </asp:SqlDataSource>
            <br /><br />

            <!-- Botón para ejecutar la acción de confirmar -->
            <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" />
            <br /><br />

            <!-- Campo Mensaje de error o exito -->
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            <br /><br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ConsultaProductos.aspx">Consultar productos</asp:HyperLink>
            <br />
            <br />
            <!-- Requisito de navegación: volver a la principal -->
            <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/TiendaOnline.aspx">Volver al Menú</asp:HyperLink>


            <!-- SqlDataSource oculto que gestiona la inserción -->
            <asp:SqlDataSource ID="SqlDataSourceAlta" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MiConexion %>" 
                InsertCommand="INSERT INTO productos (nombre, precio, idCategoria) VALUES (@nombre, @precio, @idCategoria)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtPrecio" Name="precio" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ddlCategorias" Name="idCategoria" PropertyName="SelectedValue" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
