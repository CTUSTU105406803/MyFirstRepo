<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CM.aspx.cs" Inherits="CM" %>

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
                     <h1 class="font-weight-bold text-center">e 化 教 室 報 修 處 理 系 統 <br /> ___ 後 台 管 理 ___</h1>
                        </div>
                    </div>
                </div>         
             </div>
            </div>

              <div class="container-fluid">
                <div class="jumbotron bg-dark">
                    <div class="row">                                
                        <div class="col-sm-4"> 
                            <div class="row " >
                            <br />                                
                            <h5><asp:Label ID="Label11" runat="server" Text="選擇通報日期 : " CssClass="text-white"></asp:Label></h5>                                                 
                            <div class="input-group">
                                <div class="col-xs-3">
                                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Date" class="form-control" placeholder=".col-xs-3"></asp:TextBox>
                                </div>
                                &nbsp;&nbsp;
                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="查詢" class="btn btn-secondary" />
                              </div>                         
                            </div>
                            </div>                                
                            <div class="col-sm-4">  </div>
                            <div class="col-sm-4">
                            <br />

                            <div class="row">
                            <div class="col-lg-6">
                            <br />
                            <asp:Button ID="Button3" runat="server" Text="登出" type="button" class="btn btn-secondary btn-block btn-lg" OnClick="Button3_Click" />
                            </div>
                            <br />
                            <div class="col-lg-6">
                            <br />
                            <asp:Button ID="Button2" runat="server" Text="新增修報" type="button" class="btn btn-secondary btn-block btn-lg " OnClick="Button2_Click" />
                            </div>       
                            </div>
                            </div>                                     
                            

                        <div class="row">
                            <div class="col-sm">
                             <br />                  
                          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" CssClass="text-center" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                              <AlternatingRowStyle BackColor="White" />
                              <Columns>
                                  <asp:BoundField DataField="Rnumber" HeaderText="序列號" ReadOnly="True" />
                                  <asp:TemplateField HeaderText="結案狀態">
                                      <EditItemTemplate>
                                          <asp:CheckBox ID="CheckBox1" runat="server" Text='結案' Width="56px" />
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label10" runat="server" Text='<%# Bind("Rclosed") %>' Width="56px"></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="教室">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("Rclass")%>' Columns="3" MaxLength="3"></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Rclass") %>' Width="56px"></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="通報人員">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox5" runat="server" Text='<%#Bind("Rpersonnel")%>' Columns="8" MaxLength="16"></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label5" runat="server" Text='<%#Bind("Rpersonnel")%>' Width="120px"></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="分機">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox2" runat="server" Text='<%#Bind("Rext")%>' Columns="4" MaxLength="4"></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label2" runat="server" Text='<%# Bind("Rext") %>' Width="56px"></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="通報日期">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox3" runat="server" Text='<%#Bind("RNdate","{0:yyyy-MM-dd}")%>' TextMode="Date" Columns="10" MaxLength="15"></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label3" runat="server" Text='<%# Bind("RNdate","{0:yyyy-MM-dd}") %>' Width="90px" ></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="異常狀況描述">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox4" runat="server" Text='<%#Bind("Rerror")%>' Columns="10" MaxLength="100" Height="100px" TextMode="MultiLine"></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label4" runat="server" Text='<%#Bind("Rerror")%>' style="word-break:break-all;word-wrap:break-word"></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="處理人員">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox6" runat="server" Text='<%#Bind("Rhandler")%>' Columns="8" MaxLength="16"></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label6" runat="server" Text='<%#Bind("Rhandler")%>' Width="120px"></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="處理日期">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox7" runat="server" Text='<%#Bind("RPdate","{0:yyyy-MM-dd}")%>' TextMode="Date" Columns="10" MaxLength="15"></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label7" runat="server" Text='<%# Bind("RPdate","{0:yyyy-MM-dd}") %>' Width="90px" ></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="故障原因">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox8" runat="server" Text='<%#Bind("Rcause")%>' Columns="10" MaxLength="100" Height="100px" TextMode="MultiLine"></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label8" runat="server" Text='<%#Bind("Rcause")%>' style="word-break:break-all;word-wrap:break-word"></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="處理方式">
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox9" runat="server" Text='<%#Bind("Rmethod")%>' Columns="10" MaxLength="100" Height="100px" TextMode="MultiLine"></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                          <asp:Label ID="Label9" runat="server" Text='<%#Bind("Rmethod")%>' style="word-break:break-all;word-wrap:break-word"></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:CommandField ButtonType="Button" HeaderText="編輯" ShowEditButton="True" />

                                  <asp:TemplateField HeaderText="刪除">
                                      <ItemTemplate>
                                          <asp:Button ID="Button4" runat="server" Text="刪除" CommandName="Delete" />
                                      </ItemTemplate>
                                  </asp:TemplateField>

                              </Columns>
                              <FooterStyle BackColor="#CCCC99" />
                              <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                              <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                              <RowStyle BackColor="#F7F7DE" />
                              <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                              <SortedAscendingCellStyle BackColor="#FBFBF2" />
                              <SortedAscendingHeaderStyle BackColor="#848384" />
                              <SortedDescendingCellStyle BackColor="#EAEAD3" />
                              <SortedDescendingHeaderStyle BackColor="#575357" />
                          </asp:GridView>
                            </div>  
                         </div>
                    </div>
                </div>
           </div>  
        </div>  
    </form>
</body>
</html>
