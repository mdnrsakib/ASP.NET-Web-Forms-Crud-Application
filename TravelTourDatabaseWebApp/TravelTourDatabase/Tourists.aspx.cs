using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelTourDatabaseWebApp.TravelTourDatabase
{
    public partial class Tourists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {

        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            var img = ListView1.InsertItem.FindControl("img") as FileUpload;
            if (img.HasFile)
            {
                if (img.PostedFile.ContentLength > 0)
                {
                    string filePath = Guid.NewGuid() + Path.GetExtension(img.FileName);
                    img.PostedFile.SaveAs(Server.MapPath($"~/Uploads/{filePath}"));
                    e.Values["touristpicture"] = filePath;
                }
            }
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            var img = ListView1.EditItem.FindControl("img") as FileUpload;
            if (img.HasFile)
            {
                if (img.PostedFile.ContentLength > 0)
                {
                    string filePath = Guid.NewGuid() + Path.GetExtension(img.FileName);
                    img.PostedFile.SaveAs(Server.MapPath($"~/Uploads/{filePath}"));
                    e.NewValues["touristpicture"] = filePath;
                }
            }
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var id = DataBinder.Eval(e.Item.DataItem, "packageid").ToString();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand($"SELECT packagename FROM tourpackages WHERE packageid={id}", con))
                    {
                        con.Open();
                        var dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            var l = e.Item.FindControl("packageidLabel") as Label;
                            if (l != null)
                                l.Text = dr[0].ToString();
                            con.Close();
                        }
                    }
                }
            }
        }
    }
}