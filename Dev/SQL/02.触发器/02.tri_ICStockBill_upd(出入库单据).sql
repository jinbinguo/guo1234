drop trigger tri_ICStockBill_upd
go
create trigger tri_ICStockBill_upd
on ICStockBill
for update
as
begin
/**
�߼���
1. �������۳��ⵥ���ʱ����д�������۶�����������״̬�����������������Ϊ���ѳ��⡰״̬
2. �������۳��ⵥ�����ʱ����д�������۶��������䳵״̬�����������������Ϊ�����䳵��״̬
*/
	set nocount on;
	declare @isAudit bit = 0; --�Ƿ���˲���
	declare @isUnAudit bit = 0; --�Ƿ���˲���
	declare @tranType int; --��������:21->���۳��ⵥ
	declare @oldStatus smallint; --�ɵ���״̬
	declare @newStatus smallint; --�µ���״̬
	declare @interId int; --��������
	declare @sourceInterId int; --��Դ������
	declare @sourceEntryId int; --��Դ����¼����
	declare @sourceTranType int; --��Դ�������� 200000028->�������۶���
	declare @isIssue bit; --�Ƿ��ѳ���
	declare @isDelivery bit; --�Ƿ��ѽ���
	declare @vehicleId int; --����ID
	declare @stockId int; --�ֿ�ID
	
	declare cur cursor local for select FInterID,FTranType,FStatus from inserted;
	open cur;
	fetch cur into @interId,@tranType,@newStatus
	while (@@FETCH_STATUS=0)
	begin
		select @oldStatus = FStatus from deleted where FInterID = @interId;
		if (@newStatus = 1 and @oldStatus = 0) 
		begin 
			set @isAudit = 1; 
		end;
		if (@newStatus = 0 and @oldStatus = 1)
		begin
			set @isUnAudit = 1;
		end;
		--��Դ��[�������۶���]��[���۳���]����뷴��˲�����д[�������۶���]��[����]
		if (@tranType = 21 and (@isAudit = 1 or @isUnAudit = 1))--���۳��ⵥ
		begin
			declare cur1 cursor local for select FSourceInterId,FSourceEntryId,FSourceTranType,FVehicleId from ICStockBillEntry where FInterId=@interId;
			open cur1;
			fetch cur1 into @sourceInterId,@sourceEntryId,@sourceTranType,@vehicleId
			while (@@FETCH_STATUS = 0)
			begin
				if (@isAudit=1 and @sourceTranType = 200000028 ) --���
				begin
					select @isIssue = FIsIssue from T_ATS_VehicleSaleOrderEntry where FID=@sourceInterId and FEntryID=@sourceEntryId;
					if (@isIssue=1) raiserror('�����ѳ��⣬��������˳��ⵥ',16,1)
					--��д�������۶�������״̬Ϊ���ѳ��⡱
					update T_ATS_VehicleSaleOrderEntry
					set FIsIssue = 1
					where FID=@sourceInterId and FEntryID=@sourceEntryId;
					--���³���״̬Ϊ���ѳ��⡱
					update t_ats_vehicle
					set FVehicleStatus = '3'
					where FID=@vehicleId;
				end
				else if (@isUnAudit = 1 and @sourceTranType = 200000028 ) --�����
				begin
					select @isDelivery=FIsDelivery from T_ATS_VehicleSaleOrderEntry where FID=@sourceInterId and FEntryID=@sourceEntryId;
					if (@isDelivery = 1) raiserror('�����ѽ�������������˳��ⵥ',16,1)
					--��д�������۶�������״̬Ϊ��δ���⡱
					update T_ATS_VehicleSaleOrderEntry
					set FIsIssue = 0
					where FID=@sourceInterId and FEntryID=@sourceEntryId 
					--���³���״̬Ϊ���ѷ��䡱
					update t_ats_vehicle
					set FVehicleStatus = '2'
					where FID=@vehicleId;
				end

				fetch next from cur1 into @sourceInterId,@sourceEntryId,@sourceTranType,@vehicleId
			end;
			
			close cur1;
			deallocate cur1;	
		end;
		
		--�⹺��ⵥ
		if (@tranType = 1 and (@isAudit = 1 or @isUnAudit =1))
		begin
			declare cur1 cursor local for select FSourceInterId,FSourceEntryId,FSourceTranType,FVehicleId,FDCStockID from ICStockBillEntry where FInterId=@interId;
			open cur1;
			fetch cur1 into @sourceInterId,@sourceEntryId,@sourceTranType,@vehicleId,@stockId
			while (@@FETCH_STATUS =0)
			begin
				if (@vehicleId > 0 and @isAudit = 1)
				begin
				--���²ɹ�����
					update T_ATS_VehiclePurOrderEntry
					set FOnRoadStatus = '2'
					where FVehicleID = @vehicleId
				
				--���³���
					update t_ats_vehicle
					set FStockID= @stockId
					where FID=@vehicleId
				end 
				
				fetch next from cur1 into @sourceInterId,@sourceEntryId,@sourceTranType,@vehicleId,@stockId
			end;
			close cur1;
			deallocate cur1;
			
			
		end;
		

		set @isAudit = 0;
		set @isUnAudit = 0;
		fetch next from cur into @interId,@tranType,@newStatus
	end;
	close cur;
	deallocate cur;
end

 
