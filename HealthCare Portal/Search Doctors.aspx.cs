using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HealthCare_Portal
{
    public partial class Search_Doctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lbl_Name.Visible = false;

                using (SqlConnection con= new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
                {
                    using (SqlCommand cmd=new SqlCommand("select distinct Speciality from Speciality"))
                    {
                        cmd.CommandType =CommandType.Text;
                        cmd.Connection = con;
                        using (SqlDataAdapter da=new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            dropdown_speciality.DataSource = ds.Tables[0];
                            dropdown_speciality.DataTextField = "Speciality";
                           // dropdown_speciality.DataValueField = "SpecialityId";
                            dropdown_speciality.DataBind();
                        }

                    }
                }
                dropdown_speciality.Items.Insert(0, new ListItem("--Select", "0"));
            }
        }

        protected void Serch_Speciality_Click(object sender, EventArgs e)
        {

            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("select Doctors.DoctorId,CONCAT(Doctors.FirstName,' ',Doctors.LastName) as Name,Speciality.Speciality from Doctors inner join Speciality on Speciality.DoctorId=Doctors.DoctorId where Speciality.Speciality='" + dropdown_speciality.SelectedItem.Text + "' "))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            Search_display.DataSource = ds.Tables[0];
                            Search_display.DataBind();


                        }
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write("Error: " + ex.ToString());
            }

        }
       
        protected void Search_Name_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
                {
                    // concatenate multiple row values seperated by comma with 'FOR XML PATH'

                    using (SqlCommand cmd = new SqlCommand("select d.DoctorId,CONCAT(d.FirstName,'  ',d.LastName) as Name," +
                        " STUFF((SELECT ',' + s.Speciality AS[text()] from Speciality s where s.DoctorId = d.DoctorId FOR XML PATH('')" +
        "), 1, 1, '') as Specialities  from Doctors d where d.FirstName='"+txt_name.Text+ "' OR d.LastName='" + txt_name.Text + "'  ") )
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            Search_display.DataSource = ds.Tables[0];
                            Search_display.DataBind();
                           
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write("Error: " + ex.ToString());
            }

        }

        protected void Search_display_SelectedIndexChanged(object sender, EventArgs e)
        {
            String name= Search_display.SelectedRow.Cells[1].Text;
            lbl_Name.Visible = true;
            lbl_Name.Text = name;
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("select d.DoctorId,Concat(d.Firstname,',',d.LastName)as Name,d.PracticeYears,s.Speciality from Doctors d "+
                        "inner join Speciality s on d.DoctorId=s.DoctorId  where d.DoctorId=@id "))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@id", lbl_Name.Text);
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            Grid_Appointment.DataSource = ds.Tables[0];
                            Grid_Appointment.DataBind();


                        }
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write("Error: " + ex.ToString());
            }


        }
        protected void Search_display_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;

        }
        protected void Grid_Appointment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["doctorId"] = lbl_Name.Text.ToString();
            Response.Redirect("Doctor's appointment.aspx");
        }
    }
}