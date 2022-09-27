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
    public partial class AgentTourPackages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvagentspackage_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            e.Values["packageid"] = (int)gvagentspackage.SelectedValue;
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