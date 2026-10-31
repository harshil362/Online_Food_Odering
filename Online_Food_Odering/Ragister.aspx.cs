using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Food_Odering
{
    public partial class Ragister : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\5BCA\Asp.Net\Online_Food_Odering\Online_Food_Odering\App_Data\FoodieHub.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            fullName.Text = "";
            email.Text = "";
            phone.Text = "";
            password.Text = "";

            rbMale.Checked = false;
            rbFemale.Checked = false;
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

            cmd = new SqlCommand(
                "insert into Users_tbl(FullName,Email,Phone,Password,Gender,Role) " +
                "values('" + fullName.Text + "','" + email.Text + "','" +
                phone.Text + "','" + password.Text + "','" + gender + "','" +
                role + "')", con);

            cmd.ExecuteNonQuery();

            con.Close();

            clear();

            Response.Redirect("Login.aspx");
        }

        protected void rbFemale_CheckedChanged(object sender, EventArgs e)
        {
        }
    }
}