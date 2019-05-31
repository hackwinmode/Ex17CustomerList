<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 17: Customer List</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
        <asp:DropDownList ID="ddlStates" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="StateName" 
            DataValueField="StateCode">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString2 %>" SelectCommand="SELECT [StateCode], [StateName] FROM [States]"></asp:SqlDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllStates" 
            TypeName="CustomerDB"></asp:ObjectDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" 
            AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName">
                </asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName">
                </asp:BoundField>
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString2 %>" SelectCommand="SELECT [LastName], [FirstName], [PhoneNumber] FROM [Customers] WHERE ([State] = @State)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlStates" DefaultValue="1" Name="State" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetCustomersByState" TypeName="CustomerDB">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlStates" Name="state" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
    </section>
</body>
</html>
