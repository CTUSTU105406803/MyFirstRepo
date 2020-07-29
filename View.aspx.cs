using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class View : System.Web.UI.Page
{
    Class1 obBase = new Class1();
    private void BindData()
    {
        string strcon = obBase.strDB;

        using (SqlConnection conn = new SqlConnection(strcon))
        {
            //conn.Open();
            //SqlCommand cmd = null;

            //string Sqls1 = "SELECT * FROM Repair";
            //cmd = new SqlCommand(Sqls1, conn);
            //SqlDataReader dr = cmd.ExecuteReader();

            //GridView1.DataSource = dr;
            //GridView1.DataBind();
            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = new SqlCommand("SELECT * FROM Repair", conn);
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
            Session.Abandon();
        }
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("CMlogin.aspx");
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

            string Sql = "UPDATE Repair SET Rclass=@Rclass,Rext=@Rext,Rerror=@Rerror WHERE Rnumber=@Rnumber";
            cmd = new SqlCommand(Sql, conn);

           

            string RN = Convert.ToString(GridView1.Rows[e.RowIndex].Cells[0].Text);
            String RC = (GridView1.Rows[e.RowIndex].Cells[2].Controls[1] as TextBox).Text.Trim();
            String Rex = (GridView1.Rows[e.RowIndex].Cells[4].Controls[1] as TextBox).Text.Trim();
            String Rer = (GridView1.Rows[e.RowIndex].Cells[6].Controls[1] as TextBox).Text.Trim();
            cmd.Parameters.AddWithValue("@Rnumber", RN);
            cmd.Parameters.AddWithValue("@Rclass", RC);
            cmd.Parameters.AddWithValue("@Rext", Rex);
            cmd.Parameters.AddWithValue("@Rerror", Rer);

            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
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

    protected void Button4_Click(object sender, EventArgs e)
    {
        BindData();
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {            
            Label la3 = (Label)GridView1.Rows[i].Cells[5].FindControl("Label3");
            if (TextBox3.Text.Trim() == la3.Text.Trim())

            {
                string strcon = obBase.strDB;

                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    conn.Open();
                    SqlCommand cmd = null;
                    string Sqls = "SELECT * FROM Repair Where RNdate=@RNdate2";
                    cmd = new SqlCommand(Sqls, conn);
                    cmd.Parameters.AddWithValue("@RNdate2", TextBox3.Text.Trim());
                    DataSet ds = new DataSet();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                }
            }
        }
               
    }

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
}