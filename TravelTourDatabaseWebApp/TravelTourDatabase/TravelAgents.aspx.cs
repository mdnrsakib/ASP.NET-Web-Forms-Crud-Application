using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelTourDatabaseWebApp.TravelTourDatabase
{
    public partial class TravelAgents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvAgents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void gvAgents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
        }

        protected void gvAgents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int agentid = (int)e.Keys["agentid"];
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM travelagents WHERE agentid=@d", con))
                {
                    cmd.Parameters.AddWithValue("@d", agentid);
                    con.Open();
                    int n = (int)cmd.ExecuteScalar();
                    con.Close();
                    if (n > 0)
                    {
                        this.error.Visible = true;
                        e.Cancel = true;
                    }
                }
            }
        }
    }
}