using Microsoft.AspNetCore.Mvc;

namespace HelloWorldApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HelloWorldController : ControllerBase
    {
        [HttpPost]
        public IActionResult Function(JsonObject input)
        {
            return input.ToString().ToUpper();
        }
    }
}