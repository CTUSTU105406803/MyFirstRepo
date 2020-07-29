using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class General : System.Web.UI.Page
{
    private void BindData()
    {
        string strcon = @"Persist Security Info=False;Integrated Security=true;
                     Initial Catalog=exan;Server=.\SQLExpress";

        SqlConnection conn = new SqlConnection(strcon);
        SqlCommand cmd = null;

        conn.Open();
        string sSql2 = "Select * from Class ";
        cmd = new SqlCommand(sSql2, conn);
        SqlDataReader dr = cmd.ExecuteReader();


        GridView1.DataSource = dr;
        GridView1.DataBind();

        conn.Close();
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
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}