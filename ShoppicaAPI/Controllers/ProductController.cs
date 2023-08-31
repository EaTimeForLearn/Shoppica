using Microsoft.AspNetCore.Mvc;
using ShoppicaAPI.Models;
using ShoppicaAPI.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ShoppicaAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        ProductServices ps = new ProductServices();
        [HttpGet("{id}")]
        public IEnumerable<Product> GetMainCategories(int id)
        {
            return ps.GetProducts(id);

        }
    }



}

