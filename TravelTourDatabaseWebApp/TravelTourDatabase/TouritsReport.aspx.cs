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
using TravelTourDatabaseWebApp.Reports;

namespace TravelTourDatabaseWebApp.TravelTourDatabase
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            //{
            //    using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tourists", con))
            //    {
            //        DataSet ds = new DataSet();
            //        da.Fill(ds, "touritsA");
            //        ds.Tables["touritsA"].Columns.Add(new DataColumn("img", typeof(System.Byte[])));
            //        for (var i = 0; i < ds.Tables["touritsA"].Rows.Count; i++)
            //        {
            //            string f = AppDomain.CurrentDomain.BaseDirectory + @"Uploads\" + ds.Tables["touritsA"].Rows[i]["touristpicture"].ToString();
            //            ds.Tables["touritsA"].Rows[i]["img"] = File.ReadAllBytes(Server.MapPath("~/Uploads/" + ds.Tables["touritsA"].Rows[i]["touristpicture"].ToString()));
            //        }

            //        TouristsRpt rpt = new TouristsRpt();
            //        rpt.SetDataSource(ds);
            //        this.CrystalReportViewer1.ReportSource = rpt;
            //        rpt.Refresh();
            //        this.CrystalReportViewer1.RefreshReport();
            //    }
            //}
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tourists", con))
                {
                    da.Fill(ds, "touritsA");
                    ds.Tables["touritsA"].Columns.Add(new DataColumn("img", typeof(System.Byte[])));
                    for (var i = 0; i < ds.Tables["touritsA"].Rows.Count; i++)
                    {
                        string f = AppDomain.CurrentDomain.BaseDirectory + @"Uploads\" + ds.Tables["touritsA"].Rows[i]["touristpicture"].ToString();
                        ds.Tables["touritsA"].Rows[i]["img"] = File.ReadAllBytes(Server.MapPath("~/Uploads/" + ds.Tables["touritsA"].Rows[i]["touristpicture"].ToString()));
                    }
                    TouristsRpt rpt = new TouristsRpt();
                    rpt.SetDataSource(ds);
                    CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}