using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace ShoppicaMVC
{
    public static class GlobalConfig
    {
        public static HttpClient webClient = new HttpClient();

        static GlobalConfig() 
        {
            webClient.BaseAddress = new Uri("https://localhost:44386/api/");
            webClient.DefaultRequestHeaders.Clear();
            webClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }
    }
}
