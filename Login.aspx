<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
<script type="text/javascript">

window.history.forward(1);

</script>  
    
   

</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg"></div>

            <div class="col-lg text-center ">        
                <asp:Label ID="Label1" runat="server" Text="-------登入系統-------" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="XX-Large" ForeColor="#003399"></asp:Label>
                    <br />
                    <br />
                    <br />
                <div class="form-group col-xs-12 col-xs-6">
                <label for="usr"><asp:Label ID="Label2" runat="server" Text="帳號 : " Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" ForeColor="#0099CC"></asp:Label></label>           
                <asp:TextBox ID="TextBox1" runat="server" class="form-control" BorderColor="#0099CC" ></asp:TextBox>
                </div>
                <div class="form-group col-xs-12 col-xs-6">
                <label for="pwd"><asp:Label ID="Label3" runat="server" Text="密碼 : " Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" ForeColor="#0099CC"></asp:Label></label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" class="form-control" BorderColor="#0099CC" ></asp:TextBox>
                </div>
                <br />
                <asp:Label ID="Label4" runat="server" Text="" ForeColor="#CC0000"></asp:Label>

                            <div class="row">
                                <div class="col-lg-6">
                                    <asp:Button ID="Button1" runat="server" Text="登入" OnClick="Button1_Click" type="button" class="btn btn-info btn-block"/>
                                    </div>                    
                                <div class="col-lg-6">
                                <asp:Button ID="Button2" runat="server" Text="清除" OnClick="Button2_Click" type="button" class="btn btn-outline-info btn-block"/>
                                </div>         
                                </div>

                        <div class="container-fluid">
                            </div>
                        </div>

            <div class="col-lg "></div>
            </div>
        </div>
    </form>
</body>
</html>
