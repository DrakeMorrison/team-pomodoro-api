using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using teampomodoroapi.DataAccess;
using teampomodoroapi.Models;

namespace teampomodoroapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProjectsController : ControllerBase
    {
        private readonly ProjectsStorage _storage;

        public ProjectsController(IConfiguration config)
        {
            _storage = new ProjectsStorage(config);
        }

        // post new project
        [HttpPost]
        public IActionResult Post(ProjectWithUsers newProject)
        {
            object result = _storage.CreateProject(newProject);

            return result != null ? Ok(result) : (IActionResult)BadRequest();
        }

        // update project
        [HttpPut]
        public IActionResult Put(Projects newProject)
        {
            object result = _storage.UpdateProject(newProject);

            return result != null ? Ok(result) : (IActionResult)NotFound();
        }
    }
}
