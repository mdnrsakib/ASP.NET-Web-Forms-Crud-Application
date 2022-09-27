using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TravelTourDatabaseWebApp.BLL
{
    public interface ITourPackagesRepo
    {
        ICollection<TourpackagesDTO> GetAll();
        TourpackagesDTO Get(int id);
        void Insert(TourpackagesDTO dto);
        void Update(TourpackagesDTO dto);
        void Delete(TourpackagesDTO dto);
        int TourpackagesCout();
    }
}
