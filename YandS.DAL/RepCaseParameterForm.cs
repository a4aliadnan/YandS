namespace YandS.DAL
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class RepCaseParameterForm
    {
        public RepCaseParameterForm()
        {
            this.ReportFormat = "EXCEL"; //"PDF","WORD" (implement Radio button)
            this.ClaimAmount = 0;
        }

        [Display(Name = "Y & S BRANCH")]
        public string Location { get; set; }

        [Display(Name = "CLIENT NAME")]
        public string ClientCode { get; set; }

        [Display(Name = "AGAINST")]
        public string AgainstCode { get; set; }

        [Display(Name = "CLIENT BRANCH")]
        public string ODBBankBranch { get; set; } //Dropdown 

        [Display(Name = "INVOICE STATUS")]
        public string InvoiceStatus { get; set; }

        [Display(Name = "CLIENT CASE TYPE")]
        public string ClientCaseType { get; set; }

        [Display(Name = "CLAIM AMOUNT")]
        public decimal? ClaimAmount { get; set; }

        [Display(Name = "CASE TYPE")]
        public string CaseTypeCode { get; set; }

        [Display(Name = "CASE LEVEL")]
        public string CaseLevelCode { get; set; }

        [Display(Name = "CASE STATUS")]
        public string CaseStatus { get; set; }

        [Display(Name = "PARENT COURT")]
        public string ParentCourtId { get; set; }
        [Display(Name = "REPORT FORMAT")]
        public string ReportFormat { get; set; }

        [Display(Name = "RECEPTION DATE FROM")]
        public DateTime? ReceptionDateFrom { get; set; }

        [Display(Name = "RECEPTION DATE TO")]
        public DateTime? ReceptionDateTo { get; set; }

        public string VoucherType { get; set; }
        [Display(Name = "PAY TO")]
        public string Payment_To { get; set; }

    }
}