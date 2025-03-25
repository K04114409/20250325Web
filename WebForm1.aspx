<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WF0307.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <!-- 加入 ScriptManager 控制項來啟用 Callback 機制 -->
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        
        <div style="text-align: center; margin-top: 50px;">
            <h1>目前時間 (Callback)：</h1>

            <!-- 使用 UpdatePanel 來局部更新而不是整個頁面回傳 -->
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblTime" runat="server" Font-Size="XX-Large"></asp:Label>
                    <br />
                    <!-- Timer 控制項觸發更新，使用局部回傳 -->
                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" DeleteCommand="DELETE FROM [Order_head] WHERE [order_id] = @order_id" InsertCommand="INSERT INTO [Order_head] ([customer_id], [order_date], [employee_id], [finish_date]) VALUES (@customer_id, @order_date, @employee_id, @finish_date)" SelectCommand="SELECT * FROM [Order_head] WHERE ([order_id] = @order_id)" UpdateCommand="UPDATE [Order_head] SET [customer_id] = @customer_id, [order_date] = @order_date, [employee_id] = @employee_id, [finish_date] = @finish_date WHERE [order_id] = @order_id">
                <DeleteParameters>
                    <asp:Parameter Name="order_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="customer_id" Type="Int32" />
                    <asp:Parameter Name="order_date" Type="DateTime" />
                    <asp:Parameter Name="employee_id" Type="Int32" />
                    <asp:Parameter Name="finish_date" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="order_id" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="customer_id" Type="Int32" />
                    <asp:Parameter Name="order_date" Type="DateTime" />
                    <asp:Parameter Name="employee_id" Type="Int32" />
                    <asp:Parameter Name="finish_date" Type="DateTime" />
                    <asp:Parameter Name="order_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" SelectCommand="SELECT [customer_id], [Cname] FROM [customer]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" DeleteCommand="DELETE FROM [Order_body] WHERE [body_id] = @body_id" InsertCommand="INSERT INTO [Order_body] ([order_id], [product_id], [product_amount], [count_price]) VALUES (@order_id, @product_id, @product_amount, @count_price)" SelectCommand="SELECT * FROM [Order_body] WHERE ([order_id] = @order_id)" UpdateCommand="UPDATE [Order_body] SET [order_id] = @order_id, [product_id] = @product_id, [product_amount] = @product_amount, [count_price] = @count_price WHERE [body_id] = @body_id">
                <DeleteParameters>
                    <asp:Parameter Name="body_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="order_id" Type="Int32" />
                    <asp:Parameter Name="product_id" Type="Int32" />
                    <asp:Parameter Name="product_amount" Type="Int32" />
                    <asp:Parameter Name="count_price" Type="Double" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="order_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="order_id" Type="Int32" />
                    <asp:Parameter Name="product_id" Type="Int32" />
                    <asp:Parameter Name="product_amount" Type="Int32" />
                    <asp:Parameter Name="count_price" Type="Double" />
                    <asp:Parameter Name="body_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" DeleteCommand="DELETE FROM [product] WHERE [product_id] = @product_id" InsertCommand="INSERT INTO [product] ([product_id], [product_class], [product_item], [product_price]) VALUES (@product_id, @product_class, @product_item, @product_price)" SelectCommand="SELECT [product_id], [product_class], [product_item], [product_price] FROM [product]" UpdateCommand="UPDATE [product] SET [product_class] = @product_class, [product_item] = @product_item, [product_price] = @product_price WHERE [product_id] = @product_id">
                <DeleteParameters>
                    <asp:Parameter Name="product_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="product_id" Type="Int32" />
                    <asp:Parameter Name="product_class" Type="String" />
                    <asp:Parameter Name="product_item" Type="String" />
                    <asp:Parameter Name="product_price" Type="Double" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="product_class" Type="String" />
                    <asp:Parameter Name="product_item" Type="String" />
                    <asp:Parameter Name="product_price" Type="Double" />
                    <asp:Parameter Name="product_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Text="請輸入訂單編號:"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="order_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="order_id" HeaderText="order_id" InsertVisible="False" ReadOnly="True" SortExpression="order_id" />
                    <asp:TemplateField HeaderText="customer_id" SortExpression="customer_id">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Cname" DataValueField="customer_id" SelectedValue='<%# Bind("customer_id") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Cname" DataValueField="customer_id" Enabled="False" SelectedValue='<%# Bind("customer_id") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="order_date" HeaderText="order_date" SortExpression="order_date" />
                    <asp:BoundField DataField="employee_id" HeaderText="employee_id" SortExpression="employee_id" />
                    <asp:BoundField DataField="finish_date" HeaderText="finish_date" SortExpression="finish_date" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        <div class ="row">
            div 002
        <asp:TextBox ID="TextBox1" runat="server" Width="565px"></asp:TextBox>
        </div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="body_id" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="body_id" HeaderText="body_id" InsertVisible="False" ReadOnly="True" SortExpression="body_id" />
                <asp:BoundField DataField="order_id" HeaderText="order_id" SortExpression="order_id" />
                <asp:TemplateField HeaderText="product_id" SortExpression="product_id">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="product_item" DataValueField="product_id" SelectedValue='<%# Bind("product_id") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="product_item" DataValueField="product_id" Enabled="False" SelectedValue='<%# Bind("product_id") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="product_amount" HeaderText="product_amount" SortExpression="product_amount" />
                <asp:BoundField DataField="count_price" HeaderText="count_price" SortExpression="count_price" />
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
    </form>
</body>
</html>
