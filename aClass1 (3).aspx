<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mview.aspx.cs" Inherits="test2.Mview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="管理者頁面"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="新增"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="課程編號："></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="班級："></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="授課教師："></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="新增" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="查詢"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="課程編號："></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="查詢" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="no" HeaderText="課程編號" ReadOnly="True" />
                    <asp:TemplateField HeaderText="班級">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%#Bind("class") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%#Bind("class") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="授課教師">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%#Bind("teacher") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%#Bind("teacher") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" HeaderText="修改" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="刪除">
                        <ItemTemplate>
                            <asp:Button ID="Button3" runat="server" Text="刪除" CommandName="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
