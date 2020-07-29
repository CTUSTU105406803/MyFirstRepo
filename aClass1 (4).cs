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
    public partial class Login : System.Web.UI.Page
    {
        Class1 obBase = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = null;
            SqlCommand cmd2 = null;
            String ma = TextBox1.Text.Trim();
            String mp = TextBox2.Text.Trim();
            String ga = TextBox1.Text.Trim();
            String gp = TextBox2.Text.Trim();
            string strcon = obBase.strDB;

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                string sSql = "select * from m1 ";
                sSql += " where (mname=@ma) and (mpass=@mp)";
                cmd = new SqlCommand(sSql, conn);
                cmd.Parameters.AddWithValue("@ma", ma);
                cmd.Parameters.AddWithValue("@mp", mp);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                dataAdapter.Fill(ds);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Session["User"] = ds.Tables[0].Rows[0][0].ToString();
                    Session["Pass"] = ds.Tables[0].Rows[0][1].ToString(); ;
                    Response.Redirect("Mview.aspx");

                }
                ds.Clear();

                string sSql2 = "select * from g1 ";
                sSql2 += " where (gname=@ga) and (gpass =@gp)";
                cmd2 = new SqlCommand(sSql2, conn);
                cmd2.Parameters.AddWithValue("@ga", ga);
                cmd2.Parameters.AddWithValue("@gp", gp);
                SqlDataAdapter dataAdapter2 = new SqlDataAdapter(cmd2);
                dataAdapter2.Fill(ds);

                if (ds.Tables[0].Rows.Count != 0)
                {
                    Session["User"] = ds.Tables[0].Rows[0][0].ToString();
                    Session["Pass"] = ds.Tables[0].Rows[0][1].ToString();
                    Response.Redirect("Gview.aspx");
                }

                else
                {
                    Label4.Text = "沒有權限登入!";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}