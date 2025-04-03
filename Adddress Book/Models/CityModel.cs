using System.ComponentModel.DataAnnotations;

namespace AddressBook.Models
{
    public class CityModel
    {
        public int CityID { get; set; }

        public List<StateModel> States { get; set; } = [];
        public int StateID { get; set; }

        public List<CountryModel> Countrys { get; set; } = [];
        public int CountryID { get; set; }

        [Required(ErrorMessage = "Enter City Name")]
        public string CityName { get; set; }
        [Required(ErrorMessage = "Enter STD Maximum 6 Code")]
        [MaxLength(6)]
        public string STDCode { get; set; }
        [Required(ErrorMessage = "Enter Pin Maximum 6 Code")]
        [MaxLength(6)]
        public string PinCode { get; set; }
        [Required(ErrorMessage = "Formatted Date")]
        public DateTime CreationDate { get; set; }

        public List<UserModel> Users { get; set; } = [];
        public int UserID { get; set; }

    }

    public class CityDropDownModel()
    {
        public int CityID { get; set; }
        public string CityName { get; set; }
    }
}
