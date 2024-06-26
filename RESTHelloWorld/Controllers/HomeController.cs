using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json.Nodes;

namespace RESTHelloWorld.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        [HttpPost(Name = "JsonToUpper")]

        public string FunctionHandler(JsonObject input)
        {
            return input.ToString().ToUpper();
        }
    }
}
