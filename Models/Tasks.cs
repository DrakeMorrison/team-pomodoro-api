using System;
namespace teampomodoroapi.Models
{
    public class Tasks
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int EstimatedPomodori { get; set; }
        public int ActualPomodori { get; set; }
        public int InternalInterruptions { get; set; }
        public int ExternalInterruptions { get; set; }
        public int UserId { get; set; }
        public bool IsArchived { get; set; }
        public int ProjectId { get; set; }
        public int RecordId { get; set; }
        public bool IsAssigned { get; set; }
    }
}
