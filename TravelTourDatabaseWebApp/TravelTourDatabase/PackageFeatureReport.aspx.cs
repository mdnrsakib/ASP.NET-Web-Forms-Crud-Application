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
    public partial class PackageFeatureReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("Select * from tourpackages", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "tourpackages");
                    da.SelectCommand.CommandText = "select * from packagefeatures";
                    da.Fill(ds, "packagefeatures");
                    PckageFeaturerpt rpt = new PckageFeaturerpt();
                    rpt.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}