using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppicaMVC.ViewModels
{
    public class CategoryVM
    {
        public CategoryVM()
        {
            InverseTop = new HashSet<CategoryVM>();
            Products = new HashSet<ProductVM>();
        }

        public int Id { get; set; }
        public string CategoryName { get; set; }
        public int? TopId { get; set; }

        public virtual CategoryVM Top { get; set; }
        public virtual ICollection<CategoryVM> InverseTop { get; set; }
        public virtual ICollection<ProductVM> Products { get; set; }
    }
}
