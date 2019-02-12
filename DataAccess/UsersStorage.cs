using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Data.SqlClient;
using teampomodoroapi.Models;

namespace teampomodoroapi.DataAccess
{
    public class UsersStorage
    {
        private readonly string ConnectionString;

        public UsersStorage(IConfiguration config)
        {
            ConnectionString = config.GetSection("ConnectionString").Value;
        }

        public object CreateUser(Users newUser)
        {
            try
            {
                using (var db = new SqlConnection(ConnectionString))
                {
                    db.Open();

                    var result = db.ExecuteScalar(@"
                        INSERT INTO[dbo].[Users]([Name])
                        VALUES(@name)
                        SELECT SCOPE_IDENTITY();
                    ", newUser);

                    return result;
                }

            }
            catch
            {
                return null;
            }
        }
    }
}
