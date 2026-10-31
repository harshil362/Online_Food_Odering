using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Food_Odering.admin
{
    public partial class add_food : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm, nm;

        string s = System.Configuration.ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;


        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }


        void imgupload()
        {
            fnm = "~/Product_Images/" + fuFoodImage.FileName;
            fuFoodImage.SaveAs(Server.MapPath(fnm));
        }



        void fillcombo()
        {
            getcon();

            da = new SqlDataAdapter("select * from add_categories_tbl", con);

            ds = new DataSet();

            da.Fill(ds);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlCategory.Items.Add(
                    new ListItem(
                        ds.Tables[0].Rows[i]["Ctgry_Name"].ToString(),
                        ds.Tables[0].Rows[i]["Id"].ToString()
                    )
                );
            }
        }


        void clear()
        {
            ddlCategory.SelectedIndex = 0;

            ddlFoodType.SelectedIndex = 0;

            txtFoodName.Text = "";

            txtDescription.Text = "";

            txtRegularPrice.Text = "";

            txtDiscountPrice.Text = "";

            txtIngredients.Text = "";

            ddlRating.SelectedIndex = 0;

            chkAvailable.Checked = true;

            chkFeatured.Checked = false;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                getcon();

                da = new SqlDataAdapter("select * from Users_tbl where Email='" + Session["admin"] + "'", con);

                ds = new DataSet();

                da.Fill(ds);

                nm = ds.Tables[0].Rows[0]["FullName"].ToString();

                if (!IsPostBack)
                {
                    fillcombo();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void txtIngredients_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ddlRating_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAddFood_Click(object sender, EventArgs e)
        {
            getcon();

            imgupload();

            cmd = new SqlCommand("insert into Add_Food_tbl(Food_Category_id, Food_Name, Food_Type, Food_Description, Food_Regular_Price, Food_Discount_Price, Food_Ingredients, Food_Image, Food_Rating) values('" + ddlCategory.SelectedValue + "','" + txtFoodName.Text + "','" + ddlFoodType.SelectedValue + "','" + txtDescription.Text + "','" + txtRegularPrice.Text + "','" + txtDiscountPrice.Text + "','" + txtIngredients.Text + "','" + fnm + "','" + ddlRating.SelectedValue + "')", con);

            cmd.ExecuteNonQuery();

            clear();
        }
    }
}