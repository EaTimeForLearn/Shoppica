﻿using System;
using System.Collections.Generic;

#nullable disable

namespace ShoppicaAPI.Models
{
    public partial class Product
    {
        public Product()
        {
            ProductImages = new HashSet<ProductImage>();
        }

        public int Id { get; set; }
        public string ProductName { get; set; }
        public decimal? UnitPrice { get; set; }
        public decimal? Discount { get; set; }
        public int? CategoryId { get; set; }
        public int? BrandId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string Image { get; set; }
        public int? ImageCount { get; set; }
        public string Description { get; set; }
        public bool? IsSpecial { get; set; }

        public virtual Brand Brand { get; set; }
        public virtual Category Category { get; set; }
        public virtual ICollection<ProductImage> ProductImages { get; set; }
    }
}
