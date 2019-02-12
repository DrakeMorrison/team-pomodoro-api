using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using teampomodoroapi.DataAccess;
using teampomodoroapi.Models;

namespace teampomodoroapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly UsersStorage _storage;

        public UserController(IConfiguration config)
        {
            _storage = new UsersStorage(config);
        }

        // post new user
        [HttpPost]
        public IActionResult Post(Users newUser)
        {
            var result = _storage.CreateUser(newUser);

            if (result != null)
            {
                return Ok(result);
            }
            return BadRequest();
        }

    }
}
