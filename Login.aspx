<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
<script type="text/javascript">

window.history.forward(1);

</script>  
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm"></div>

                        <div class="col-sm bg-dark text-center form-group ">
                            <br />                            
                        <img class="img-fluid bg-white" src="Images/ctu.png" />
                            <br />
                            <br />                            
                        <h2 class="font-weight-bold text-info">e化教室報修處理系統</h2>                           
                            <br /> 
                        <asp:TextBox ID="TextBox1" runat="server" Class="form-control form-control-lg" placeholder="帳號 : " MaxLength="10"></asp:TextBox>
                            <br />
                        <asp:TextBox ID="TextBox2" runat="server" Class="form-control form-control-lg" placeholder="密碼 : " MaxLength="10" TextMode="Password"></asp:TextBox>
                            <br />    
<%--                                <div class=" alert alert-danger alert-dismissible fade show ">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <strong>登入失敗</strong><p>請輸入正確的帳號密碼</p>
                                </div>--%>
                            
                            <div class="container">
                              <div class="row">
                                <div class="col-md-6">
                                  <asp:Button ID="Button1" runat="server" Text="登入" type="button" class="btn btn-info btn-block" OnClick="Button1_Click"/>
                                </div>
                                <div class="col-md-6">
                                  <asp:Button ID="Button2" runat="server" Text="清除" type="button" class="btn btn-outline-info btn-block" OnClick="Button2_Click"/>
                                </div>
                              </div>
                            </div>
                           <br />  
                        </div>

                    <div class="col-sm"></div>
                </div>  
            </div>
        </div>
    </form>
</body>
</html>
