using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ParcialLP3
{
    public partial class Prueba2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Prueba1.aspx");
            }
            else
            {
                Label1.Text = $"Bienvenido, {Session["Username"]}";
                if (!IsPostBack)
                {
                    cargarGrilla();
                }
            }
        }

        public void cargarGrilla()
        {
            string username = Session["Username"] as string;
            if (string.IsNullOrEmpty(username))
            {
                Label1.Text = "No hay usuario registrado en la sesión.";
                return;
            }

            string path = $"{Server.MapPath(".")}/{username}";
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            string[] files = Directory.GetFiles(path);
            List<Archivo> fileList = new List<Archivo>();
            foreach (string file in files)
            {
                fileList.Add(new Archivo(Path.GetFileName(file), file));
            }

            GridView1.DataSource = fileList;
            GridView1.DataBind();
        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            string username = Session["Username"] as string;
            if (string.IsNullOrEmpty(username))
            {
                Label1.Text = "No hay usuario registrado en la sesión.";
                return;
            }

            if (FileUpload1.HasFile)
            {
                string path = $"{Server.MapPath(".")}/{username}";
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                string result = string.Empty;
                foreach (HttpPostedFile archivo in FileUpload1.PostedFiles)
                {
                    string filePath = $"{path}/{archivo.FileName}";
                    if (archivo.ContentLength > 10 * 1024 * 1024)
                    {
                        result += $"El archivo {archivo.FileName} supera el límite permitido. ";
                    }
                    else if (File.Exists(filePath))
                    {
                        result += $"El archivo {archivo.FileName} ya existe. ";
                    }
                    else
                    {
                        archivo.SaveAs(filePath);
                        result += $"El archivo {archivo.FileName} se ha subido correctamente. ";
                    }
                }

                Label1.Text = result;
                cargarGrilla();
            }
            else
            {
                Label1.Text = "Por favor, seleccione un archivo para subir.";
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                string filePath = $"{Server.MapPath(".")}/{Session["Username"]}/{row.Cells[0].Text}";

                if (File.Exists(filePath))
                {
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                    Response.TransmitFile(filePath);
                    Response.End();
                }
                else
                {
                    Label1.Text = "El archivo no existe.";
                }
            }
        }
    }
}
