using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace teampomodoroapi.DataAccess
{
    public class AppStorage
    {
        private readonly string ConnectionString;

        public AppStorage(IConfiguration config)
        {
            ConnectionString = config.GetSection("ConnectionString").Value;
        }

        // API Functions here

        public Object GetEverything() { }

    }
}
