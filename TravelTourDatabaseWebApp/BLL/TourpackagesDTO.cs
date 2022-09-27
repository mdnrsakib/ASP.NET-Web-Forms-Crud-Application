using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelTourDatabaseWebApp.BLL
{
    public class TourpackagesDTO
    {
        public int PackageId { get; set; }
        public string PackageCategory { get; set; }
        public string PackageName { get; set; }
        public decimal CostPerPerson { get; set; }
        public int TourTime { get; set; }
    }
}