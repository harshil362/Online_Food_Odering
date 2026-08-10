using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Food_Odering
{
    public partial class Ragister : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            fillgrid();

        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from Users_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void clear()
        {
            fullName.Text = "";
            email.Text = "";
            password.Text = "";
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("insert into Users_tbl(FullName,Email,Phone,Password)values('" + fullName.Text + "','" + email.Text + "','" + phone.Text + "','" + password.Text + "')", con);
            cmd.ExecuteNonQuery();
            fillgrid();
            clear();


            Response.Redirect("login.aspx");
        }

        protected void registerBtn_Click(object sender, ImageClickEventArgs e)
        {

            getcon();
            cmd = new SqlCommand("insert into Users_tbl(FullName,Email,Phone,Password)values('" + fullName.Text + "','" + email.Text + "','" + phone.Text + "','" + password.Text + "')", con);
            cmd.ExecuteNonQuery();
            fillgrid();
            clear();


            Response.Redirect("login.aspx");
        }
    }
}