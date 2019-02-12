using System;
using System.Data.SqlClient;
using Dapper;
using Microsoft.Extensions.Configuration;
using teampomodoroapi.Models;

namespace teampomodoroapi.Controllers
{
    public class TasksStorage
    {
        private readonly string ConnectionString;

        public TasksStorage(IConfiguration config)
        {
            ConnectionString = config.GetSection("ConnectionString").Value;
        }

        public object CreateTask(Tasks newTask)
        {
            try
            {
                using (var db = new SqlConnection(ConnectionString))
                {
                    db.Open();

                    // create record and selectId
                    var recordId = db.ExecuteScalar($@"
                        INSERT INTO [dbo].[Records] ([StartTime], [EndTime], [ProjectId]) 
                        VALUES (null, null, ${newTask.ProjectId})
                        SELECT SCOPE_IDENTITY();
                    ");

                    // create Task and select ID
                    var result = db.ExecuteScalar($@"
                        INSERT INTO [dbo].[Tasks] ([Name], [EstimatedPomodori], [ActualPomodori], [InternalInterruptions], [ExternalInterruptions], [UserId], [isArchived], [ProjectId], [RecordId], [isAssigned]) 
                        VALUES (@name, @estimatedPomodori, @actualPomodori, @internalInterruptions, @externalInterruptions, @userId, @isArchived, @projectId, ${recordId}, @isAssigned)
                        SELECT SCOPE_IDENTITY();
                    ", newTask);

                    return result;
                }

            }
            catch
            {
                return null;
            }
        }

        public object UpdateTask(Tasks newTask)
        {
            try
            {
                using (var db = new SqlConnection(ConnectionString))
                {
                    db.Open();

                    var result = db.Execute(@"
                        UPDATE [dbo].[Tasks]
                        SET [Name] = @Name, [EstimatedPomodori] = @EstimatedPomodori, [ActualPomodori] = @ActualPomodori, [InternalInterruptions] = @InternalInterruptions, [ExternalInterruptions] = @InternalInterruptions, [UserId] = @UserId, [isArchived] = @IsArchived, [ProjectId] = @ProjectId, [RecordId] = @RecordId, [isAssigned] = @IsAssigned
                        Where [Id] = @Id;
                    ", newTask);

                    if (result == 1)
                    {
                        return newTask.Id;
                    }

                    return null;
                }
            }
            catch
            {
                return null;
            }
        }
    }
}