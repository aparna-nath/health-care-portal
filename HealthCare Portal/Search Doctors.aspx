<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search Doctors.aspx.cs" Inherits="HealthCare_Portal.Search_Doctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 25px;
        }
        .auto-style3 {
            height: 185px;
        }
    </style>
</head>
<body style="height: 520px; width: 1370px">
    <form id="form1" runat="server">
    <div style="height: 479px; width: 1306px">
    
        <table style="width:98%; height: 411px;">
            <tr>
                <td>
                    <asp:TextBox ID="txt_name" runat="server" Width="193px" ></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Search_Name" runat="server" Text="Search By Name" Width="231px" OnClick="Search_Name_Click" />
                </td>
                <td ></td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="dropdown_speciality" runat="server" style="text-align: justify">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="Serch_Speciality" runat="server" Text="Search By Speciality" OnClick="Serch_Speciality_Click" />
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label ID="lbl_Name" runat="server" Text="Label"></asp:Label>&nbsp;</td>
                <td class="auto-style3">
                    <asp:GridView ID="Search_display" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="Search_display_RowDataBound" OnSelectedIndexChanged="Search_display_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField SelectText="View Profile" ShowSelectButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td>
                   
                    
                </td>
                <td> <asp:GridView ID="Grid_Appointment" runat="server" CellPadding="4" OnRowDataBound="Grid_Appointment_RowDataBound" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Book Appointment" ShowSelectButton="True" />
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
                    </asp:GridView></td>
            </tr>

        </table>
    
    </div>
    </form>
</body>
</html>
