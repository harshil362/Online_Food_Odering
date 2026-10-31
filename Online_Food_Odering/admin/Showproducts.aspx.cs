using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Food_Odering
{
    public partial class Showproducts : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string fnm, nm;
        int uid;

        string s = System.Configuration.ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                getcon();

                da = new SqlDataAdapter(
                    "select * from Users_tbl where Email='" + Session["admin"] + "'",
                    con);

                ds = new DataSet();

                da.Fill(ds);

                nm = ds.Tables[0].Rows[0]["FullName"].ToString();

                uid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"]);

                Label1.Text = "Welcome " + nm;

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

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_vdlt")
            {
                int fid = Convert.ToInt32(e.CommandArgument);

                ViewState["fid"] = fid;

                Response.Redirect("../food-details.aspx?fid=" + ViewState["fid"]);
            }
            else
            {
                int Foodid = Convert.ToInt32(e.CommandArgument);

                ViewState["Foodid"] = Foodid;

                getcon();

                int quantity = 1;

                cmd = new SqlCommand(
                    "insert into Cart_tbl(Cart_User_Id, Cart_Food_Id, Quantity, AddedDate) Values('"
                    + uid + "', '"
                    + ViewState["Foodid"] + "', '"
                    + quantity + "', GETDATE())",
                    con);

                cmd.ExecuteNonQuery();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

        }

        void filldata()
        {
            getcon();

            da = new SqlDataAdapter(
                @"SELECT f.*, ISNULL(c.Ctgry_Name, f.Food_Category_id) AS Food_Category 
                  FROM Add_Food_tbl f 
                  LEFT JOIN add_categories_tbl c ON CAST(c.Id AS VARCHAR(50)) = f.Food_Category_id OR c.Ctgry_Name = f.Food_Category_id",
                con);

            ds = new DataSet();

            da.Fill(ds);

            DataList1.DataSource = ds;

            DataList1.DataBind();
            con.Close();
        }
    }
}