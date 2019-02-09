using System;
using System.Collections.Generic;

namespace teampomodoroapi.Models
{
    public class Everything
    {
        public List<Users> Users { get; set; }
        public List<UsersToProjects> UsersToProjects { get; set; }
        public List<Projects> Projects { get; set; }
        public List<Tasks> Tasks { get; set; }
        public List<Records> Records { get; set; }
    }
}
