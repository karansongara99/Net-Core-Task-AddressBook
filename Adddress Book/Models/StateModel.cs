using System.ComponentModel.DataAnnotations;

namespace AddressBook.Models
{
    public class StateModel
    {
        public int StateID { get; set; }
        public int CountryID { get; set; }

        [Required(ErrorMessage = "Enter State Name")]
        public string StateName { get; set; }

        [Required(ErrorMessage = "Enter State Code")]
        [MaxLength(6)]
        public string StateCode { get; set; }
        public DateTime CreationDate { get; set; }
        public int UserID { get; set; }
    }

    public class StateDropDownModel()
    {
        public int StateID { get; set; }
        public string StateName { get; set; }
    }
}
