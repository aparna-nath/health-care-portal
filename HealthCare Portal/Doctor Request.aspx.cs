using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DayPilot.Web.Ui;
using Util;
using HealthCare_Portal.App_Code;

namespace HealthCare_Portal
{
    public partial class Doctor_Request : System.Web.UI.Page
    {
        private DataRow dr;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            dr = Db.LoadAppointment(Convert.ToInt32(Request.QueryString["id"]));

            if (dr == null)
            {
                throw new Exception("The slot was not found");
            }

            if (!IsPostBack)
            {

                TextBoxStart.Text = Convert.ToDateTime(dr["AppointmentStart"]).ToString();
                TextBoxEnd.Text = Convert.ToDateTime(dr["AppointmentEnd"]).ToString();
                TextBoxName.Text = Session["name"].ToString();

               // TextBoxName.Focus();
            }
        }

        protected void ButtonOK_Click(object sender, EventArgs e)
        {
            try
            {
                int AppointmentID = Convert.ToInt32(Request.QueryString["id"]);
                Db.RequestAppointment(AppointmentID, Convert.ToInt32(Session["userId"]), Convert.ToInt32(Session["doctorId"]) );
                
                Modal.Close(this, "OK");
                Response.Write("Appointment Requested");
               
            }
            catch(Exception ex)
            {
                Response.Write("Error:" + ex);
            }
            
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Modal.Close(this);
        }
    }
}