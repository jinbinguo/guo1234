drop trigger tri_VehiclePurCheck_upd
go
create trigger tri_VehiclePurCheck_upd
on t_ats_vehiclePurCheck
for update
as
begin
/**
�߼�:

*/
	set nocount on;
	declare @isAudit bit = 0; --�Ƿ���˲���
	declare @isUnAudit bit = 0; --�Ƿ���˲���
	declare @oldStatus nvarchar(255); --�ɵ���״̬
	declare @newStatus nvarchar(255); --�µ���״̬
	declare @interId int; --��������
	declare @entryId int; --���ݷ�¼����
	declare @sourceInterId int; --Դ������
	declare @sourceEntryId int; --Դ����¼����
	declare @vehicleId int; --��������
	declare @vehicleNo varchar(80); --��������

	declare cur cursor local for select FID,FMultiCheckStatus from inserted;
	open cur;
	fetch cur into @interId,@newStatus
	while (@@FETCH_STATUS=0)
	begin
		select @oldStatus = isnull(FMultiCheckStatus,'') from deleted where FID = @interId;
		if (@newStatus = '16' and @oldStatus <> '16') 
		begin 
			set @isAudit = 1; 
		end;
		if (@newStatus <> '16' and @oldStatus = '16')
		begin
			set @isUnAudit = 1;
		end;
		if (@isAudit = 1 or @isUnAudit = 1)--��˻����
		begin	
			declare cur1 cursor local for select FID_SRC,FEntryID_SRC,FVehicleID,FEntryID from t_ats_vehiclePurCheckEntry where FID=@interId
			open cur1;
			fetch cur1 into @sourceInterId,@sourceEntryId,@vehicleId,@entryId
			while (@@FETCH_STATUS = 0)
			begin
				if (@isAudit=1) --���
				begin
					--����/���³���
					if @vehicleId is not null and @vehicleId >0
					begin
					   update a
					   set a.FModelID = b.FModelID,
					   a.FCfgDesc=c.FCfgDesc,
					   a.FVIN=b.FVin,
					   a.FEngineNum=b.FEngineNum,
					   a.FInteriorID=b.FInteriorID,
					   a.FColorID=b.FColorID,
					   a.FOptional=b.FOptional
					   from t_ats_vehicle a
					   left join t_ats_vehiclePurCheckEntry b on b.FVehicleID=a.FID
					   left join T_ATS_Model c on c.FID=b.FModelID and c.FID<>0
					   where a.FID=@vehicleId 
					end else begin				
						exec GetICMaxNum 't_ats_vehicle',@vehicleId output
						exec p_BM_GetBillNo 200000022,@vehicleNo output,0,0
						--��������
						
						insert into t_ats_vehicle(FID,FClassTypeID,FModelID,FCfgDesc,FVehicleStatus,
						FVIN,FEngineNum,FBillNo,FPlateNum,FPlateColor,
						FNOTE,FVehicleCreateType,FOptional,FInteriorID,FColorID,
						FIsDecoration,FStatus,FStockID)
						select @vehicleId,200000022,FModelID,b.FCfgDesc,'0',
						a.FVin,a.FEngineNum,@vehicleNo,'','',
						'','2',a.FOptional,a.FInteriorID,a.FColorID,
						0,'2',0
						from t_ats_vehiclePurCheckEntry a 
						left join t_ats_model b on b.fid=a.FModelID and b.FID<>0
						  where a.FID=@interId and a.FEntryID=@entryId;
					end
					--�������յ�
					update t_ats_vehiclePurCheckEntry 
					set FVehicleID = @vehicleId
					where FID=@interId AND FEntryId=@entryId
					 
					--���²ɹ�����
					update a
					set a.FVehicleID=b.FVehicleID,
						a.FModelID=b.FModelID,
						a.FSeriesID=c.FSeriesID,
						a.FInteriorID=b.FInteriorID,
						a.FColorID=b.FColorID,
						a.FOptional=b.FOptional,
						a.FVin=b.FVin,
						a.FEngineNum=b.FEngineNum,
						a.FIsAccept = 1
					from T_ATS_VehiclePurOrderEntry a
					left join t_ats_vehiclePurCheckEntry b on b.FID_SRC=a.FID and b.FEntryID_SRC=a.FEntryID 
						and b.FClassID_SRC=200000023 and b.FID<>0
					left join v_ats_model c on c.FID=b.FModelID and c.FID<>0
					where a.FID=@sourceInterId AND a.FEntryId=@sourceEntryId
				end
				fetch next from cur1 into @sourceInterId,@sourceEntryId,@vehicleId,@entryId
			end;
			close cur1;
			deallocate cur1;

		end;

		set @isAudit = 0;
		set @isUnAudit = 0;
		fetch next from cur into @interId,@newStatus
	end;
	close cur;
	deallocate cur;

end


