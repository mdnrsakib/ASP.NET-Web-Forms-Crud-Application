using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace TravelTourDatabaseWebApp.BLL
{
    public class PackageFetauresManager
    {
        SqlConnection con;
        public PackageFetauresManager()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        }
        public ICollection<PackageFetauresDTO> GetAll()
        {
            List<PackageFetauresDTO> packageFetaures = new List<PackageFetauresDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM packagefeatures", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    packageFetaures.Add(new PackageFetauresDTO
                    {
                        FeatureId = r.Field<int>("featureid"),
                        TransportMode = r.Field<string>("transportmode"),
                        HotelBooking = r.Field<string>("hotelbooking"),
                        Status = r.Field<bool>("status"),
                        PackageId = r.Field<int>("packageid")
                    });
                }
                return packageFetaures;
            }
        }
        public void Insert(PackageFetauresDTO dto)
        {
            string sql = @"INSERT INTO [dbo].[packagefeatures]
           ([transportmode]
           ,[hotelbooking]
           ,[status]
           ,[packageid])
     VALUES
           (@transportmode
           ,@hotelbooking
           ,@status
           ,@packageid)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@transportmode", dto.TransportMode);
                cmd.Parameters.AddWithValue("@hotelbooking", dto.HotelBooking);
                cmd.Parameters.AddWithValue("@status", dto.Status);
                cmd.Parameters.AddWithValue("@packageid", dto.PackageId);   
                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }
        }
        public void Update(PackageFetauresDTO dto) 
        {
            {
                string CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string updateQuery = "Update packagefeatures SET transportmode = @transportmode,  " +
                        "hotelbooking = @hotelbooking, status = @status,packageid = @packageid WHERE featureid = @featureid";
                    SqlCommand cmd = new SqlCommand(updateQuery, con);
                    SqlParameter paramOriginalfeatureid = new
                        SqlParameter("@featureid", dto.FeatureId);
                    cmd.Parameters.Add(paramOriginalfeatureid);
                    SqlParameter paramMode = new SqlParameter("@transportmode", dto.TransportMode);
                    cmd.Parameters.Add(paramMode);
                    SqlParameter paramBooking = new SqlParameter("@hotelbooking", dto.HotelBooking);
                    cmd.Parameters.Add(paramBooking);
                    SqlParameter paramStatus = new SqlParameter("@status", dto.Status);
                    cmd.Parameters.Add(paramStatus);
                    SqlParameter paramPackagid = new SqlParameter("@packageid", dto.PackageId);
                    cmd.Parameters.Add(paramPackagid);
                    con.Open();
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw ex.InnerException;
                    }
                    this.con.Close();
                }
            }
        }
        public void Delete(PackageFetauresDTO dto)
        {
                string CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand
                        ("Delete from packagefeatures where featureid = @featureid", con);
                    SqlParameter param = new SqlParameter("@featureid", dto.FeatureId);
                    cmd.Parameters.Add(param);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            
        }
        public DataTable tourpackagesDropItems()
        {
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tourpackages", this.con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
    }
}