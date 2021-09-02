SELECT	ROW_NUMBER() OVER (ORDER BY "A/C NO.") as SNo, "A/C NO.","DEFENDANT NAME","INVOICE AMOUNT","DESCRIPTION","INVOICE NUMBER","INVOICE DATE",CaseId,
		ExpectedFees as "Total Lawyer Fees", FeePaid as "Fees paid to date"
from
(
SELECT CC.CaseId,CC.OfficeFileNo,
		FORMAT (CI.InvoiceDate, 'dd/MM/yyyy') as "INVOICE DATE",
		CI.InvoiceNumber as "INVOICE NUMBER",
		case when CC.ClientCode = '0' then null else ClientMast.Mst_Desc END as CLIENT,
		CC.CaseSubject,
		CASE WHEN CC.CaseSubject = '0' THEN NULL ELSE CaseSub.Mst_Desc END as "CASE SUBJECT",
		CASE WHEN CC.CaseTypeCode = '0' THEN NULL ELSE CaseType.Mst_Desc END as "CASE TYPE", 
		CC.ODBBankBranch,
		CASE WHEN CC.ODBBankBranch = '0' THEN NULL ELSE ODB.Mst_Desc END as "CLIENT BRANCH",
		CC.ClientCaseType,
		CASE WHEN CC.ClientCaseType = '0' THEN NULL ELSE ClientCasType.Mst_Desc END as "CLIENT CASE TYPE",
		CASE WHEN CC.AgainstCode = '0' THEN NULL ELSE CaseAgainst.Mst_Desc END as "CASE AGAINST",
		CC.Defendant as "DEFENDANT NAME",
		CC.AccountContractNo as "A/C NO.",
		CC.ClientFileNo as "CLIENT FILE NO.",
		CIF.FeeTypeId,
		--CASE WHEN CIF.FeeTypeId = '0' THEN NULL ELSE FeeDetail.Mst_Desc END as "DESCRIPTION",
		case when CIF.CaseLevel = '0' then '' else CaseLevel.Mst_Desc end +  
		case when CIF.FeeTypeId = '0' then '' when CIF.CaseLevel = '0' and CIF.FeeTypeId != '0' then FeeDetail.Mst_Desc else  ' - ' + FeeDetail.Mst_Desc end + ' - ' +
		case when CIF.FeeTypeCascadeDetail = '0' then '' else  FeeCascade.Mst_Desc end +
		case when CIF.FeeTypeDetail is null then '' when CIF.FeeTypeCascadeDetail = '0' and CIF.FeeTypeDetail is not null then CIF.FeeTypeDetail else ' - ' + CIF.FeeTypeDetail end
		as "DESCRIPTION", 
		case when CIF.FeeTypeCascadeDetail = '0' then '' else  FeeCascade.Mst_Desc end +
		case when CIF.FeeTypeDetail is null then '' when CIF.FeeTypeCascadeDetail = '0' and CIF.FeeTypeDetail is not null then CIF.FeeTypeDetail else ' - ' + CIF.FeeTypeDetail end as TypeOfFees, 
		--CourtType.Mst_Desc as "DESCRIPTION",
		--(select sum(FeeAmount) as FeeAmount from CaseInvoiceFees CIF where CIF.InvoiceId = CI.InvoiceId) as "INVOICE AMOUNT",
		CIF.FeeAmount as  "INVOICE AMOUNT",
		CI.InvoiceStatus,
		CASE WHEN CI.InvoiceStatus = '0' THEN NULL ELSE InvStatus.Mst_Desc END as "INVOICE STATUS",
		CC.ClientCode,
		CC.AgainstCode,
		CI.TransferDate,
		CASE WHEN CI.TransferType = '0' THEN NULL ELSE TransType.Mst_Desc END as "MODE OF PAYMENT",
		CI.TransferNumber,
		CASE WHEN CI.Credit_Account = '0' THEN NULL ELSE BA.Mst_Desc END as "DEPOSIT BANK",
		CASE WHEN CIF.InvClassification = '0' THEN NULL ELSE Classification.Mst_Desc END as "INVOICE CLASSIFICATION",
		CI.ExpectedFees,
		(Select sum(FeeAmount) as FeePaid from CaseInvoiceFees CIFP where CI.InvoiceId = CIFP.InvoiceId and CIFP.FeeTypeId = '9' and CI.InvoiceStatus = '2') as FeePaid
 FROM CaseInvoices CI
inner join CourtCases CC on CI.CaseId = CC.CaseId
inner join CaseInvoiceFees CIF on CI.InvoiceId = CIF.InvoiceId
left join MASTER_S as CaseSub on CaseSub.MstParentId = 532 and CaseSub.Mst_Value = CC.CaseSubject
left join MASTER_S as ODB on ODB.MstParentId = 18 and ODB.Mst_Value = CC.ODBBankBranch
left join MASTER_S as ClientCasType on ClientCasType.MstParentId = 285 and ClientCasType.Mst_Value = CC.ClientCaseType
left join MASTER_S as FeeDetail on FeeDetail.MstParentId = 232 and FeeDetail.Mst_Value = CIF.FeeTypeId
left join MASTER_S as InvStatus on InvStatus.MstParentId = 247 and InvStatus.Mst_Value = CI.InvoiceStatus
left join MASTER_S as FeeCascade on FeeCascade.Mst_Value = CIF.FeeTypeCascadeDetail and FeeCascade.MstParentId = 567
left join MASTER_S as CourtType on CourtType.Mst_Value = CI.CourtType and CourtType.MstParentId = 15
left join MASTER_S as CaseLevel on CaseLevel.Mst_Value = CIF.CaseLevel and CaseLevel.MstParentId = 15 
left join MASTER_S as ClientMast on ClientMast.Mst_Value = CC.ClientCode and ClientMast.MstParentId = 241 
left join MASTER_S as CaseType on CaseType.Mst_Value = CC.CaseTypeCode and CaseType.MstParentId = 14 
left join MASTER_S as CaseAgainst on CaseAgainst.Mst_Value = CC.AgainstCode and CaseAgainst.MstParentId = 12
left join MASTER_S as TransType on TransType.Mst_Value = CI.TransferType and TransType.MstParentId = 8
left join Link_Bank_Account_View as BA on BA.LinkId = CI.Credit_Account
left join MASTER_S as Classification on Classification.Mst_Value = CIF.InvClassification and Classification.MstParentId = 289
where 
	CC.ClientCode = '7'
and   
	LEFT(CC.OfficeFileNo,1) = 'S'
--where (LEFT(CC.OfficeFileNo,1) = @Location OR @Location = 'A')
----AND CAST(CI.InvoiceDate AS DATE) BETWEEN CAST(''' + CONVERT(NVARCHAR(24), @DateFrom, 101) + ''' AS DATE) AND CAST(''' + CONVERT(NVARCHAR(24), @DateTo, 101)  +''' AS DATE)
--AND CI.InvoiceDate BETWEEN @DateFrom AND @DateTo
--AND (CC.ClientCode = @ClientCode OR @ClientCode = '0')
--AND (CC.AgainstCode = @AgainstCode OR @AgainstCode = '0')
--AND (CC.ODBBankBranch = @ODBBankBranch OR @ODBBankBranch = '0')
--AND (CI.InvoiceStatus = @InvoiceStatus OR @InvoiceStatus = '0')
--AND (CC.ClientCaseType = @ClientCaseType OR @ClientCaseType = '0')
)DAT
order by 1


