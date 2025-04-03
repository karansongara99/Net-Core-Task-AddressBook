using System.Data;
using AddressBook.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using CrudOperationEntityFrameWork.Constants;
namespace AddressBook.Controllers
{
    public class StateController : Controller
    {
        private readonly IConfiguration configuration;

        public StateController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public IActionResult StateList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_State_SelectAll";
            command.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            return View(table);
        }

        public IActionResult StateDelete(int StateID)
        {
            TempData["Notify"] = "deleted";

            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_State_DeleteByPk";
                command.Parameters.Add("@StateID", SqlDbType.Int).Value = StateID;
                command.ExecuteNonQuery();
                TempData["SuccessMessage"] = "Deleted Succesfully";
                return RedirectToAction("StateList");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Console.WriteLine(ex.ToString());
            }

            return RedirectToAction("StateList");
        }

        public IActionResult SaveState(StateModel stateModel)
        {

            if (ModelState.IsValid)
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection sqlConnection = new SqlConnection(connectionString);
                sqlConnection.Open();
                SqlCommand sqlCommand = sqlConnection.CreateCommand();
                sqlCommand.CommandType = CommandType.StoredProcedure;
                if (stateModel.StateID <= 0)
                {
                    sqlCommand.CommandText = "PR_State_Insert";
                    sqlCommand.Parameters.Add("@CreationDate", SqlDbType.DateTime).Value = DateTime.Now;
                }
                else
                {
                    sqlCommand.CommandText = "PR_State_UpdateByPk";
                    sqlCommand.Parameters.Add("@StateID", SqlDbType.Int).Value = stateModel.StateID;
                }
                sqlCommand.Parameters.Add("@CountryID", SqlDbType.Int).Value = stateModel.CountryID;
                sqlCommand.Parameters.Add("@StateName", SqlDbType.VarChar).Value = stateModel.StateName;
                sqlCommand.Parameters.Add("@StateCode", SqlDbType.VarChar).Value = stateModel.StateCode;
                sqlCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = HttpContext.Session.GetString(Constants.USERID_SESSION_KEY); 
                sqlCommand.ExecuteNonQuery();
                return RedirectToAction("StateList");
            }
            return View("StateForm", stateModel);
        }


        public IActionResult StateForm(int StateID = 0)
        {
            if (StateID == 0)
            {
                TempData["PageTitle"] = "Add State";
            }
            else
            {
                TempData["PageTitle"] = "Edit State";
            }
            ViewBag.StateID = StateID;

            //----------Country DropDown

            string connectionString1 = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection1 = new SqlConnection(connectionString1);
            connection1.Open();
            SqlCommand command1 = connection1.CreateCommand();
            command1.CommandType = System.Data.CommandType.StoredProcedure;
            command1.CommandText = "PR_Country_SelectAll";
            command1.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));
            SqlDataReader reader1 = command1.ExecuteReader();
            DataTable dataTable1 = new DataTable();
            dataTable1.Load(reader1);
            List<CountryDropDownModel> countryList = new List<CountryDropDownModel>();
            foreach (DataRow data in dataTable1.Rows)
            {
                CountryDropDownModel customerDropDownModel = new CountryDropDownModel();
                customerDropDownModel.CountryID = Convert.ToInt32(data["CountryID"]);
                customerDropDownModel.CountryName = data["CountryName"].ToString();
                countryList.Add(customerDropDownModel);
            }
            ViewBag.CountryList = countryList;

            //----User DropDown

            SqlConnection connection2 = new SqlConnection(connectionString1);
            connection2.Open();
            SqlCommand command2 = connection1.CreateCommand();
            command2.CommandType = System.Data.CommandType.StoredProcedure;
            command2.CommandText = "PR_User_SelectAll";
            SqlDataReader reader2 = command2.ExecuteReader();
            DataTable dataTable2 = new DataTable();
            dataTable2.Load(reader2);
            List<UserDropDownModel> userList = new List<UserDropDownModel>();
            foreach (DataRow data in dataTable2.Rows)
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

            command.CommandText = "PR_State_SelectByPK";
            command.Parameters.AddWithValue("@StateID", StateID);
            SqlDataReader reader = command.ExecuteReader();
            DataTable stateDataTable = new();
            stateDataTable.Load(reader);

            StateModel stateModel = new StateModel();

            foreach (DataRow dataRow in stateDataTable.Rows)
            {
                stateModel.CountryID = Convert.ToInt32(@dataRow["CountryID"]);
                stateModel.StateName = @dataRow["StateName"].ToString();
                stateModel.StateCode = @dataRow["StateCode"].ToString();
                stateModel.UserID = Convert.ToInt32(@dataRow["UserID"]);
            }

            return View(stateModel);
        }
    }
}
