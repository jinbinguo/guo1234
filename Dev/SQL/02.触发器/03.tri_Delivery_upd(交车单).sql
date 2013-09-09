drop trigger tri_Delivery_upd
go
create trigger tri_Delivery_upd
on t_ats_Delivery
for update
as
begin
/**
�߼�:
	1. ���������ʱ����д��Դ�������۶����Ľ���״̬�����³���״̬Ϊ���ѽ�����
	2. �����������ʱ����д��Դ�������۶����Ľ���״̬�����³���״̬Ϊ���ѳ��⡰
*/
	set nocount on;
	declare @isAudit bit = 0; --�Ƿ���˲���
	declare @isUnAdit bit = 0; --�Ƿ���˲���
	declare @oldStatus nvarchar(255); --�ɵ���״̬
	declare @newStatus nvarchar(255); --�µ���״̬
	declare @interId int; --��������
	declare @sourceInterId int; --��Դ������
	declare @sourceEntryId int; --��Դ����¼����
	declare @sourceTranType int; --��Դ�������� 200000028->�������۶���
	declare @isIssue bit; --�Ƿ��ѳ���
	declare @isDelivery bit; --�Ƿ��ѽ���
	declare @vehicleId int; --����ID
	
	declare cur cursor local for select FID,FMultiCheckStatus from inserted;
	open cur;
	fetch cur into @interId,@newStatus
	while (@@FETCH_STATUS=0)
	begin
		select @oldStatus = isnull(FMultiCheckStatus,'') from deleted where FID = @interId;
		if (@newStatus = '16' and @oldStatus <> '16') 
		begin 
			set @isAudit = 1; 
			--���½������������
			update t_ats_Delivery
			set FAuditTime = GETDATE()
			where FID = @interId;
		end;
		if (@newStatus <> '16' and @oldStatus = '16')
		begin
			set @isUnAdit = 1;
			--���½������������
			update t_ats_Delivery
			set FAuditTime = null
			where FID = @interId;
		end;
		
		--��Դ��[�������۶���]��[������]����뷴��˲�����д[�������۶���]��[����]
		if (@isAudit = 1 or @isUnAdit = 1)--��˻����
		begin
			declare cur1 cursor local for select FID_Src,FEntryID_Src,FClassID_Src,FVehicleId from t_ats_DeliveryEntry where FID=@interId;
			open cur1;
			fetch cur1 into @sourceInterId,@sourceEntryId,@sourceTranType,@vehicleId
			while (@@FETCH_STATUS = 0)
			begin
				if (@isAudit=1 and @sourceTranType = 200000028 ) --���
				begin
					select @isDelivery = FIsDelivery from T_ATS_VehicleSaleOrderEntry where FID=@sourceInterId and FEntryID=@sourceEntryId;
					if (@isDelivery=1) raiserror('�����ѽ�������������˽�����',16,1)
					--��д�������۶�������״̬Ϊ���ѽ�����
					update T_ATS_VehicleSaleOrderEntry
					set FIsDelivery = 1
					where FID=@sourceInterId and FEntryID=@sourceEntryId;
					--���³���״̬Ϊ���ѽ�����
					update t_ats_vehicle
					set FVehicleStatus = '4'
					where FID=@vehicleId;
				end
				else if (@isUnAdit = 1 and @sourceTranType = 200000028 ) --�����
				begin
					--��д�������۶�������״̬Ϊ��δ���⡱
					update T_ATS_VehicleSaleOrderEntry
					set FIsDelivery = 0
					where FID=@sourceInterId and FEntryID=@sourceEntryId 
					--���³���״̬Ϊ���ѳ��⡱
					update t_ats_vehicle
					set FVehicleStatus = '3'
					where FID=@vehicleId;
				end

				fetch next from cur1 into @sourceInterId,@sourceEntryId,@sourceTranType,@vehicleId
			end;
			
			close cur1;
			deallocate cur1;
			
	
		end;

		set @isAudit = 0;
		set @isUnAdit = 0;
		fetch next from cur into @interId,@newStatus
	end;
	close cur;
	deallocate cur;

end


