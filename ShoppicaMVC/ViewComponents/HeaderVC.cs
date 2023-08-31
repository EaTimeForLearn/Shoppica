using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ShoppicaMVC.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppicaMVC.ViewComponents
{
    public class HeaderVC:ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            var response =  GlobalConfig.webClient.GetAsync("Category").Result;
            var json = response.Content.ReadAsStringAsync().Result;
            List<CategoryVM> categoryVMs = JsonConvert.DeserializeObject<List<CategoryVM>>(json);
            return View(categoryVMs);
        }
    }
}
