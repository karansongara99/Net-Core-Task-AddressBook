using System.ComponentModel.DataAnnotations;

namespace AddressBook.Models
{
    public class CountryModel
    {
        public int CountryID { get; set; }

        [Required(ErrorMessage = "Enter Country Name")]
        public string CountryName { get; set; }

        [Required(ErrorMessage = "Enter Country Code")]
        public string CountryCode { get; set; }
        public DateTime CreationDate { get; set; }
        [Required(ErrorMessage = "Enter User Select")]
        public int UserID { get; set; }
        
        public List<UserModel> Users { get; set; } = [];
        

    }

    public class CountryDropDownModel()
    {
        public int CountryID { get; set; }
        public string CountryName { get; set; }
    }
}
