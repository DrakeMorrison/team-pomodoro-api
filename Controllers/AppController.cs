using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using teampomodoroapi.DataAccess;

namespace teampomodoroapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AppController : ControllerBase
    {
        private readonly AppStorage _storage;

        public AppController(IConfiguration config)
        {
            _storage = new AppStorage(config);
        }

        // Get all the data
        [HttpGet]
        public IActionResult Get()
        {
            var result = _storage.GetEverything();

            if (result != null)
            {
                return Ok(result);
            }
            return NotFound();
        }
    }
}
