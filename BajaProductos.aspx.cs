using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaOnlineP1_LP3
{
    public partial class BajaProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridViewBaja_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 1. Capturar datos de la fila seleccionada
            lblIdEliminar.Text = GridViewBaja.SelectedDataKey.Value.ToString();
            lblNombreEliminar.Text = GridViewBaja.SelectedRow.Cells[1].Text;
            // 2. Mostrar panel de confirmación y limpiar mensajes previos
            pnlConfirmacion.Visible = true;
            lblMensaje.Text = "";
        }

        protected void btnConfirmarBaja_Click(object sender, EventArgs e)
        {
            try
            {
                // 3. Ejecutar el DELETE a través del SqlDataSource
                SqlDataSourceBorrar.Delete();

                lblMensaje.Text = "Producto eliminado con éxito.";
                lblMensaje.ForeColor = Color.Green;

                // 4. Limpiar interfaz
                pnlConfirmacion.Visible = false;
                GridViewBaja.DataBind(); // Refresca la lista para que el producto ya no aparezca
                GridViewBaja.SelectedIndex = -1;
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al eliminar: " + ex.Message;
                lblMensaje.ForeColor = Color.Red;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            pnlConfirmacion.Visible = false;
            GridViewBaja.SelectedIndex = -1;
        }
    }
}