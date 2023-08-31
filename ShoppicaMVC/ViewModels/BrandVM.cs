using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppicaMVC.ViewModels
{
    public class BrandVM
    {
        public BrandVM()
        {
            Products = new HashSet<ProductVM>();
        }

        public int Id { get; set; }
        public string BrandName { get; set; }

        public virtual ICollection<ProductVM> Products { get; set; }
    }
}
