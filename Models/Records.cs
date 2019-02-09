using System;

namespace teampomodoroapi.Models
{
    public class Records
    {
        public int Id { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public int ProjectId { get; set; }
    }
}
