using System.Data;
using AddressBook.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using CrudOperationEntityFrameWork.Constants;


namespace AddressBook.Controllers
{
    public class UserController : Controller
    {
        private IConfiguration configuration;
        public UserController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }
        public IActionResult UserList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_User_SelectAll";

            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            return View(table);
        }

        public IActionResult UserDelete(int UserID)
        {
            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection sqlConnection = new SqlConnection(connectionString);
                sqlConnection.Open();
                SqlCommand sqlCommand = sqlConnection.CreateCommand();
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = "PR_User_DeleteByPk";
                sqlCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID;
                sqlCommand.ExecuteNonQuery();
                TempData["SuccessMessage"] = "Deleted Succesfully";
                return RedirectToAction("UserList");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Can't be deleted:"+ex.Message;
                Console.WriteLine(ex.ToString());
            }
            return RedirectToAction("UserList");
        }


        public IActionResult UserSave(UserModel model)
        {
            if (ModelState.IsValid)
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (model.UserID == 0)
                {
                    command.CommandText = "PR_User_Insert";
                }
                else
                {
                    command.CommandText = "PR_User_UpdateByPk";
                    command.Parameters.Add("@UserID", SqlDbType.Int).Value = model.UserID;
                }
                command.Parameters.Add("@UserName", SqlDbType.VarChar).Value = model.UserName;
                command.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = model.MobileNo;
                command.Parameters.Add("@EmailID", SqlDbType.VarChar).Value = model.EmailID;    
                command.ExecuteNonQuery();
                return RedirectToAction("UserList");
            }
            return View("UserForm", model);
        }


        public IActionResult UserForm(int UserID)
        {
            if (UserID == 0)
            {
                TempData["PageTitle"] = "Add User";
            }
            else
            {
                TempData["PageTitle"] = "Edit User";

            }

            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_User_SelectByPK";
            command.Parameters.AddWithValue("@UserID", UserID);
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            UserModel userModel = new UserModel();

            foreach (DataRow dataRow in table.Rows)
            {
                userModel.UserID = Convert.ToInt32(@dataRow["UserID"]);
                userModel.UserName = @dataRow["UserName"].ToString();
                userModel.MobileNo = @dataRow["MobileNo"].ToString();
                userModel.EmailID = @dataRow["EmailID"].ToString();
            }
            return View("UserForm", userModel);
        }
       
        public IActionResult Login()
        {
            return View();
        }
        public IActionResult Registration()
        {
            return View();
        }


        [HttpPost]
        public IActionResult UserRegister(UserModel userRegisterModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string connectionString = this.configuration.GetConnectionString("ConnectionString");
                    SqlConnection sqlConnection = new SqlConnection(connectionString);
                    sqlConnection.Open();
                    SqlCommand sqlCommand = sqlConnection.CreateCommand();
                    sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCommand.CommandText = "PR_User_Insert";
                    sqlCommand.Parameters.Add("@UserName", SqlDbType.VarChar).Value = userRegisterModel.UserName;
                    sqlCommand.Parameters.Add("@Password", SqlDbType.VarChar).Value = userRegisterModel.Password;
                    sqlCommand.Parameters.Add("@EmailID", SqlDbType.VarChar).Value = userRegisterModel.EmailID;
                    sqlCommand.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = userRegisterModel.MobileNo;
                    sqlCommand.Parameters.Add("@CreationDate", SqlDbType.DateTime).Value = userRegisterModel.CreationDate;
                    sqlCommand.ExecuteNonQuery();
                    return RedirectToAction("Login");
                }
            }
            catch (Exception e)
            {
                TempData["ErrorMessage"] = e.Message;
                return RedirectToAction("Registration");
            }
            return RedirectToAction("Registration");
        }

        public IActionResult UserLogin(UserLoginModel userLoginModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string connectionString = this.configuration.GetConnectionString("ConnectionString");
                    SqlConnection sqlConnection = new SqlConnection(connectionString);
                    sqlConnection.Open();
                    SqlCommand sqlCommand = sqlConnection.CreateCommand();
                    sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCommand.CommandText = "PR_User_Login";
                    sqlCommand.Parameters.Add("@UserName", SqlDbType.VarChar).Value = userLoginModel.UserName;
                    sqlCommand.Parameters.Add("@Password", SqlDbType.VarChar).Value = userLoginModel.Password;
                    SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                    DataTable dataTable = new DataTable();
                    dataTable.Load(sqlDataReader);
                    if (dataTable.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dataTable.Rows)
                        {
                            HttpContext.Session.SetString(Constants.USERID_SESSION_KEY, dr["UserID"].ToString());
                            HttpContext.Session.SetString(Constants.USERNAME_SESSION_KEY, dr["UserName"].ToString());
                        }

                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        return RedirectToAction("Login");
                    }
                }
            }
            catch (Exception e)
            {
                TempData["ErrorMessage"] = e.Message;
            }
            return RedirectToAction("Login");
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }
    }  
}
