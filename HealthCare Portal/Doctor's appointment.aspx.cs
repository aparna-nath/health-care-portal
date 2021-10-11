using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayPilot.Web.Ui;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using DayPilot.Web.Ui.Events.Calendar;
using CommandEventArgs = DayPilot.Web.Ui.Events.CommandEventArgs;

using DayPilot.Web.Ui.Events;

namespace HealthCare_Portal
{
    public partial class Doctor_s_appointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
               if (!IsPostBack)
                {
                 LoadAppointments();
                }
            }
        public void LoadAppointments()
        {
            string doctorId = Session["doctorId"].ToString();
            string  userId = Session["userId"].ToString();
            DayPilotCalendar1.DataStartField = "AppointmentStart";
            DayPilotCalendar1.DataEndField = "AppointmentEnd";
            DayPilotCalendar1.DataTextField = "AppointmentName";
            DayPilotCalendar1.DataIdField = "Appointmentid";

            DayPilotCalendar1.StartDate = DayPilot.Utils.Week.FirstDayOfWeek(new DateTime(2018, 3, 5));
            DayPilotCalendar1.DataSource = dbGetFreeAppointment(DayPilotCalendar1.StartDate, DayPilotCalendar1.EndDate, doctorId,userId);
            DataBind();
        }
        private DataTable dbGetFreeAppointment(DateTime start, DateTime end,string DoctorId,string uId )
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT [Appointmentid], [AppointmentName], [AppointmentStart], [AppointmentEnd],[AppointmentStatus] FROM [Appointments] WHERE ([AppointmentStatus]='free' AND [DoctorId]=@doctorId) or ([AppointmentStatus]<>'free' and [UserId]=@userId)", ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            da.SelectCommand.Parameters.AddWithValue("@start", start);
            da.SelectCommand.Parameters.AddWithValue("@end",end);
            da.SelectCommand.Parameters.AddWithValue("@doctorId", DoctorId);
            da.SelectCommand.Parameters.AddWithValue("@userId",uId);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
           
        protected void DayPilotCalendar1_OnBeforeEventRender(object sender, BeforeEventRenderEventArgs e)
        {
            string status = e.DataItem["AppointmentStatus"].ToString();

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
        protected void DayPilotCalendar1_OnCommand(object sender, CommandEventArgs e)
        {
            switch (e.Command)
            {
                case "navigate":
                    DayPilotCalendar1.StartDate = (DateTime)e.Data["day"];
                    LoadAppointments();
                    break;
                case "refresh":
                    LoadAppointments();
                    break;
            }

        }

        //protected void DayPilotCalendar1_EventMove(object sender, DayPilot.Web.Ui.Events.EventMoveEventArgs e)
        //{
        //    dbUpdateEvent(e.Id, e.NewStart, e.NewEnd);
        //    DayPilotCalendar1.DataSource = dbGetEvents(DayPilotCalendar1.StartDate, DayPilotCalendar1.Days);
        //    DayPilotCalendar1.DataStartField = "AppointmentStart";
        //    DayPilotCalendar1.DataEndField = "AppointmentEnd";
        //    DayPilotCalendar1.DataTextField = "AppointmentName";
        //    DayPilotCalendar1.DataIdField = "Appointmentid";
        //    DayPilotCalendar1.DataBind();
        //    DayPilotCalendar1.Update();
        //}
        //Click On Empty Cells
        // -------------------------
        //protected void DayPilotCalendar1_OnTimeRangeSelected(object sender, TimeRangeSelectedEventArgs e)
        //{
        //    string doctorId = Session["doctorId"].ToString();
        //    string userId = Session["userId"].ToString();
        //    Db.CreateAppointment(userId,doctorId, e.Start, e.End);
        //    DayPilotCalendar1.DataStartField = "AppointmentStart";
        //    DayPilotCalendar1.DataEndField = "AppointmentEnd";
        //    DayPilotCalendar1.DataTextField = "AppointmentName";
        //    DayPilotCalendar1.DataIdField = "Appointmentid";
        //    DayPilotCalendar1.DataSource = dbGetFreeAppointment(DayPilotCalendar1.StartDate, DayPilotCalendar1.EndDate, doctorId);
        //    DataBind();


        //}
        protected void Button_Search_Click(object sender, EventArgs e)
        {

        }
    }
}