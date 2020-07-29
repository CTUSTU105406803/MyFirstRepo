using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
//using System.Globalization;

public partial class Add : System.Web.UI.Page
{
    Class1 obBase = new Class1();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            TextBox6.Text += DateTime.Now.ToString("yyyyMMdd(HHmm)");
            TextBox2.Text += Session["Name"];
            Session.Abandon();
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("View.aspx");
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox6.Text.Trim() == "" ||DropDownList1.Text == "" || TextBox2.Text.Trim() == "" || TextBox3.Text.Trim() == "" || TextBox4.Text.Trim() == "" || DropDownList2.Text == "其它" && TextBox5.Text.Trim() == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('資料為空，請輸入資料，謝謝');</script>");
            return;

        }


        string strcon = obBase.strDB;

        using (SqlConnection conn = new SqlConnection(strcon))
        {
            conn.Open();
            SqlCommand cmd = null;
            string sSql = "Insert Into Repair(Rnumber,Rclass,Rpersonnel,Rext,RNdate,Rerror) Values(@TextBox6,@DropDownList1,@TextBox2, @TextBox3,@TextBox4,@DropDownList2)";

            string TB6 = TextBox6.Text;
            string TD1 = DropDownList1.Text;
            string TB2 = TextBox2.Text.Trim();
            string TB3 = TextBox3.Text.Trim();
            string TB4 = TextBox4.Text.Trim();
            string TD2 = DropDownList2.Text;
            string TB5 = TextBox5.Text.Trim();

            cmd = new SqlCommand(sSql, conn);

            cmd.Parameters.AddWithValue("@TextBox6", TB6);
            cmd.Parameters.AddWithValue("@DropDownList1", TD1);
            cmd.Parameters.AddWithValue("@TextBox2", TB2);
            cmd.Parameters.AddWithValue("@TextBox3", TB3);
            cmd.Parameters.AddWithValue("@TextBox4", TB4);
            
            if (DropDownList2.Text == "其它")
            {
                cmd.Parameters.AddWithValue("@DropDownList2", TB5);
            }
            else
            {
                cmd.Parameters.AddWithValue("@DropDownList2", TD2);
            }
            

            cmd.ExecuteNonQuery();

            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('新增資料成功，按<查詢>鈕查看');</script>");

            TextBox6.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";

        }
    }

}