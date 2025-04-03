using System.Data;
using System.Diagnostics;
using AddressBook.Models;
using CrudOperationEntityFrameWork.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using CrudOperationEntityFrameWork.Constants;

namespace AddressBook.Controllers
{
    
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private IConfiguration configuration;
        private readonly SessionService sessionService;
        
        public HomeController(IConfiguration _configuration, SessionService sessionService)
        {
            configuration = _configuration;
            this.sessionService = sessionService;
        }

        public IActionResult Index()
        {
            ViewBag.UserName = sessionService.GetUserName();
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();

            //User Count ------------------------------
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_User_Count";
            command.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            foreach (DataRow dataRow in table.Rows)
            {
                TempData["UserCount"] = dataRow["Count"];
            }



            //City Count -------------------------
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_City_Count";
            reader = command.ExecuteReader();
            table = new();
            table.Load(reader);
            foreach (DataRow dataRow in table.Rows)
            {
                TempData["CityCount"] = dataRow["Count"];
            }


            //State Count -----------------------------------
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_State_Count";
            reader = command.ExecuteReader();
            table = new();
            table.Load(reader);
            foreach (DataRow dataRow in table.Rows)
            {
                TempData["StateCount"] = dataRow["Count"];
            }

            //Country Count -----------------------------------
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Country_Count";
            reader = command.ExecuteReader();
            table = new();
            table.Load(reader);
            foreach (DataRow dataRow in table.Rows)
            {
                TempData["CountryCount"] = dataRow["Count"];
            }

            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
