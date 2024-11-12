using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ParcialLP3
{
    public partial class Prueba1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
        protected void CustomValidator1_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            int edad;
            if (int.TryParse(TextBox3.Text, out edad))
            {
                args.IsValid = edad > 15;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string correo = TextBox1.Text;
            string username = TextBox2.Text;
            string password = TextBox4.Text;

            if (!string.IsNullOrEmpty(username))
            {
                Session["Username"] = username;

                Response.Cookies["UserPassword"].Value = password;
                Response.Cookies["UserPassword"].Expires = DateTime.Now.AddSeconds(30);

                this.Session["Username"] = username;

                Response.Redirect("Prueba2.aspx");
            }
        }
    }
}