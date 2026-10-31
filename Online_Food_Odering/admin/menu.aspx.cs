using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Food_Odering.admin
{
    public partial class menu : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                getcon();
                filldata();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void filldata()
        {
            getcon();

            da = new SqlDataAdapter(
                "select * from Add_Food_tbl",
                con);

            ds = new DataSet();

            da.Fill(ds);

            DataList1.DataSource = ds;

            DataList1.DataBind();

            con.Close();
        }

        protected void DataList1_ItemCommand(
            object source,
            DataListCommandEventArgs e)
        {
            if (e.CommandName == "DeleteFood")
            {
                int foodid = Convert.ToInt32(e.CommandArgument);

                getcon();

                cmd = new SqlCommand(
                    "DELETE FROM Add_Food_tbl WHERE Food_Id = '" + foodid + "'",
                    con);

                cmd.ExecuteNonQuery();

                con.Close();

                filldata();
            }
        }
    }
}