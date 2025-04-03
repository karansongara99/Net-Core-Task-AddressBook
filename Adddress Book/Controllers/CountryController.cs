using System.Data;
using AddressBook.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using CrudOperationEntityFrameWork.Constants;
using Microsoft.Extensions.Configuration;
using OfficeOpenXml;

namespace AddressBook.Controllers
{
    public class CountryController : Controller
    {
        private readonly IConfiguration configuration;

        public CountryController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        
        public IActionResult CountryForm(int CountryID)
        {
            if (CountryID == 0)
            {
                TempData["PageTitle"] = "Add Country";
            }
            else
            {
                TempData["PageTitle"] = "Edit Country";
            }

            ViewBag.CustomerID = CountryID;
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection sqlConnection1 = new SqlConnection(connectionString);
            sqlConnection1.Open();
            SqlCommand sqlCommand1 = sqlConnection1.CreateCommand();
            sqlCommand1.CommandType = CommandType.StoredProcedure;
            sqlCommand1.CommandText = "PR_User_SelectAll";
            SqlDataReader reader1 = sqlCommand1.ExecuteReader();
            DataTable dataTable1 = new DataTable();
            dataTable1.Load(reader1);
            List<UserDropDownModel> userList = new List<UserDropDownModel>();
            foreach (DataRow data in dataTable1.Rows)
            {
                UserDropDownModel userDropDownModel = new UserDropDownModel();
                userDropDownModel.UserID = Convert.ToInt32(data["UserID"]);
                userDropDownModel.UserName = data["UserName"].ToString();
                userList.Add(userDropDownModel);
            }
            ViewBag.UserList = userList;

            SqlConnection sqlConnection = new SqlConnection(connectionString);
            sqlConnection.Open();
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "PR_Country_SelectByPK";
            sqlCommand.Parameters.AddWithValue("@CountryID", CountryID);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            CountryModel countryModel = new CountryModel();

            foreach (DataRow dataRow in table.Rows)
            {
                countryModel.CountryID = Convert.ToInt32(@dataRow["CountryID"]);
                countryModel.CountryName = @dataRow["CountryName"].ToString();
                countryModel.CountryCode = @dataRow["CountryCode"].ToString();
                countryModel.UserID = Convert.ToInt32(@dataRow["UserID"]);
            }
            return View("CountryForm", countryModel);
        }

        public IActionResult CountryList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Country_SelectAll";
            command.Parameters.AddWithValue("@UserID", HttpContext.Session.GetString(Constants.USERID_SESSION_KEY));
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);
            return View(table);
        }

        public IActionResult CountryDelete(int CountryID)
        {
            TempData["Notify"] = "deleted";

            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_Country_DeleteByPk";
                command.Parameters.Add("@CountryID", SqlDbType.Int).Value = CountryID;
                command.ExecuteNonQuery();
                TempData["SuccessMessage"] = "Deleted Succesfully";
                return RedirectToAction("CountryList");
            }

            
                
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Console.WriteLine(ex.ToString());
            }

            return RedirectToAction("CountryList");
        }


        public IActionResult CountrySave(CountryModel model)
        {
            if (ModelState.IsValid)
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (model.CountryID == 0)
                {
                    command.CommandText = "PR_Country_Insert";
                    command.Parameters.Add("@CreationDate", SqlDbType.DateTime).Value = DateTime.Now;
                }
                else
                {
                    command.CommandText = "PR_Country_UpdateByPk";
                    command.Parameters.Add("@CountryID", SqlDbType.Int).Value = model.CountryID;
                }
                command.Parameters.Add("@CountryName", SqlDbType.VarChar).Value = model.CountryName;
                command.Parameters.Add("@CountryCode", SqlDbType.VarChar).Value = model.CountryCode;
                command.Parameters.Add("@UserID", SqlDbType.Int).Value = HttpContext.Session.GetString(Constants.USERID_SESSION_KEY); 
                command.ExecuteNonQuery();
                return RedirectToAction("CountryList");
            }
            return View("CountryForm", model);
        }

        public IActionResult ExportToExcel()
        {
            string connectionString = configuration.GetConnectionString("ConnectionString");
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            sqlConnection.Open();

            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sqlCommand.CommandText = "PR_Country_SelectAll";
            sqlCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = HttpContext.Session.GetString(Constants.USERID_SESSION_KEY);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            DataTable data = new DataTable();
            data.Load(sqlDataReader);

            ExcelPackage.LicenseContext=LicenseContext.NonCommercial;

            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("DataSheet");

                // Add headers
                worksheet.Cells[1, 1].Value = "CountryID";
                worksheet.Cells[1, 2].Value = "CountryName";
                worksheet.Cells[1, 3].Value = "CountryCode";
                worksheet.Cells[1, 4].Value = "CreationDate";
                worksheet.Cells[1, 5].Value = "UserName";

                // Add data
                int row = 2;
                foreach (DataRow item in data.Rows)
                {
                    worksheet.Cells[row, 1].Value = item["CountryID"];
                    worksheet.Cells[row, 2].Value = item["CountryName"];
                    worksheet.Cells[row, 3].Value = item["CountryCode"];
                    worksheet.Cells[row, 4].Value = item["CreationDate"];
                    worksheet.Cells[row, 5].Value = item["UserName"];
                    row++;
                }

                var stream = new MemoryStream();
                package.SaveAs(stream);
                stream.Position = 0;

                string excelName = $"Data-{DateTime.Now:yyyyMMddHHmmss}.xlsx";
                return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", excelName);
            }
        }

    }
}
