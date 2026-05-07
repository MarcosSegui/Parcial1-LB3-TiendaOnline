<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BajaProductos.aspx.cs" Inherits="TiendaOnlineP1_LP3.BajaProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Baja de Productos - NeoTech</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Eliminar Productos</h2>
            <p>Seleccione un producto para eliminarlo.</p>
            
            <!-- GridView solo para seleccionar (como en Modificación) -->
        <asp:GridView ID="GridViewBaja" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="idProducto" DataSourceID="SqlDataSourceConsulta" 
            OnSelectedIndexChanged="GridViewBaja_SelectedIndexChanged" CellPadding="8">
            <Columns>
                <asp:BoundField DataField="idProducto" HeaderText="ID" />
                <asp:BoundField DataField="nombre" HeaderText="Producto" />
                <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar para borrar" />
            </Columns>
        </asp:GridView>

        <hr />

        <!-- Panel de confirmación fuera del GridView -->
        <asp:Panel ID="pnlConfirmacion" runat="server" Visible="false">
            <h3 style="color:red;">¿Confirma que desea eliminar el producto?</h3>
            ID: <asp:Label ID="lblIdEliminar" runat="server" Text=""></asp:Label> <br />
            Nombre: <asp:Label ID="lblNombreEliminar" runat="server" Text=""></asp:Label> <br /><br />
            
            <asp:Button ID="btnConfirmarBaja" runat="server" Text="SÍ, ELIMINAR" OnClick="btnConfirmarBaja_Click" BackColor="Red" ForeColor="White" />
            <asp:Button ID="btnCancelar" runat="server" Text="CANCELAR" OnClick="btnCancelar_Click" />
        </asp:Panel>

        <br />
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ConsultaProductos.aspx">Consultar productos</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/TiendaOnline.aspx">Volver al Menú</asp:HyperLink>
        <hr />

        <!-- DataSource de Lectura -->
        <asp:SqlDataSource ID="SqlDataSourceConsulta" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MiConexion %>" 
            SelectCommand="SELECT idProducto, nombre FROM productos">
        </asp:SqlDataSource>

        <!-- DataSource de Borrado (Usando ControlParameter del Label) -->
        <asp:SqlDataSource ID="SqlDataSourceBorrar" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MiConexion %>" 
            DeleteCommand="DELETE FROM productos WHERE idProducto = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="lblIdEliminar" Name="id" PropertyName="Text" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
