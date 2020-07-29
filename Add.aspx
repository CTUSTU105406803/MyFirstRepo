<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"/>
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
        <div>
            <div class="container-fluid ">
                <div class="row">               
                    <div class="col-lg-4">
                        <div class="jumbotron bg-white">
                            <div class="row">
                                <img class="img-fluid" src="Images/ctu.png" />                    
                            </div>
                        </div>
                   </div>
                    <div class="col-lg-8">
                        <div class="jumbotron bg-white">
                            <h1 class="font-weight-bold text-center"> e 化 教 室 報 修 處 理 系 統 <br /> ___ 新 增 報 修 ___</h1>
                        </div>
                    </div>
                </div>         
             </div>
            </div>

            <div class="container-fluid">
                <div class="jumbotron bg-secondary">
                    <div class="row">                                
                        <div class="col-sm-4">
                            <h2 class="bg-dark text-white font-weight-bold text-center">新增一筆資料</h2>
                        </div>                                
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4">                            
                            <div class="row">
                            <div class="col-lg">                           
                            <asp:Button ID="Button3" runat="server" Text="查詢" type="button" class="btn btn-info btn-block btn-lg" OnClick="Button3_Click" />
                            </div>
                            <br />    
                            </div>
                        </div>                                                                
                      </div>
                        <br />
                        <br />
                        <br />
                      <div class="row">
                       <div class="col-sm-4">
                           <div>
                           <h5><asp:Label ID="Label7" runat="server" class="bg-dark text-white font-weight-bold text-center" Text="序 列 號 : "></asp:Label></h5>
                           <asp:TextBox ID="TextBox6" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                           </div>
                           <br />
                           <div>
                           <h5><asp:Label ID="Label2" runat="server" class="bg-dark text-white font-weight-bold text-center" Text="通報人員 : "></asp:Label></h5>
                           <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                           </div>
                       </div>

                       <div class="col-sm-4">
                           <div>
                            <h5><asp:Label ID="Label1" runat="server" class="bg-dark text-white font-weight-bold text-center" Text=" 教 室 : "></asp:Label></h5>
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>101</asp:ListItem>
                                <asp:ListItem>102</asp:ListItem>
                                <asp:ListItem>103</asp:ListItem>
                                <asp:ListItem>104</asp:ListItem>
                                <asp:ListItem>105</asp:ListItem>
                                <asp:ListItem>106</asp:ListItem>
                                <asp:ListItem>107</asp:ListItem>
                                <asp:ListItem>108</asp:ListItem>
                                <asp:ListItem>109</asp:ListItem>
                                <asp:ListItem>110</asp:ListItem>
                                <asp:ListItem>114</asp:ListItem>
                                <asp:ListItem>203</asp:ListItem>
                                <asp:ListItem>204</asp:ListItem>
                                <asp:ListItem>205</asp:ListItem>
                                <asp:ListItem>206</asp:ListItem>
                                <asp:ListItem>207</asp:ListItem>
                                <asp:ListItem>208</asp:ListItem>
                                <asp:ListItem>209</asp:ListItem>
                                <asp:ListItem>210</asp:ListItem>
                                <asp:ListItem>211</asp:ListItem>
                                <asp:ListItem>212</asp:ListItem>
                                <asp:ListItem>213</asp:ListItem>
                                <asp:ListItem>214</asp:ListItem>
                                <asp:ListItem>303</asp:ListItem>
                                <asp:ListItem>304</asp:ListItem>
                                <asp:ListItem>305</asp:ListItem>
                                <asp:ListItem>306</asp:ListItem>
                                <asp:ListItem>307</asp:ListItem>
                                <asp:ListItem>308</asp:ListItem>
                                <asp:ListItem>309</asp:ListItem>
                                <asp:ListItem>310</asp:ListItem>
                                <asp:ListItem>311</asp:ListItem>
                                <asp:ListItem>312</asp:ListItem>
                                <asp:ListItem>401</asp:ListItem>
                                <asp:ListItem>402</asp:ListItem>
                                <asp:ListItem>403</asp:ListItem>
                                <asp:ListItem>404</asp:ListItem>
                                <asp:ListItem>405</asp:ListItem>
                                <asp:ListItem>406</asp:ListItem>
                                <asp:ListItem>407</asp:ListItem>
                                <asp:ListItem>408</asp:ListItem>
                                <asp:ListItem>409</asp:ListItem>
                                <asp:ListItem>410</asp:ListItem>
                                <asp:ListItem>411</asp:ListItem>
                                <asp:ListItem>412</asp:ListItem>
                                <asp:ListItem>413</asp:ListItem>
                            </asp:DropDownList>                        
                           </div>
                           <br />
                           <div>
                            <h5><asp:Label ID="Label3" runat="server" class="bg-dark text-white font-weight-bold text-center" Text="分 機 : "></asp:Label></h5>
                            <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                           </div>
                           <br />
                           <div>
                            <h5><asp:Label ID="Label4" runat="server" class="bg-dark text-white font-weight-bold text-center" Text="通報日期 : "></asp:Label></h5>
                            <asp:TextBox ID="TextBox4" runat="server" TextMode="Date" class="form-control" ></asp:TextBox>
                           </div>
                       </div>

                        <div class="col-sm-4">
                            <div>
                        <h5><asp:Label ID="Label5" runat="server" class="bg-dark text-white font-weight-bold text-center" Text="異常狀況描述 : "></asp:Label></h5>
                        <asp:DropDownList ID="DropDownList2" runat="server" class="form-control">
                            <asp:ListItem>其它</asp:ListItem>
                            <asp:ListItem>布幕汙濁</asp:ListItem>
                            <asp:ListItem>布幕故障</asp:ListItem>
                            <asp:ListItem>網路線遺失</asp:ListItem>
                            <asp:ListItem>音源線遺失</asp:ListItem>
                            <asp:ListItem>VGA線遺失</asp:ListItem>
                            <asp:ListItem>e化講桌有線網路不通-請網路組檢修</asp:ListItem>
                            <asp:ListItem>e化講桌故障有線網路不通-請網路組檢修</asp:ListItem>
                            <asp:ListItem>網路不通-無法連結認證主機-請網路組檢修</asp:ListItem>
                            <asp:ListItem>滑鼠故障-請廠商檢修</asp:ListItem>
                            <asp:ListItem>鍵盤故障-請廠商檢修</asp:ListItem>
                            <asp:ListItem>麥克風沒有聲音-請廠商檢修</asp:ListItem>
                            <asp:ListItem>麥克風喇叭有雜音-請廠商檢修</asp:ListItem>
                            <asp:ListItem>播放cd喇叭有雜音-請廠商檢修</asp:ListItem>
                            <asp:ListItem>USB插座無法讀取-請廠商檢修</asp:ListItem>
                            <asp:ListItem>投影機不能開機-請廠商檢修</asp:ListItem>
                            <asp:ListItem>投影機畫面不清楚-請廠商檢修</asp:ListItem>
                            <asp:ListItem>電腦沒有聲音-請廠商檢修</asp:ListItem>
                            <asp:ListItem>電腦無法開機-請廠商檢修</asp:ListItem>
                            <asp:ListItem>電腦開機沒有螢幕訊號-請廠商檢修</asp:ListItem>
                        </asp:DropDownList>
                            </div>
                            <br />
                            <h5><asp:Label ID="Label6" runat="server" class="bg-dark text-white font-weight-bold text-center" Text="其它異常狀況描述 : "></asp:Label></h5>
                            <asp:TextBox ID="TextBox5" runat="server" class="form-control" rows="5" TextMode="MultiLine"></asp:TextBox>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <div>
                            <asp:Button ID="Button1" runat="server" Text="新增" OnClick="Button1_Click" class="btn btn-info btn-block btn-lg" />
                            </div>
                        </div> 
                      </div>
                    </div> 
                </div>
           </div>         
        
    </form>
</body>
</html>
