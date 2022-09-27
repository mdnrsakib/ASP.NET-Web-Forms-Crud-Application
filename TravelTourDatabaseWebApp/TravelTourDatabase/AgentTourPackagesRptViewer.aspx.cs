using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelTourDatabaseWebApp.Reports;

namespace TravelTourDatabaseWebApp.TravelTourDatabase
{
    public partial class AgentTourPackagesRptViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM travelagents", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "travelagents");
                    da.SelectCommand.CommandText = "SELECT * FROM packagefeatures";
                    da.Fill(ds, "packagefeatures");
                    da.SelectCommand.CommandText = "SELECT * FROM tourpackages";
                    da.Fill(ds, "tourpackages");
                    da.SelectCommand.CommandText = "SELECT * FROM agenttourpackages";
                    da.Fill(ds, "agenttourpackages");
                    AgentTourPackagesRpt rpt = new AgentTourPackagesRpt();
                    rpt.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}