using System;
using System.Collections.Generic;

namespace teampomodoroapi.Models
{
    public class Everything
    {
        public IEnumerable<Users> Users { get; set; }
        public IEnumerable<UsersToProjects> UsersToProjects { get; set; }
        public IEnumerable<Projects> Projects { get; set; }
        public IEnumerable<Tasks> Tasks { get; set; }
        public IEnumerable<Records> Records { get; set; }
    }
}
