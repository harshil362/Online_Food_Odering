using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Online_Food_Odering
{
    public partial class AddToCart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        int uid;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            getCon();

            da = new SqlDataAdapter(
                "select * from Users_tbl where Email='" + Session["user"] + "'",
                con);

            ds = new DataSet();

            da.Fill(ds);

            uid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"]);

            if (!IsPostBack)
            {
                fillCartDataList();
            }
        }

        void fillCartDataList()
        {
            getCon();


            string query = "SELECT c.Cart_Id, p.Food_Id, p.Food_Image, p.Food_Name, " +
                "p.Food_Discount_Price, c.Quantity " +
                "FROM Add_Food_tbl p " +
                "INNER JOIN Cart_tbl c ON p.Food_Id = c.Cart_Prod_Id " +
                "WHERE c.Cart_User_Id = '" + uid + "'";

            da = new SqlDataAdapter(query, con);

            ds = new DataSet();

            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            decimal total = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                decimal price =Convert.ToDecimal(row["Food_Discount_Price"]);

                int quantity =Convert.ToInt32(row["Quantity"]);

                total += price * quantity;
            }

            grand_total.Text = "Total : ₹ " + total.ToString("0.00");

            con.Close();
        }

        protected void GridView1_RowEditing(object sender,GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

            fillCartDataList();
        }

        protected void GridView1_RowUpdating(object sender,GridViewUpdateEventArgs e)
        {
            int foodid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            GridViewRow row = GridView1.Rows[e.RowIndex];

            DropDownList ddlqty =(DropDownList)row.FindControl("DropDownList1");

            int qty = Convert.ToInt32(ddlqty.SelectedValue);

            getCon();

            cmd = new SqlCommand(
                "UPDATE Cart_tbl SET Quantity = '" + qty +
                "' WHERE Cart_Prod_Id = '" + foodid +
                "' AND Cart_User_Id = '" + uid + "'",
                con);

            cmd.ExecuteNonQuery();

            GridView1.EditIndex = -1;

            fillCartDataList();
        }

        protected void GridView1_RowCancelingEdit(object sender,GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;

            fillCartDataList();
        }
    }
}