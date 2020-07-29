using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Manager : System.Web.UI.Page
{
    private void BindData()
    {
        string strcon = @"Persist Security Info=False;Integrated Security=true;
                     Initial Catalog=exan;Server=.\SQLExpress";

        SqlConnection conn = new SqlConnection(strcon);
        SqlCommand cmd = null;

        conn.Open();
        string sSql2 = "select c.ClassNumber ,c.ClassName ,tea .CTeacher  from Class as c INNER JOIN ClassTeacher as tea on tea.ClassNumber = c.ClassNumber";
        cmd = new SqlCommand(sSql2, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        
        GridView1.DataSource = dr;
        GridView1.DataBind();

        conn.Close();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //if ((Session["User"] == null) || Session["User"].ToString().Trim().Equals(""))
        //{
        //    Response.Redirect("Login.aspx");
        //    return;
        //}

        if (!IsPostBack)
        {
            BindData();
            Session.Abandon();
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
                if (txtID.Text.Trim()==""|| TextBox2.Text.Trim() == ""||TextBox6.Text.Trim() == "") {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('資料為空，請輸入資料，謝謝');</script>");
                    return;
            
                }
        

                string strcon = @"Persist Security Info=False;Integrated Security=true;
                         Initial Catalog=exan;Server=.\SQLExpress";

                SqlConnection conn = new SqlConnection(strcon);
                SqlCommand cmd = null;
                conn.Open();

                string sSql = "Insert Into Class(ClassNumber, ClassName) Values(@TextBox1, @TextBox2)";
                sSql += " Insert Into ClassTeacher(ClassNumber, CTeacher) Values(@TextBox1, @TextBox6)";

                string TB1 = txtID.Text.Trim();
                string TB2 = TextBox2.Text.Trim();
                string TB6 = TextBox6.Text.Trim();
                cmd = new SqlCommand(sSql, conn);
                cmd.Parameters.AddWithValue("@TextBox1", TB1);
                cmd.Parameters.AddWithValue("@TextBox2", TB2);
                cmd.Parameters.AddWithValue("@TextBox6", TB6);
                cmd.ExecuteNonQuery();
                conn.Close();
                txtID.Text = "";
                TextBox2.Text = "";
                TextBox6.Text = "";
                BindData();       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string strcon = @"Persist Security Info=False;Integrated Security=true;
                     Initial Catalog=exan;Server=.\SQLExpress";

        SqlConnection conn = new SqlConnection(strcon);
        SqlCommand cmd = null;

        conn.Open();


        if (TextBox3.Text.Trim() == "")
        {
            string sSql2 = "select c.ClassNumber ,c.ClassName ,tea .CTeacher  from Class as c INNER JOIN ClassTeacher as tea on tea.ClassNumber = c.ClassNumber ";

            cmd = new SqlCommand(sSql2, conn);

            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();

        }
        else
        {            
            string sSql = "select c.ClassNumber ,c.ClassName ,tea.CTeacher from Class as c INNER JOIN ClassTeacher as tea on tea.ClassNumber = c.ClassNumber where c.ClassNumber=@TextBox3";
            
            string TB3 = TextBox3.Text.Trim();
            cmd = new SqlCommand(sSql, conn);
            cmd.Parameters.AddWithValue("@TextBox3", TB3);
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
        }

        conn.Close();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
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
        string strcon = @"Persist Security Info=False;Integrated Security=true;
                     Initial Catalog=exan;Server=.\SQLExpress";

        SqlConnection conn = new SqlConnection(strcon);
        SqlCommand cmd = null;

        conn.Open();

        String sql = "UPDATE Class SET ClassName=@ClassName WHERE ClassNumber=@ClassNumber";
               sql += " UPDATE ClassTeacher SET CTeacher=@CTeacher WHERE ClassNumber=@ClassNumber";
        cmd = new SqlCommand(sql, conn);
        int CN = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        String CNAME = (GridView1.Rows[e.RowIndex].Cells[1].Controls[1] as TextBox).Text.Trim();
        String CT = (GridView1.Rows[e.RowIndex].Cells[2].Controls[1] as TextBox).Text.Trim();
        cmd.Parameters.AddWithValue("@ClassNumber", CN);
        cmd.Parameters.AddWithValue("@ClassName", CNAME);
        cmd.Parameters.AddWithValue("@CTeacher", CT);

        cmd.ExecuteNonQuery();
        GridView1.EditIndex = -1;
        conn.Close();
        BindData();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strcon = @"Persist Security Info=False;Integrated Security=true;
                     Initial Catalog=exan;Server=.\SQLExpress";

        SqlConnection conn = new SqlConnection(strcon);
        SqlCommand cmd = null;
        conn.Open();

        string sql = "DELETE FROM Class WHERE ClassNumber=@ClassNumber";
               sql +=" DELETE FROM ClassTeacher WHERE ClassNumber=@ClassNumber";
        int CN = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        
        cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("@ClassNumber", CN);

        cmd.ExecuteNonQuery();
        conn.Close();
        BindData();
    }
   

}