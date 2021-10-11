using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;


namespace HealthCare_Portal
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }



        protected void Login_Click(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into UserData(FirstName,LastName,Email,Password,Date,Phone,Gender,Insurance) values(@firstname,@lastname,@email,@password,@date,@phone,@gender,@insurance) ", con);
                cmd.Parameters.AddWithValue("@firstname", TxtFirstName.Text);
                cmd.Parameters.AddWithValue("@lastname", TxtLastName.Text);
                cmd.Parameters.AddWithValue("@email", TxtEmailId.Text);
                cmd.Parameters.AddWithValue("@password", Txtpassword.Text);
                cmd.Parameters.AddWithValue("@date",DateTime.Parse( TxtDate.Text));
                cmd.Parameters.AddWithValue("@phone", TxtPhone.Text);
                cmd.Parameters.AddWithValue("@gender", RadioGender.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@insurance", DropDownInsurance.SelectedValue.ToString());
                cmd.ExecuteNonQuery();
                Response.Write("User Sucessfully Registered");
                
                con.Close();

            }
            catch (Exception ex)
            {

                Response.Write("Error: "+ex.ToString());
            } 
        }

       

        protected void TxtDate_TextChanged(object sender, EventArgs e)
        {
           
                DateTime dt;
            //    if (DateTime.TryParse(TxtDate.Text, out dt))
            if (DateTime.TryParseExact(TxtDate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dt))
            {
                LabelDateError.Visible = false;
                }
            else
            {
                LabelDateError.Visible = true;
                LabelDateError.Text = "Invalid date format";
            }

        }
    }
}