using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TiendaOnlineP1_LP3
{
    public partial class AltaProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            // 1. Limpiar mensajes previos
            lblMensaje.Text = "";
            lblMensaje.ForeColor = System.Drawing.Color.Red;

            // 2. Validación de campos vacíos
            if (string.IsNullOrWhiteSpace(txtNombre.Text) || string.IsNullOrWhiteSpace(txtPrecio.Text))
            {
                lblMensaje.Text = "Error: El nombre y el precio no pueden estar vacíos.";
                return; // Detiene la ejecución para que no intente insertar en la BD
            }

            // 3. Validación de formato numérico para el Precio
            decimal precioValido;
            bool esNumero = decimal.TryParse(txtPrecio.Text, out precioValido);

            if (!esNumero)
            {
                lblMensaje.Text = "Error: El precio debe ser un valor numérico válido.";
                return;
            }

            // 4. Si todo está bien, procedemos a la inserción
            try
            {
                SqlDataSourceAlta.Insert();

                lblMensaje.Text = "Producto registrado con éxito.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;

                // Limpieza de campos para la próxima carga
                txtNombre.Text = "";
                txtPrecio.Text = "";
                ddlCategorias.SelectedIndex = 0;
            }
            catch (Exception)
            {
                lblMensaje.Text = "Ocurrió un error en la base de datos.";
            }
        }
    }
}