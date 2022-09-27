using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelTourDatabaseWebApp.TravelTourDatabase
{
    public partial class TouristAllPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tourists", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "touristsV");
                    ds.Tables["touristsV"].Columns.Add(new DataColumn("img", typeof(System.Byte[])));
                    for (var i = 0; i < ds.Tables["touristsV"].Rows.Count; i++)
                    {
                        string f = AppDomain.CurrentDomain.BaseDirectory + @"Uploads\" + ds.Tables["touristsV"].Rows[i]["touristpicture"].ToString();
                        ds.Tables["touristsV"].Rows[i]["img"] = File.ReadAllBytes(Server.MapPath("~/Uploads/" + ds.Tables["touristsV"].Rows[i]["touristpicture"].ToString()));
                    }


                    da.SelectCommand.CommandText = "SELECT * FROM tourpackages";
                    da.Fill(ds, "tourpackages");

                    ReportDocument rpt = new ReportDocument();
                    rpt.Load(Server.MapPath("~/Reports/TouristAll.rpt"));
                    rpt.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}