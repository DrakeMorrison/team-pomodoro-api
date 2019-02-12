using System;
using System.Collections.Generic;

namespace teampomodoroapi.Models
{
    public class ProjectWithUsers
    {
        public string Name { get; set; }
        public bool IsArchived { get; set; }
        public string Description { get; set; }
        public IEnumerable<int> UserIds { get; set; }
    }
}
