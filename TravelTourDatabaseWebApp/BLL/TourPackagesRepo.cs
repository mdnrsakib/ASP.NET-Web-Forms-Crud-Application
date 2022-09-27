using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace TravelTourDatabaseWebApp.BLL
{
    public class TourPackagesRepo : ITourPackagesRepo, IDisposable
    {
        SqlConnection con;
        public TourPackagesRepo()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        }
        public void Delete(TourpackagesDTO dto)
        {
            {
                string CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand
                        ("Delete from tourpackages where packageid = @packageid", con);
                    SqlParameter param = new SqlParameter("@packageid", dto.PackageId);
                    cmd.Parameters.Add(param);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void Dispose()
        {
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
        }

        public TourpackagesDTO Get(int id)
        {
            throw new NotImplementedException();
        }

        public ICollection<TourpackagesDTO> GetAll()
        {
            List<TourpackagesDTO> tourpackages = new List<TourpackagesDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tourpackages", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    tourpackages.Add(new TourpackagesDTO
                    {
                        PackageId = r.Field<int>("packageid"),
                        PackageCategory = r.Field<string>("packagecategory"),
                        PackageName = r.Field<string>("packagename"),
                        CostPerPerson = r.Field<decimal>("costperperson"),
                        TourTime = r.Field<int>("tourtime")
                    });
                }
                return tourpackages;
            }
        }

        public void Insert(TourpackagesDTO dto)
        {
            string sql = @"INSERT INTO [dbo].[tourpackages]
           ([packagecategory]
           ,[packagename]
           ,[costperperson]
           ,[tourtime])
     VALUES
           (@packagecategory
           ,@packagename
           ,@costperperson
           ,@tourtime)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@packagecategory", dto.PackageCategory);
                cmd.Parameters.AddWithValue("@packagename", dto.PackageName);
                cmd.Parameters.AddWithValue("@costperperson", dto.CostPerPerson);
                cmd.Parameters.AddWithValue("@tourtime", dto.TourTime);
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

        public int TourpackagesCout()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM tourpackages", this.con))
            {
                this.con.Open();
                int n = (int)cmd.ExecuteScalar();
                this.con.Close();
                return n;
            }
        }

        //public void Update(TourpackagesDTO dto)
        //{
        //    string sql = @"UPDATE [dbo].[tourpackages]
        //    SET [packagecategory] = @packagecategory
        //    ,[packagename] = @packagename
        //    ,[costperperson] = @costperperson
        //    ,[tourtime] = @tourtime
        //    WHERE [packageid] = @packageid";
        //    using (SqlCommand cmd = new SqlCommand(sql, this.con))
        //    {
        //        cmd.Parameters.AddWithValue("@packagecategory", dto.PackageCategory);
        //        cmd.Parameters.AddWithValue("@packagename", dto.PackageName);
        //        cmd.Parameters.AddWithValue("@costperperson", dto.CostPerPerson);
        //        cmd.Parameters.AddWithValue("@tourtime", dto.TourTime);
        //        this.con.Open();
        //        try
        //        {
        //            cmd.ExecuteNonQuery();
        //        }
        //        catch (Exception ex)
        //        {
        //            throw ex.InnerException;
        //        }
        //        this.con.Close();
        //    }
        //}
        public void Update(TourpackagesDTO dto)
        {
            {
                string CS = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string updateQuery = "Update tourpackages SET packagecategory = @packagecategory,  " +
                        "packagename = @packagename, costperperson = @costperperson,tourtime = @tourtime WHERE packageid = @packageid";
                    SqlCommand cmd = new SqlCommand(updateQuery, con);
                    SqlParameter paramOriginalpackageid = new
                        SqlParameter("@packageid", dto.PackageId);
                    cmd.Parameters.Add(paramOriginalpackageid);
                    SqlParameter paramCategory = new SqlParameter("@packagecategory", dto.PackageCategory);
                    cmd.Parameters.Add(paramCategory);
                    SqlParameter paramName = new SqlParameter("@packagename", dto.PackageName);
                    cmd.Parameters.Add(paramName);
                    SqlParameter paramCost = new SqlParameter("@costperperson", dto.CostPerPerson);
                    cmd.Parameters.Add(paramCost);
                    SqlParameter paramTime = new SqlParameter("@tourtime", dto.TourTime);
                    cmd.Parameters.Add(paramTime);
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

    }
}