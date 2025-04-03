using System.Data;
using AddressBook.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using CrudOperationEntityFrameWork.Constants;

namespace AddressBook.Controllers
{
    public class CityController : Controller
    {
        private readonly IConfiguration configuration;

        public CityController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public IActionResult CityList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_City_SelectAll";
            command.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            return View(table);
        }

        public IActionResult CityDelete(int CityID)
        {
            TempData["Notify"] = "deleted";

            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_City_DeleteByPk";
                command.Parameters.Add("@CityID", SqlDbType.Int).Value = CityID;

                command.ExecuteNonQuery();

                TempData["SuccessMessage"] = "Deleted Succesfully";
                return RedirectToAction("CityList");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Console.WriteLine(ex.ToString());
            }
            return RedirectToAction("CityList");
        }

        public IActionResult SaveCity(CityModel cityModel)
        {

            if (ModelState.IsValid)
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection sqlConnection = new SqlConnection(connectionString);
                sqlConnection.Open();
                SqlCommand sqlCommand = sqlConnection.CreateCommand();
                sqlCommand.CommandType = CommandType.StoredProcedure;
                if (cityModel.CityID <= 0)
                {
                    sqlCommand.CommandText = "PR_City_Insert";
                    sqlCommand.Parameters.Add("@CreationDate", SqlDbType.DateTime).Value = DateTime.Now;
                }
                else
                {
                    sqlCommand.CommandText = "PR_City_UpdateByPk";
                    sqlCommand.Parameters.Add("@CityID", SqlDbType.Int).Value = cityModel.CityID;
                }
                sqlCommand.Parameters.Add("@StateID", SqlDbType.Int).Value = cityModel.StateID;
                sqlCommand.Parameters.Add("@CountryID", SqlDbType.Int).Value = cityModel.CountryID;
                sqlCommand.Parameters.Add("@CityName", SqlDbType.VarChar).Value = cityModel.CityName;
                sqlCommand.Parameters.Add("@STDCode", SqlDbType.VarChar).Value = cityModel.STDCode;
                sqlCommand.Parameters.Add("@PinCode", SqlDbType.VarChar).Value = cityModel.PinCode;
                sqlCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = HttpContext.Session.GetString(Constants.USERID_SESSION_KEY); ;
                sqlCommand.ExecuteNonQuery();
                return RedirectToAction("CityList");
            }
            return View("CityForm", cityModel);
        }
        public IActionResult CityForm(int CityID = 0)
        {
            if (CityID == 0)
            {
                TempData["PageTitle"] = "Add City";
            }
            else
            {
                TempData["PageTitle"] = "Edit City";
            }
            ViewBag.CityID = CityID;

            //----------State DropDown

            string stateConnectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection stateConnection = new SqlConnection(stateConnectionString);
            stateConnection.Open();
            SqlCommand command1 = stateConnection.CreateCommand();
            command1.CommandType = System.Data.CommandType.StoredProcedure;
            command1.CommandText = "PR_State_SelectAll";
            command1.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));

            SqlDataReader reader1 = command1.ExecuteReader();
            DataTable dataTable1 = new DataTable();
            dataTable1.Load(reader1);
            List<StateDropDownModel> stateList = new List<StateDropDownModel>();
            foreach (DataRow data in dataTable1.Rows)
            {
                StateDropDownModel stateDropDownModel = new StateDropDownModel();
                stateDropDownModel.StateID = Convert.ToInt32(data["StateID"]);
                stateDropDownModel.StateName = data["StateName"].ToString();
                stateList.Add(stateDropDownModel);
            }
            ViewBag.StateList = stateList;

            //----------Country DropDown

            string connectionString2 = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection2 = new SqlConnection(connectionString2);
            connection2.Open();
            SqlCommand command2 = stateConnection.CreateCommand();
            command2.CommandType = System.Data.CommandType.StoredProcedure;
            command2.CommandText = "PR_Country_SelectAll";
            command2.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));
            SqlDataReader reader2 = command2.ExecuteReader();
            DataTable dataTable2 = new DataTable();
            dataTable2.Load(reader2);
            List<CountryDropDownModel> countryList = new List<CountryDropDownModel>();
            foreach (DataRow data in dataTable2.Rows)
            {
                CountryDropDownModel countryDropDownModel = new CountryDropDownModel();
                countryDropDownModel.CountryID = Convert.ToInt32(data["CountryID"]);
                countryDropDownModel.CountryName = data["CountryName"].ToString();
                countryList.Add(countryDropDownModel);
            }
            ViewBag.CountryList = countryList;

            //----User DropDown

            SqlConnection connection3 = new SqlConnection(stateConnectionString);
            connection3.Open();
            SqlCommand command3 = stateConnection.CreateCommand();
            command3.CommandType = System.Data.CommandType.StoredProcedure;
            command3.CommandText = "PR_User_SelectAll";
            SqlDataReader reader3 = command3.ExecuteReader();
            DataTable dataTable3 = new DataTable();
            dataTable3.Load(reader3);
            List<UserDropDownModel> userList = new List<UserDropDownModel>();
            foreach (DataRow data in dataTable3.Rows)
            {
                UserDropDownModel userDropDownModel = new UserDropDownModel();
                userDropDownModel.UserID = Convert.ToInt32(data["UserID"]);
                userDropDownModel.UserName = data["UserName"].ToString();
                userList.Add(userDropDownModel);
            }
            ViewBag.UserList = userList;


            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;

            command.CommandText = "PR_City_SelectByPK";
            command.Parameters.AddWithValue("@CityID", CityID);
            SqlDataReader reader = command.ExecuteReader();
            DataTable stateDataTable = new();
            stateDataTable.Load(reader);

            CityModel cityModel = new CityModel();

            foreach (DataRow dataRow in stateDataTable.Rows)
            {
                cityModel.StateID = Convert.ToInt32(@dataRow["StateID"]);
                cityModel.CountryID = Convert.ToInt32(@dataRow["CountryID"]);
                cityModel.CityName = @dataRow["CityName"].ToString();
                cityModel.STDCode = @dataRow["STDCode"].ToString();
                cityModel.PinCode = @dataRow["PinCode"].ToString();
                cityModel.UserID = Convert.ToInt32(@dataRow["UserID"]);
            }
            return View(cityModel);
        }
    }
}
