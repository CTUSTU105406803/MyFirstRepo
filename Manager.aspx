<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script language="javascript" type="text/javascript">

window.history.forward(1);

</script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />    
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <title></title>
</head>
<body >
    <form id="form1" runat="server" class="form-inline" >
        <div class="text-center">
            <h1><asp:Label ID="Label1" runat="server" Text="----------管理者登入頁面----------"></asp:Label></h1>
            <br />
            <br />
            <h3><asp:Label ID="Label2" runat="server" Text="[[[新增]]]"></asp:Label></h3>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="課程代號 : "></asp:Label>
            <asp:TextBox ID="txtID" runat="server" class="form-control text-center" MaxLength="15" ></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="課程名稱 : "></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" class="form-control text-center" MaxLength="15" ></asp:TextBox>
            <br />
            <asp:Label ID="Label9" runat="server" Text="教師名稱 : "></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" class="form-control text-center" MaxLength="15" ></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="加入" class="btn btn-primary"  OnClick="Button1_Click" />
            <br />
            <br />
            <h3><asp:Label ID="Label5" runat="server" Text="[[[查詢]]]"></asp:Label></h3>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="課程代號或課程名稱 : "></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" class="form-control text-center" placeholder="Search" MaxLength="15"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="查詢" OnClick="Button2_Click"  class="btn btn-success" type="submit" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataKeyNames="ClassNumber" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Height="216px" Width="1133px">
                <Columns>
                    <asp:BoundField DataField="ClassNumber" HeaderText="課程代號" ReadOnly="True" />
                    <asp:TemplateField HeaderText="課程名稱">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%#Bind("ClassName")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%#Bind("ClassName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="授課教師">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%#Bind("CTeacher")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%#Bind("CTeacher")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" HeaderText="更新" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="刪除">
                        <ItemTemplate>
                            <asp:Button ID="Button5" runat="server" CommandName="Delete" Text="刪除" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="登出" OnClick="Button4_Click" class="btn btn-danger" />
        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
