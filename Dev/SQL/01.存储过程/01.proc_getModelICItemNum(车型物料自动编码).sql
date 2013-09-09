SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE proc_getModelICItemNum
	@icitemClassID int, --���Ϸ���ID
	@icitemNum varchar(80) output, --���ϴ���
	@icitemShortNum varchar(80) output, --���϶̴���
	@shortNumLength int =4 --���϶̴��볤��
AS
BEGIN
	SET NOCOUNT ON;
	declare @currentValue int;
	declare @currentShortNumLength int
	declare @icitemClassNum varchar(80);
	if OBJECT_ID('T_ATS_ModelICItemMaxNum') is null 
	begin
		create table T_ATS_ModelICItemMaxNum(
			FICItemClassID int, --���Ϸ���ID
			FValue	int, --����������ֵ
			FShortNumLength int) --���϶̴��볤��
		commit;	
	end;
	begin tran
	begin try
	select @icitemClassNum=FNumber from V_ATS_ICItemClass where FID=@icitemClassID;
	select @currentValue=FValue,@currentShortNumLength=FShortNumLength from T_ATS_ModelICItemMaxNum where FICItemClassID=@icitemClassID;
	if @currentValue is null
	begin 
		set @currentShortNumLength = @shortNumLength
		set @currentValue =  1
		insert into T_ATS_ModelICItemMaxNum(FICItemClassID,FValue,FShortNumLength)
			values(@icitemClassID,@currentValue,@currentShortNumLength);
	end;
	else
	begin
		if @currentShortNumLength <> @shortNumLength
		begin 
			raiserror ('���������쳣,�̴��볤��ǰ��һ��',16,1);
		end;	
		set @currentValue = @currentValue + 1;
		update T_ATS_ModelICItemMaxNum
		set FValue = @currentValue
		where FICItemClassID = @icitemClassID;
	end;
	
	declare @currentValueLength int
	set @currentValueLength = LEN(@currentValue);
	set @icitemShortNum = REPLICATE('0',@currentShortNumLength-@currentValueLength) + cast(@currentValue as varchar(10));
	select @icitemNum = @icitemClassNum + '.' + @icitemShortNum
	
	if @@ERROR = 0
		commit;
	else rollback;
	
	end try
	begin catch
		declare @errorMsg varchar(4000);
		select @errorMsg=ERROR_MESSAGE();
		raiserror (@errorMsg,16,1)
		rollback;
	end catch
END




