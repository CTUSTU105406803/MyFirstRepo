using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CM : System.Web.UI.Page
{
    Class1 obBase = new Class1();
    private void BindData()
    {
        string strcon = obBase.strDB;

        using (SqlConnection conn = new SqlConnection(strcon))
        {
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

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("View.aspx");
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

            string Sql = "UPDATE Repair SET Rclosed=@Rclosed,Rclass=@Rclass,Rpersonnel=@Rpersonnel,Rext=@Rext,RNdate=@RNdate,Rerror=@Rerror,Rhandler=@Rhandler,RPdate=@RPdate,Rcause=@Rcause,Rmethod=@Rmethod WHERE Rnumber=@Rnumber";
            cmd = new SqlCommand(Sql, conn);



            CheckBox cb = (CheckBox)GridView1.FindControl("CheckBox1");

            if (cb != null)
            {
                cb.Checked = true;
            }



            String RN = Convert.ToString(GridView1.Rows[e.RowIndex].Cells[0].Text);
            String Rcb = (GridView1.Rows[e.RowIndex].Cells[1].Controls[1] as CheckBox).Text.Trim();
            String RC = (GridView1.Rows[e.RowIndex].Cells[2].Controls[1] as TextBox).Text.Trim();
            String RPE = (GridView1.Rows[e.RowIndex].Cells[3].Controls[1] as TextBox).Text.Trim();
            String Rex = (GridView1.Rows[e.RowIndex].Cells[4].Controls[1] as TextBox).Text.Trim();
            String RND = (GridView1.Rows[e.RowIndex].Cells[5].Controls[1] as TextBox).Text.Trim();
            String Rer = (GridView1.Rows[e.RowIndex].Cells[6].Controls[1] as TextBox).Text.Trim();
            String RH = (GridView1.Rows[e.RowIndex].Cells[7].Controls[1] as TextBox).Text.Trim();
            String RPD = (GridView1.Rows[e.RowIndex].Cells[8].Controls[1] as TextBox).Text.Trim();
            String RCA = (GridView1.Rows[e.RowIndex].Cells[9].Controls[1] as TextBox).Text.Trim();
            String RME = (GridView1.Rows[e.RowIndex].Cells[10].Controls[1] as TextBox).Text.Trim();
            cmd.Parameters.AddWithValue("@Rnumber", RN);
            cmd.Parameters.AddWithValue("@Rclosed", Rcb);
            cmd.Parameters.AddWithValue("@Rclass", RC);
            cmd.Parameters.AddWithValue("@Rpersonnel", RPE);
            cmd.Parameters.AddWithValue("@Rext", Rex);
            cmd.Parameters.AddWithValue("@RNdate", RND);
            cmd.Parameters.AddWithValue("@Rerror", Rer);
            cmd.Parameters.AddWithValue("@Rhandler", RH);
            cmd.Parameters.AddWithValue("@RPdate", RPD);
            cmd.Parameters.AddWithValue("@Rcause", RCA);
            cmd.Parameters.AddWithValue("@Rmethod", RME);

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

            string sql = "DELETE FROM Repair WHERE Rnumber=@Rnumber";
            cmd = new SqlCommand(sql, conn);

            string RN = Convert.ToString(GridView1.Rows[e.RowIndex].Cells[0].Text);
            cmd.Parameters.AddWithValue("@Rnumber", RN);

            cmd.ExecuteNonQuery();
            BindData();
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {       
       
        //if (e.Row.RowState == DataControlRowState.Edit ||
        //            e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate))
        //{
        //    CheckBox cb2 = (CheckBox)e.Row.Cells[1].FindControl("CheckBox1");

        //    if (cb2.Text.Trim() == "結案")
        
        //    {               
        //        cb2.Checked = true;
        //    }

        //}
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        BindData();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add.aspx");
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
}