using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Food_Odering.admin
{
    public partial class login : System.Web.UI.Page
    {

        SqlConnection con; //For connection 
        SqlDataAdapter da; // for container 
        DataSet ds; // for select 
        SqlCommand cmd; // For insert, update, delete 
        int i;


        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void adminLoginBtn_Click(object sender, ImageClickEventArgs e)
        {
            if (!(string.IsNullOrEmpty(adminEmail.Text)) && (!string.IsNullOrEmpty(adminPassword.Text)))
            {
                getcon();

                cmd = new SqlCommand(
                    "select count(*) from Users_tbl where Email='" + adminEmail.Text + "' and Password='" + adminPassword.Text + "'",
                    con);

                i = Convert.ToInt32(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Session["admin"] = adminEmail.Text; //Session["admin"] = adminPassword.Text;
                    
                    Response.Redirect("dashboard.aspx");

                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password')</script>");
                }

            }
        }
    }
}