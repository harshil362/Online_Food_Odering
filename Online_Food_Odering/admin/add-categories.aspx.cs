using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Food_Odering.admin
{
    public partial class add_categories : System.Web.UI.Page
    {

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm, nm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            fnm = "~/Product_Images/" + fuCategoryImage.FileName;
            fuCategoryImage.SaveAs(Server.MapPath(fnm));
        }


        void clear()
        {
            txtCategoryName.Text = "";
            txtCategoryDescription.Text = "";
        }


        protected void btnSaveCategory_Click(object sender, EventArgs e)
        {
            getcon();
            imgupload();
            cmd = new SqlCommand("INSERT INTO add_categories_tbl (Ctgry_Name, Ctgry_Description, Ctgry_img) values('" + txtCategoryName.Text + "','" + txtCategoryDescription.Text + "','" + fnm + "')", con);
            cmd.ExecuteNonQuery();
            clear();
        }
    }
}
