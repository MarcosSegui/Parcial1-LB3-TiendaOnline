using System;
using System.Collections.Generic;
using System.Drawing;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaOnlineP1_LP3
{
    public partial class ModificacionProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 1. Obtener el ID del producto seleccionado
            string id = GridViewProductos.SelectedDataKey.Value.ToString();
            lblIdProducto.Text = id;
            // 2. Aquí se debe cargar los datos actuales en los TextBox
            txtEditNombre.Text = GridViewProductos.SelectedRow.Cells[1].Text;
            txtEditPrecio.Text = GridViewProductos.SelectedRow.Cells[2].Text;
            //ddlEditarCategorias.SelectedValue = GridViewProductos.SelectedRow.Cells[3].Text;

            // 3. Guardamos los valores originales en ViewState para comparar después
            ViewState["NombreOriginal"] = txtEditNombre.Text;
            ViewState["PrecioOriginal"] = txtEditPrecio.Text;
            ViewState["CategoriaOriginal"] = ddlEditarCategorias.SelectedValue;

            // 4. Mostrar el panel de edición
            PanelEdicion.Visible = true;
            lblMensajeEdicion.Text = "Modifique los campos necesarios.";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // 1. Validar campos vacíos (Igual que en Alta)
            if (string.IsNullOrWhiteSpace(txtEditNombre.Text) || string.IsNullOrWhiteSpace(txtEditPrecio.Text))
            {
                lblMensajeEdicion.Text = "No puedes dejar campos vacíos.";
                lblMensajeEdicion.ForeColor = Color.Red;
                return;
            }

            // 2. Validar que el precio sea numérico
            decimal precioValido;
            if (!decimal.TryParse(txtEditPrecio.Text.Replace("$", "").Trim(), out precioValido))
            {
                lblMensajeEdicion.Text = "El precio debe ser un número válido.";
                lblMensajeEdicion.ForeColor = Color.Red;
                return;
            }

            // 3. Validar si hubo cambios reales
            bool huboCambio = txtEditNombre.Text != ViewState["NombreOriginal"].ToString() ||
                              txtEditPrecio.Text != ViewState["PrecioOriginal"].ToString() ||
                              ddlEditarCategorias.SelectedValue != ViewState["CategoriaOriginal"].ToString();

            if (huboCambio)
            {
                SqlDataSourceModificacion.Update();
                lblMensajeEdicion.Text = "Cambios guardados con éxito.";
                lblMensajeEdicion.ForeColor = Color.Green;
                PanelEdicion.Visible = false;
                GridViewProductos.DataBind();
            }
            else
            {
                lblMensajeEdicion.Text = "No se detectaron cambios.";
                lblMensajeEdicion.ForeColor = Color.Orange;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            // 1. Ocultar el panel de edición
            PanelEdicion.Visible = false;

            // 2. Limpiar mensajes y selección del GridView
            lblMensajeEdicion.Text = "";
            GridViewProductos.SelectedIndex = -1;

            // 3. Opcional: limpiar los ViewState para que no queden datos viejos
            ViewState["NombreOriginal"] = null;
            ViewState["PrecioOriginal"] = null;
            ViewState["CategoriaOriginal"] = null;
        }
    }
}