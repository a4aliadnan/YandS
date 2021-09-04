namespace YandS.DAL
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class PVListForIndex
    {
        public int Voucher_No { get; set; }

        [Display(Name = "PV Number")]
        public string PV_No { get; set; }

        [Display(Name = "Voucher Date")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyy}", ApplyFormatInEditMode = true)]
        public string Voucher_Date { get; set; }


        [Display(Name = "Voucher Type")]
        public string VoucherTypeName { get; set; }

        [Display(Name = "Authorize Status")]
        public string VoucherStatusName { get; set; }
        public string VoucherStatus { get; set; }

        [Display(Name = "Amount")]
        [DisplayFormat(DataFormatString = "{0:#.###}", ApplyFormatInEditMode = true)]
        public decimal Amount { get; set; }

        [Display(Name = "Status")]
        public string StatusName { get; set; }
        public string Status { get; set; }

        [Display(Name = "Invoice Numbers")]
        public string CaseInvoices { get; set; }

        [Display(Name = "Payment Mode")]
        public string PaymentModeName { get; set; }
        [Display(Name = "Payment Mode")]
        public string Payment_Mode { get; set; }
        public string LocationCode { get; set; }
        public string Payment_Head { get; set; }
        public string PaymentHeadName { get; set; }
        public string Payment_To { get; set; }
        public string PaymentToName { get; set; }

        [Display(Name = "W/D Date")]
        public string W_D_Date { get; set; }
        public string FutureChequeDate { get; set; }
        public string TransReasonName { get; set; }
        public string TransReasonCode { get; set; }
        public string Remarks { get; set; }
        public string BillNumber { get; set; }
        public string W_D_BANK { get; set; }
        public string OfficeFileNo { get; set; }
        public string ClientName { get; set; }
        public string Defendant { get; set; }
        public string CaseLevel { get; set; }
        public string REF_PAID { get; set; }
        public string RejectReason { get; set; }
        public int DaysLeft { get; set; }
        public string PDCRefNo { get; set; }
        public string SpecialNotification { get; set; }

        public int TotalRecords { get; set; }

    }
}