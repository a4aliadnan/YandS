 SELECT Voucher_No,PV_No,Voucher_Date,Amount,Remarks,Payment_Head_Remarks,Payment_To,Payment_Head,
  SUM(cast(Payment_Head_Remarks as int)) OVER(ORDER BY Voucher_No 
     ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
          AS RunningTotal
from PayVoucher
where Payment_To = '6'
and   Payment_Head = '5';

SELECT Voucher_No,PV_No,Voucher_Date,Amount,Remarks,Payment_Head_Remarks,Payment_To,Payment_Head,
  RunningTotal = SUM(cast(Payment_Head_Remarks as int)) OVER (ORDER BY Voucher_No desc ROWS UNBOUNDED PRECEDING)
from PayVoucher
where Payment_To = '6'
and   Payment_Head = '5';

SELECT Voucher_No,PV_No,Voucher_Date,Amount,Remarks,Payment_Head_Remarks,Payment_To,hr.FullName,Payment_Head,
		cast(Payment_Head_Remarks as int) - ISNULL(v.value, 0) AS result
from PayVoucher as PV
    OUTER APPLY (
        SELECT TOP (1) cast(Payment_Head_Remarks as int) value
        from PayVoucher
		where Payment_To = '6'
		and   Payment_Head = '5'
	    AND   Voucher_No < PV.Voucher_No
        ORDER by Voucher_No DESC
    ) v
join HR_Employee_s HR on PV.Payment_To = HR.EmployeeNumber
where Payment_To = '6'
and   Payment_Head = '5'
