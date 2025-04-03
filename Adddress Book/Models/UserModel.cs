using System.ComponentModel.DataAnnotations;

namespace AddressBook.Models
{
    public class UserModel
    {
        public int UserID { get; set; }

        [Required(ErrorMessage = "Enter User Name")]
        public string UserName { get; set; }

        [Required(ErrorMessage ="Enter Password")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Enter Mobile No")]
        [MaxLength(10)]
        public string MobileNo { get; set; }

        [Required(ErrorMessage = "Enter EmailID")]
        public string EmailID { get; set; }
        public DateTime CreationDate { get; set; } = DateTime.Now;
    }

    public class UserDropDownModel() 
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
    }
    public class UserLoginModel
    {
        [Required(ErrorMessage = "Username is required.")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Password is required.")]
        public string Password { get; set; }
    }

}
