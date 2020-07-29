using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace test2
{
    public partial class Gview : System.Web.UI.Page
    {
        Class1 obBase = new Class1();
        private void BindData()
        {
            string strcon = obBase.strDB;

            //string strcon = @"Data Source=120.109.10.20;Initial Catalog=test2;User Id=105406803;Password=1234567";
            //string strcon = @"Data Source=120.109.10.20;Initial Catalog=test2;Trusted_Connection=True";


            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = new SqlCommand("SELECT * FROM view1", conn);
                DataSet ds = new DataSet();
                sda.Fill(ds, "emp");
                GridView1.DataSource = ds.Tables["emp"];
                GridView1.DataBind();
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

            BindData();
        }
    }
}