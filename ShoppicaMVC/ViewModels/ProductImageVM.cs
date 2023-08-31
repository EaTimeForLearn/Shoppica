using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppicaMVC.ViewModels
{
    public class ProductImageVM
    {
        public int Id { get; set; }
        public string Image { get; set; }
        public int? ProductId { get; set; }

        public virtual ProductVM Product { get; set; }
    }
}
