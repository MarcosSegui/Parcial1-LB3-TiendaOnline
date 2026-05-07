<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificacionProductos.aspx.cs" Inherits="TiendaOnlineP1_LP3.ModificacionProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Modificación de Productos</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Modificación de Productos</h2>
        <p>¡Seleccione un producto para editarlo!</p>

        <!-- Se cambió el DataSourceID para que coincida con el SqlDataSource de abajo -->
        <asp:GridView ID="GridViewProductos" runat="server" AutoGenerateColumns="False" CellPadding="8" GridLines="Horizontal"
            DataKeyNames="idProducto" DataSourceID="SqlDataSourceConsulta" OnSelectedIndexChanged="GridViewProductos_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="idProducto" HeaderText="ID"/>
                <asp:BoundField DataField="nombre" HeaderText="Producto"/>
                <asp:CommandField ShowSelectButton="True" SelectText="Editar"/>
            </Columns>
        </asp:GridView>

        <hr />

        <asp:Panel ID="PanelEdicion" runat="server" Visible="False">
            <h3>Editando ID: <asp:Label ID="lblIdProducto" runat="server" Text=""></asp:Label></h3>

            Nombre: <asp:TextBox ID="txtEditNombre" runat="server"></asp:TextBox> <br />
            <br />
            Precio: <asp:TextBox ID="txtEditPrecio" runat="server"></asp:TextBox> <br />
            <br />
            Categoría:
            <asp:DropDownList ID="ddlEditarCategorias" runat="server" DataSourceID="SqlDataSourceCategorias"
                DataTextField="descripcion" DataValueField="idCategoria">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
            <br /><br />
        </asp:Panel>

        <asp:Label ID="lblMensajeEdicion" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="hlconsulta" runat="server" NavigateUrl="~/ConsultaProductos.aspx">Consultar Productos</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/TiendaOnline.aspx">Volver al Menú</asp:HyperLink>

        <!-- Fuente de datos para el GridView -->
        <asp:SqlDataSource ID="SqlDataSourceConsulta" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MiConexion %>" 
            SelectCommand="SELECT * FROM productos">
        </asp:SqlDataSource>

        <!-- Fuente de datos para el DropDownList -->
        <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MiConexion %>" 
            SelectCommand="SELECT * FROM categorias">
        </asp:SqlDataSource>

        <!-- Fuente de datos para la Modificación (Corrección de IDs de parámetros) -->
        <asp:SqlDataSource ID="SqlDataSourceModificacion" runat="server" ConnectionString="<%$ ConnectionStrings:MiConexion %>" 
            UpdateCommand="UPDATE productos SET nombre=@nombre, precio=@precio, idCategoria=@idCat WHERE idProducto=@id">
            <UpdateParameters>
                <asp:ControlParameter ControlID="txtEditNombre" Name="nombre" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtEditPrecio" Name="precio" PropertyName="Text" />
                <asp:ControlParameter ControlID="ddlEditarCategorias" Name="idCat" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="lblIdProducto" Name="id" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</form>
</body>
</html>
