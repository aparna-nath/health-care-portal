<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor Request.aspx.cs" Inherits="HealthCare_Portal.Doctor_Request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/daypilot-modal-2.7.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="0" cellspacing="4" cellpadding="0">
                <tr>
                    <td align="right"></td>
                    <td>
                        <div class="header">Request an Appointment</div>
                    </td>
                </tr>
                <tr>
                    <td align="right">Start:</td>
                    <td>
                        <asp:TextBox ID="TextBoxStart" runat="server" Width="200px" Enabled="false"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">End:</td>
                    <td>
                        <asp:TextBox ID="TextBoxEnd" runat="server" Width="200px" Enabled="false"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">Your Name:</td>
                    <td>
                        <asp:TextBox ID="TextBoxName" runat="server" Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="ButtonOK" runat="server" Text="  OK  " OnClick="ButtonOK_Click" />
                        <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $("#TextBoxName").keyup(function () {
                var text = $(this).val();
                $("#CheckBoxScheduled").prop("checked", !!text);
            })
        });
    </script>
</body>
</html>
