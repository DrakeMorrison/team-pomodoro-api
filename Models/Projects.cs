using System;
namespace teampomodoroapi.Models
{
    public class Projects
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool IsArchived { get; set; }
        public string Description { get; set; }
    }
}
