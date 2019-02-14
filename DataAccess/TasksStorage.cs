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

                    using (var transaction = db.BeginTransaction())
                    {
                        string startTime =  DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff");

                        // create record and selectId
                        int recordId = db.ExecuteScalar<int>(@"
                            INSERT INTO [dbo].[Records] ([StartTime], [EndTime], [ProjectId]) 
                            VALUES (@StartTime, null, @ProjectId)
                            SELECT SCOPE_IDENTITY();
                            ", new { StartTime = startTime, ProjectId = newTask.ProjectId}, transaction: transaction);

                        Tasks taskWithRecordId = newTask;
                        taskWithRecordId.RecordId = recordId;

                        // create Task and select ID
                        var result = db.ExecuteScalar(@"
                            INSERT INTO [dbo].[Tasks] ([Name], [EstimatedPomodori], [ActualPomodori], [InternalInterruptions], [ExternalInterruptions], [UserId], [isArchived], [ProjectId], [RecordId], [isAssigned]) 
                            VALUES (@name, @estimatedPomodori, @actualPomodori, @internalInterruptions, @externalInterruptions, @userId, @isArchived, @projectId, @recordId, @isAssigned)
                            SELECT SCOPE_IDENTITY();
                            ", taskWithRecordId, transaction: transaction);

                        transaction.Commit();
                        
                        return result;
                    }
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

                    using (var transaction = db.BeginTransaction())
                    {
                        string endTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff");
                        
                        var result1 = db.Execute(@"
                            UPDATE [dbo].[Tasks]
                            SET [Name] = @Name, [EstimatedPomodori] = @EstimatedPomodori, [ActualPomodori] = @ActualPomodori, [InternalInterruptions] = @InternalInterruptions, [ExternalInterruptions] = @InternalInterruptions, [UserId] = @UserId, [isArchived] = @IsArchived, [ProjectId] = @ProjectId, [RecordId] = @RecordId, [isAssigned] = @IsAssigned
                            WHERE [Id] = @Id;
                        ", newTask, transaction: transaction);
                        
                        var result2 = db.Execute(@"
                            UPDATE [dbo].[Records]
                            SET [EndTime] = @EndTime
                            WHERE [Id] = @RecordId;", new { RecordId = newTask.RecordId, EndTime = endTime}, transaction: transaction);

                        transaction.Commit();
                        
                        if (result1 != 0 && result2 != 0)
                        {
                            return newTask.Id;
                        }
                        
                        return null;
                    }
                }

            }
            catch
            {
                return null;
            }
        }
    }
}