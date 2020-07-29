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
    public partial class Mview : System.Web.UI.Page
    {
        Class1 obBase = new Class1();
        private void BindData()
        {
            string strcon = obBase.strDB;

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
            if (TextBox1.Text.Trim() == "" || TextBox2.Text.Trim() == "" || TextBox3.Text.Trim() == "")
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('資料為空，請輸入資料，謝謝');</script>");
                return;

            }

            string strcon = obBase.strDB;

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                SqlCommand cmd = null;


                string sSql = "Insert Into view1(no, class, teacher) Values(@TextBox1, @TextBox2, @TextBox3)";
                

                string TB1 = TextBox1.Text.Trim();
                string TB2 = TextBox2.Text.Trim();
                string TB3 = TextBox3.Text.Trim();
                cmd = new SqlCommand(sSql, conn);
                cmd.Parameters.AddWithValue("@TextBox1", TB1);
                cmd.Parameters.AddWithValue("@TextBox2", TB2);
                cmd.Parameters.AddWithValue("@TextBox3", TB3);
                cmd.ExecuteNonQuery();
                conn.Close();
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                BindData();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string strcon = obBase.strDB;

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                SqlCommand cmd = null;

                if (TextBox4.Text.Trim() == "")
                {
                    string sSql2 = "SELECT * FROM view1";

                    cmd = new SqlCommand(sSql2, conn);

                    SqlDataReader dr = cmd.ExecuteReader();
                    GridView1.DataSource = dr;
                    GridView1.DataBind();

                }
                else
                {
                    string sSql3 = "SELECT * FROM view1 where no = @TextBox4";

                    string TB4 = TextBox4.Text.Trim();
                    cmd = new SqlCommand(sSql3, conn);
                    cmd.Parameters.AddWithValue("@TextBox4", TB4);
                    cmd.ExecuteNonQuery();
                    SqlDataReader dr = cmd.ExecuteReader();
                    GridView1.DataSource = dr;
                    GridView1.DataBind();


                }

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string strcon = obBase.strDB;

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                SqlCommand cmd = null;

                String sql = "UPDATE view1 SET class=@class,teacher=@teacher WHERE no=@no";  
                cmd = new SqlCommand(sql, conn);

                string no = Convert.ToString(GridView1.Rows[e.RowIndex].Cells[0].Text);
                string sqlclass = (GridView1.Rows[e.RowIndex].Cells[1].Controls[1] as TextBox).Text.Trim();
                string teacher = (GridView1.Rows[e.RowIndex].Cells[2].Controls[1] as TextBox).Text.Trim();
                cmd.Parameters.AddWithValue("@no", no);
                cmd.Parameters.AddWithValue("@class", sqlclass);
                cmd.Parameters.AddWithValue("@teacher", teacher);

                cmd.ExecuteNonQuery();
                GridView1.EditIndex = -1;
                BindData();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string strcon = obBase.strDB;

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                SqlCommand cmd = null;

                string sql = "DELETE FROM view1 WHERE no=@no";

                string no = Convert.ToString(GridView1.Rows[e.RowIndex].Cells[0].Text);

                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@no", no);

                cmd.ExecuteNonQuery();
                BindData();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }
    }
}