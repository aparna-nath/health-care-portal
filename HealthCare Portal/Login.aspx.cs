using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace HealthCare_Portal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
       {
           try
            {
                
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
                {
                    using (SqlCommand cmd1 = new SqlCommand("select Id,concat(FirstName,' ', LastName) as Name from UserData where Email=@emailid and Password=@password", con))
                    {

                        cmd1.CommandType = CommandType.Text;
                        cmd1.Connection = con;
                        cmd1.Parameters.AddWithValue("@emailid", Login1.UserName);
                        cmd1.Parameters.AddWithValue("@password", Login1.Password);
                        con.Open();

                        SqlDataReader dr = cmd1.ExecuteReader();
                        if(dr.Read())
                        {
                            string result = dr[1].ToString();
                            Session["name"] = result;
                            Session["userId"] = dr[0].ToString();
                            Response.Redirect("Default.aspx");
                        }
                        else
                        {
                            Login1.FailureText = "User name or Password Doesn't Match";
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write("Error " + ex.ToString());
            }



        }
    }
}