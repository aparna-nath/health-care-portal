using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HealthCare_Portal.App_Code
{
    public static class Db
    {
        public static DataRow LoadAppointment(int id)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [Appointments] WHERE [AppointmentId] = @id", ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            da.SelectCommand.Parameters.AddWithValue("@id", id);

            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }
            return null;

        }
        public static void RequestAppointment(int Aptid, int userId, int doctor)
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update  [Appointments] SET [UserId]=@userId, [DoctorId]=@doctor,  [AppointmentStatus]=@status where [AppointmentId]=@id", con);
                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.Parameters.AddWithValue("@doctor", doctor);
                cmd.Parameters.AddWithValue("@status", "Waiting");
                cmd.Parameters.AddWithValue("@id", Aptid);
                cmd.ExecuteNonQuery();
            }
        }
        private static DataTable dbGetEvents(DateTime start, int days)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT [Appointmentid], [AppointmentName], [AppointmentStart], [AppointmentEnd] FROM [Appointments] WHERE NOT (([AppointmentEnd] <= @start) OR ([AppointmentStart] >= @end))", ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            da.SelectCommand.Parameters.AddWithValue("start", start);
            da.SelectCommand.Parameters.AddWithValue("end", start.AddDays(days));
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public static void CreateAppointment(string userId, string doctor, DateTime start, DateTime end)
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO [Appointments] ([UserId],[DoctorId],[AppointmentStart],[AppointmentEnd]) VALUES(@userId,@doctor, @start, @end)", con);
                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.Parameters.AddWithValue("@doctor", doctor);
                cmd.Parameters.AddWithValue("@start", start);
                cmd.Parameters.AddWithValue("@end", end);
                cmd.ExecuteNonQuery();

            }
        }
    }
}