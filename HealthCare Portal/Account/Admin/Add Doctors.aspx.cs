using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace HealthCare_Portal.Admin
{
    public partial class Add_Doctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // Dropdown_practice.Items.Clear();
                //Dropdown_practice.Items.Insert(0,new ListItem("--Select","--Select"));
                //Dropdown_practice.SelectedIndex = 0;
                for (int i = DateTime.Now.Year;i>=1960;i--)
                {
                    Dropdown_practice.Items.Add(i.ToString());
                }
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {


                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                con.Open();

                SqlCommand cmd = new SqlCommand("insert into Doctors(FirstName,LastName,PracticeYears) output inserted.DoctorId values (@fname,@lname,@years)", con);
                cmd.Parameters.AddWithValue("@fname", txt_firstname.Text);
                cmd.Parameters.AddWithValue("@lname", txt_lastname.Text);
                cmd.Parameters.AddWithValue("@years", Dropdown_practice.SelectedValue.ToString());
                int newId = (int)cmd.ExecuteScalar();


                int count = check_speciality.Items.Count;
                
                for (int i = 0; i < count; i++)
                {
                    if (check_speciality.Items[i].Selected == true)
                    {
                       string  value = check_speciality.Items[i].Value;
                        SqlCommand cmd2 = new SqlCommand("insert into Speciality(Speciality,DoctorId) values (@speciality,@docid)", con);
                        cmd2.Parameters.AddWithValue("@speciality",value);
                        cmd2.Parameters.AddWithValue("@docid", newId);
                        cmd2.ExecuteNonQuery();
                    }
                }
                    if (con.State == System.Data.ConnectionState.Open) con.Close();
                Response.Write("Successfully Registered");
            }

            // Add Multiple Data in a column seperated by ','
            /*  int count = check_speciality.Items.Count;
              string value = string.Empty;
              for (int i = 0; i < count; i++)
              {
                  if (check_speciality.Items[i].Selected==true)
                  {
                      //to insert values seperated by comma
                      //value += check_speciality.Items[i].Value + ",";
                      value = check_speciality.Items[i].Value;
                      SqlCommand cmd = new SqlCommand("insert into Doctors(FirstName,LastName,PracticeYears,Speciality) values (@fname,@lname,@years,@speciality)", con);
                      cmd.Parameters.AddWithValue("@fname", txt_firstname.Text);
                      cmd.Parameters.AddWithValue("@lname", txt_lastname.Text);
                      cmd.Parameters.AddWithValue("@years", Dropdown_practice.SelectedValue.ToString());
                      cmd.Parameters.AddWithValue("@speciality", value);
                      cmd.ExecuteNonQuery();
                  }

              }*/


            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }

        }
    }
}