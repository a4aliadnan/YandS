namespace YandS.DAL
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class CourtCaseListForIndex
    {
        public int CaseId { get; set; }

        [Display(Name = "Office File No")]
        public string OfficeFileNo { get; set; }

        [Display(Name = "Client Name")]
        public string ClientName { get; set; }

        [Display(Name = "Defendant Name")]
        public string DefClientName { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [Display(Name = "Received Date")]
        public DateTime? ReceptionDate { get; set; }

        [Display(Name = "A/C Contract No")]
        public string AccountContractNo { get; set; }

        [Display(Name = "Client File No")]
        public string ClientFileNo { get; set; }
        public string CaseTypeName { get; set; }
        public string CaseLevelName { get; set; }
        public string CaseStatusName { get; set; }
        public string AgainstName { get; set; }
        public string CaseLevelCode { get; set; }
        public string CaseStatus { get; set; }
        public int TotalRecords { get; set; }

    }
}