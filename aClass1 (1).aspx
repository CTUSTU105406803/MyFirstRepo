<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gview.aspx.cs" Inherits="test2.Gview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="no" HeaderText="課程編號" />
                    <asp:BoundField DataField="class" HeaderText="班級" />
                    <asp:BoundField DataField="teacher" HeaderText="授課教師" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" Text="登出" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
</body>
</html>
