using ShoppicaAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppicaAPI.Services
{
    public class ProductServices
    {
        ShoppicaContext DB = new ShoppicaContext();
        public IEnumerable<Product> GetProducts(int id)
        {
            Category category = DB.Categories.Find(id);
            List<Product> liste;
            if (category.TopId == null)
            {
                liste = (from p in DB.Products join c in DB.Categories on p.CategoryId equals c.Id where c.TopId==id select p).ToList();
                        

            }

            else
            {
                liste = (from c in DB.Products.Where(x => x.CategoryId == id)
                         select new Product
                         {
                             Brand = c.Brand,
                             Category = c.Category,
                             CategoryId = c.CategoryId,
                             CreatedDate = c.CreatedDate,
                             Description = c.Description,
                             Discount = c.Discount,
                             Id = c.Id,
                             Image = c.Image,
                             ImageCount = c.ImageCount,
                             IsSpecial = c.IsSpecial,
                             ProductName = c.ProductName,
                             UnitPrice = c.UnitPrice,
                             ProductImages = c.ProductImages.ToList()
                         }).ToList();

            }
            return liste;
        }
    }
    
}
