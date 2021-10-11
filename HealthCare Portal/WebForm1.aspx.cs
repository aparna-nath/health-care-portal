using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using DayPilot.Web.Ui.Events;
using System.Data;
using DayPilot.Web.Ui.Events.Calendar;
using CommandEventArgs = DayPilot.Web.Ui.Events.CommandEventArgs;
using DayPilot.Web.Ui.Data;

namespace HealthCare_Portal
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DayPilotCalendar2.DataStartField = "eventstart";
                DayPilotCalendar2.DataEndField = "eventend";
                DayPilotCalendar2.DataTextField = "name";
                DayPilotCalendar2.DataIdField = "id";
                DayPilotCalendar2.StartDate = DayPilot.Utils.Week.FirstDayOfWeek(new DateTime(2018, 2, 4));
                DayPilotCalendar2.DataSource = dbGetEvents(DayPilotCalendar2.StartDate, DayPilotCalendar2.Days);
                DataBind();
            }
        }
        private DataTable dbGetEvents(DateTime start, int days)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT [id], [name], [eventstart], [eventend] FROM [event] WHERE NOT (([eventend] <= @start) OR ([eventstart] >= @end))", ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            da.SelectCommand.Parameters.AddWithValue("start", start);
            da.SelectCommand.Parameters.AddWithValue("end", start.AddDays(days));
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        protected void DayPilotCalendar2_EventMove(object sender, DayPilot.Web.Ui.Events.EventMoveEventArgs e)
        {
            dbUpdateEvent(e.Id, e.NewStart, e.NewEnd);
            DayPilotCalendar2.DataSource = dbGetEvents(DayPilotCalendar2.StartDate, DayPilotCalendar2.Days);
            DayPilotCalendar2.DataStartField = "eventstart";
            DayPilotCalendar2.DataEndField = "eventend";
            DayPilotCalendar2.DataTextField = "name";
            DayPilotCalendar2.DataIdField = "id";
            DayPilotCalendar2.DataBind();
            DayPilotCalendar2.Update();
        }
        private void dbUpdateEvent(string id, DateTime start, DateTime end)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE [event] SET [eventstart] = @start, [eventend] = @end WHERE [id] = @id", con);
                cmd.Parameters.AddWithValue("id", id);
                cmd.Parameters.AddWithValue("start", start);
                cmd.Parameters.AddWithValue("end", end);
                cmd.ExecuteNonQuery();
            }
        }
        protected void DayPilotCalendar2_OnBeforeEventRender(object sender, BeforeEventRenderEventArgs e)
        {
            string status = e.DataItem["name"].ToString();

            switch (status)
            {
                case "Free":
                    e.DurationBarColor = "green";
                    e.Html = "Available";
                    e.ToolTip = "Click to Request This Time Slot";
                    break;
                case "Waiting":
                    e.DurationBarColor = "orange";
                    e.Html = "Your appointment, waiting for confirmation";
                    break;
                case "Confirmed":
                    e.DurationBarColor = "#f41616";
                    e.Html = "Your appointment, confirmed";
                    break;
            }
        }

        protected void DayPilotCalendar2_EventClick(object sender, EventClickEventArgs e)
        {
            Label_eventId.Visible = true;
            Label_eventId.Text = "selected Event ID is: " + e.Id;
        }
    }
}