using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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
      
        }

        protected void registerBtn_Click(object sender, ImageClickEventArgs e)
        {
            string gender;

            if (rbMale.Checked)
            {
                gender = "Male";
            }
            else if (rbFemale.Checked)
            {
                gender = "Female";
            }
            else
            {
                gender = "";
            }

            string role = ddlRole.SelectedValue;


            getcon();
            cmd = new SqlCommand("insert into Users_tbl(FullName,Email,Phone,Password,Gender,Role)values('" + fullName.Text + "','" + email.Text + "','" + phone.Text + "','" + password.Text + "','"+ gender + "', '"+role+"' )", con);
            cmd.ExecuteNonQuery();
            fillgrid();
            clear();


            Response.Redirect("Ragister.aspx");
        }

        protected void rbFemale_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}