using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Data.SqlClient;
using teampomodoroapi.Models;

namespace teampomodoroapi.DataAccess
{
    public class ProjectsStorage
    {
        private readonly string ConnectionString;

        public ProjectsStorage(IConfiguration config)
        {
            ConnectionString = config.GetSection("ConnectionString").Value;
        }

        public object CreateProject(ProjectWithUsers newProject)
        {
            try
            {
                using (var db = new SqlConnection(ConnectionString))
                {
                    db.Open();

                    // create Project and select ID
                    var projectId = db.ExecuteScalar(@"
                        INSERT INTO [dbo].[Projects] ([Name], [isArchived], [Description]) 
                        VALUES (@name, @isArchived, @description)
                        SELECT SCOPE_IDENTITY();
                    ", newProject);

                    // create UsersToProjects for each user with ProjectId
                    foreach (var uid in newProject.UserIds)
                    {
                        db.ExecuteScalar($@"
                            INSERT INTO [dbo].[UsersToProjects] ([UserId], [ProjectId])
                            VALUES (${uid}, ${projectId});
                        ");
                    }

                    return projectId;
                }

            }
            catch
            {
                return null;
            }
        }

        public object UpdateProject(Projects newProject)
        {
            try
            {
                using (var db = new SqlConnection(ConnectionString))
                {
                    db.Open();

                    var result = db.Execute(@"
                        UPDATE [dbo].[Projects]
                        SET [Name] = @Name, [isArchived] = @IsArchived, [Description] = @Description
                        Where [Id] = @Id;
                    ", newProject);

                    if (result == 1)
                    {
                        return newProject.Id;
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
