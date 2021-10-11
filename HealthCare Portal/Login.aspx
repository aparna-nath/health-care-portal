<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HealthCare_Portal.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 443px; width: 1693px">
    <form id="form1" runat="server">
    <div style="height: 413px">
    
        <asp:Login ID="Login1" runat="server" Height="140px" OnAuthenticate="Login1_Authenticate" Width="448px">
        </asp:Login>
    
    </div>
    </form>
</body>
</html>
