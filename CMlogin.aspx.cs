using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CMlogin : System.Web.UI.Page
{
    Class1 obBase = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string strcon = obBase.strDB;
        DataSet ds = new DataSet();
        SqlCommand cmd = null;
        String ma = TextBox1.Text.Trim();
        String mp = TextBox2.Text.Trim();

        using (SqlConnection conn = new SqlConnection(strcon))
        {
            conn.Open();
            string sSql = "select * from Manager ";
            sSql += " where (Mno=@ma) and (Mpass =@mp)";
            cmd = new SqlCommand(sSql, conn);
            cmd.Parameters.AddWithValue("@ma", ma);
            cmd.Parameters.AddWithValue("@mp", mp);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                Session["User"] = ds.Tables[0].Columns.Count;
                Session["Pass"] = ds.Tables[0].Columns.Count;
                Response.Redirect("CM.aspx");
            }

            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('帳號密碼錯誤，請重新輸入');</script>");
            }

        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}