using Dapper;
using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;
using teampomodoroapi.Models;

namespace teampomodoroapi.DataAccess
{
    public class AppStorage
    {
        private readonly string ConnectionString;

        public AppStorage(IConfiguration config)
        {
            ConnectionString = config.GetSection("ConnectionString").Value;
        }

        // API Method here

        public Everything GetEverything() {
            using (var db = new SqlConnection(ConnectionString))
            {
                db.Open();

                Everything result = new Everything
                {
                    Users = db.Query<Users>(@"
                    SELECT TOP (1000) [Id]
                          ,[Name]
                      FROM [dbo].[Users]
                "),

                    Projects = db.Query<Projects>(@"
                    SELECT TOP (1000) [Id]
                    ,[Name]
                    ,[isArchived]
                    ,[Description]
                    FROM [dbo].[Projects]
                "),

                    UsersToProjects = db.Query<UsersToProjects>(@"
                    SELECT TOP (1000) [Id]
                          ,[UserId]
                          ,[ProjectId]
                      FROM [dbo].[UsersToProjects]
                "),

                    Tasks = db.Query<Tasks>(@"
                    SELECT TOP (1000) [Id]
                          ,[Name]
                          ,[EstimatedPomodori]
                          ,[ActualPomodori]
                          ,[InternalInterruptions]
                          ,[ExternalInterruptions]
                          ,[UserId]
                          ,[isArchived]
                          ,[ProjectId]
                          ,[RecordId]
                          ,[isAssigned]
                      FROM [dbo].[Tasks]
                "),

                    Records = db.Query<Records>(@"
                    SELECT TOP (1000) [Id]
                          ,[StartTime]
                          ,[EndTime]
                          ,[ProjectId]
                      FROM [dbo].[Records]
                ")
                };

                return result;
            }
        }

    }
}
