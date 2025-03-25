<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WF0307.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>員工資料新增</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container py-5">
            <div class="card shadow p-4">
                <h1 class="mb-4">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" SelectCommand="SELECT [emptitle_001], [emptitle_002] FROM [EmpTitle]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" DeleteCommand="DELETE FROM [Employee] WHERE [emp001] = @emp001" InsertCommand="INSERT INTO [Employee] ([emp002], [emp003], [emp004], [emp005], [emp006], [emp008], [emp009]) VALUES (@emp002, @emp003, @emp004, @emp005, @emp006, @emp008, @emp009)" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [emp002] = @emp002, [emp003] = @emp003, [emp004] = @emp004, [emp005] = @emp005, [emp006] = @emp006, [emp008] = @emp008, [emp009] = @emp009 WHERE [emp001] = @emp001">
                        <DeleteParameters>
                            <asp:Parameter Name="emp001" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="emp002" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TextBox2" Name="emp003" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="DropDownList1" Name="emp004" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="TextBox3" Name="emp005" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="DropDownList4" Name="emp006" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="TextBox4" Name="emp008" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="DropDownList5" Name="emp009" PropertyName="SelectedValue" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="emp002" Type="String" />
                            <asp:Parameter Name="emp003" Type="String" />
                            <asp:Parameter Name="emp004" Type="String" />
                            <asp:Parameter Name="emp005" Type="DateTime" />
                            <asp:Parameter Name="emp006" Type="String" />
                            <asp:Parameter Name="emp007" Type="Object" />
                            <asp:Parameter Name="emp008" Type="String" />
                            <asp:Parameter Name="emp009" Type="Int32" />
                            <asp:Parameter Name="emp001" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </h1>
                <h1 class="mb-4">新增員工資料</h1>
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="TextBox1" class="form-label">姓名</label>
                            <input type="text" class="form-control" id="TextBox1" name="TextBox1" runat="server" required>
                        </div>
                        <div class="mb-3">
                            <label for="TextBox2" class="form-label">身份證字號</label>
                            <input type="text" class="form-control" id="TextBox2" name="TextBox2" runat="server" required>
                        </div>
                        <div class="mb-3">
                            <label for="TextBox3" class="form-label">生日</label>
                            <input type="date" class="form-control" id="TextBox3" name="TextBox3" runat="server" required>
                        </div>
                        <div class="mb-3">
                            <label for="DropDownList1" class="form-label">性別</label>
                            性別：<asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="DropDownList2" class="form-label">職稱</label>&nbsp;
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="emptitle_002" DataValueField="emptitle_001">
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="TextBox4" class="form-label">地址</label>
                            <input type="text" class="form-control" id="TextBox4" name="TextBox4" runat="server" style="width: 100%;">
                        </div>
                        <div class="mb-3">
                            <label for="DropDownList3" class="form-label">上級主管</label>&nbsp;
                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="emp002" DataValueField="emp001">
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="FileUpload1" class="form-label">上傳照片</label>
                            <input type="file" class="form-control" id="FileUpload1" name="FileUpload1" runat="server">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" name="Button3">確定上傳</button>
                <button type="submit" class="btn btn-secondary" name="Button4">顯示照片</button>
                <button type="submit" class="btn btn-info" name="Button5">下傳照片</button>
                <div class="text-center mt-4">
                    <asp:Button ID="Button1" runat="server" Text="存檔" CssClass="btn btn-success btn-lg" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>