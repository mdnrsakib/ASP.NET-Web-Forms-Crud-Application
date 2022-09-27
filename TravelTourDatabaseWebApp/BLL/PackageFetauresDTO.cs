using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelTourDatabaseWebApp.BLL
{
    public class PackageFetauresDTO
    {
        public int FeatureId { get; set; }
        public string TransportMode { get; set; }
        public string HotelBooking { get; set; }
        public bool Status { get; set; }
        public int PackageId { get; set; }
    }
}