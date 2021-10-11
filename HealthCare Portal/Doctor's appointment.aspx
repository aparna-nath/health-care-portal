<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor's appointment.aspx.cs" Inherits="HealthCare_Portal.Doctor_s_appointment" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }

        .auto-style2 {
            height: 33px;
        }
    </style>
    <script type="text/javascript" src="js/daypilot-modal-2.7.js"> 

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Doctor"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button_Search" runat="server" Text="Search Available Appointment" OnClick="Button_Search_Click" /></td>
                    <td class="auto-style2"></td>

                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:Label ID="Label_AptId" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div>
            <DayPilot:DayPilotCalendar ID="DayPilotCalendar1" runat="server" BusinessEndsHour="17" Days="7"
                               
                OnBeforeEventRender="DayPilotCalendar1_OnBeforeEventRender"
                Style="top: 0px; left: 0px"
                EventClickHandling="JavaScript"
                EventClickJavaScript="editEvent(e);" ClientObjectName="dp" />
        </div>

    </form>
     <script type="text/javascript">
         function editEvent(e) {
             var modal = new DayPilot.Modal();
             modal.top = 60; // position of the dialog top (y), relative to the visible area
             modal.width = 300; // width of the dialog
             modal.height = 250; // height of the dialog
             modal.opacity = 70; // opacity of the background
             modal.border = "10px solid #d0d0d0";  // dialog box border
             modal.closed = function (args) { // callback executed after the dialog is closed
                 if (args.result == "OK") {  // if the
                     dp.commandCallBack('refresh');
                 }
             };
             modal.showUrl("Doctor Request.aspx?id=" + e.value());
         }
</script>
    /*

    */

</body>

   
</html>
