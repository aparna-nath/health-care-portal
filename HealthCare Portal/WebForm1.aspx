<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HealthCare_Portal.WebForm1" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/daypilot-modal-2.7.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label_eventId" runat="server"
                Style="font-size: xx-large; font-weight: 700" Text="Label"></asp:Label>
        </div>
        <div>
            <DayPilot:DayPilotCalendar ID="DayPilotCalendar2" runat="server"
                Days="7"
                OnEventMove="DayPilotCalendar2_EventMove"
                OnBeforeEventRender="DayPilotCalendar2_OnBeforeEventRender"
                OnEventCLick="DayPilotCalendar2_EventClick" 
                EventMoveHandling="CallBack" Style="top: 0px; left: 0px"
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
            modal.closed = function () { // callback executed after the dialog is closed
                if (this.result == "OK") {  // if the
                    dp.commandCallBack('refresh');
                }
            };
            modal.showUrl("Doctor Request.aspx?id=" + e.value());
        }

      
    </script>
</body>

</html>
