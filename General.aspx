<%@ Page Language="C#" AutoEventWireup="true" CodeFile="General.aspx.cs" Inherits="General" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript">

window.history.forward(1);

</script>  
    <link href="Content/bootstrap.min.css" rel="stylesheet" />    
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="text-center">
            <h1><asp:Label ID="Label1" runat="server" Text="------一般使用者查詢------"></asp:Label></h1>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="1135px">
                <Columns>
                    <asp:BoundField HeaderText="課程代號" DataField="ClassNumber" />
                    <asp:BoundField HeaderText="課程名稱" DataField="ClassName" />
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
            <asp:Button ID="Button2" runat="server" Text="登出" OnClick="Button2_Click" class="btn btn-danger" />
        </div>
    </form>
</body>
</html>
