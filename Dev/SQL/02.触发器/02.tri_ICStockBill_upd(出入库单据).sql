drop trigger tri_ICStockBill_upd
go
create trigger tri_ICStockBill_upd
on ICStockBill
for update
as
begin
/**
逻辑：
1. 整车销售出库单审核时，反写整车销售订单车辆出库状态，并将车辆档案标记为“已出库“状态
2. 整车销售出库单反审核时，反写整车销售订单车辆配车状态，并将车辆档案标记为“已配车“状态
*/
	set nocount on;
	declare @isAudit bit = 0; --是否审核操作
	declare @isUnAudit bit = 0; --是否反审核操作
	declare @tranType int; --事务类型:21->销售出库单
	declare @oldStatus smallint; --旧单据状态
	declare @newStatus smallint; --新单据状态
	declare @interId int; --单据内码
	declare @sourceInterId int; --来源单内码
	declare @sourceEntryId int; --来源单分录内码
	declare @sourceTranType int; --来源单据类型 200000028->整车销售订单
	declare @isIssue bit; --是否已出库
	declare @isDelivery bit; --是否已交车
	declare @vehicleId int; --车辆ID
	declare @stockId int; --仓库ID
	
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
		--来源自[整车销售订单]的[销售出库]审核与反审核操作后反写[整车销售订单]、[车辆]
		if (@tranType = 21 and (@isAudit = 1 or @isUnAudit = 1))--销售出库单
		begin
			declare cur1 cursor local for select FSourceInterId,FSourceEntryId,FSourceTranType,FVehicleId from ICStockBillEntry where FInterId=@interId;
			open cur1;
			fetch cur1 into @sourceInterId,@sourceEntryId,@sourceTranType,@vehicleId
			while (@@FETCH_STATUS = 0)
			begin
				if (@isAudit=1 and @sourceTranType = 200000028 ) --审核
				begin
					select @isIssue = FIsIssue from T_ATS_VehicleSaleOrderEntry where FID=@sourceInterId and FEntryID=@sourceEntryId;
					if (@isIssue=1) raiserror('车辆已出库，不允许审核出库单',16,1)
					--反写整车销售订单出库状态为“已出库”
					update T_ATS_VehicleSaleOrderEntry
					set FIsIssue = 1
					where FID=@sourceInterId and FEntryID=@sourceEntryId;
					--更新车辆状态为“已出库”
					update t_ats_vehicle
					set FVehicleStatus = '3'
					where FID=@vehicleId;
				end
				else if (@isUnAudit = 1 and @sourceTranType = 200000028 ) --反审核
				begin
					select @isDelivery=FIsDelivery from T_ATS_VehicleSaleOrderEntry where FID=@sourceInterId and FEntryID=@sourceEntryId;
					if (@isDelivery = 1) raiserror('车辆已交车，不允许反审核出库单',16,1)
					--反写整车销售订单出库状态为“未出库”
					update T_ATS_VehicleSaleOrderEntry
					set FIsIssue = 0
					where FID=@sourceInterId and FEntryID=@sourceEntryId 
					--更新车辆状态为“已分配”
					update t_ats_vehicle
					set FVehicleStatus = '2'
					where FID=@vehicleId;
				end

				fetch next from cur1 into @sourceInterId,@sourceEntryId,@sourceTranType,@vehicleId
			end;
			
			close cur1;
			deallocate cur1;	
		end;
		
		--外购入库单
		if (@tranType = 1 and (@isAudit = 1 or @isUnAudit =1))
		begin
			declare cur1 cursor local for select FSourceInterId,FSourceEntryId,FSourceTranType,FVehicleId,FDCStockID from ICStockBillEntry where FInterId=@interId;
			open cur1;
			fetch cur1 into @sourceInterId,@sourceEntryId,@sourceTranType,@vehicleId,@stockId
			while (@@FETCH_STATUS =0)
			begin
				if (@vehicleId > 0 and @isAudit = 1)
				begin
				--更新采购订单
					update T_ATS_VehiclePurOrderEntry
					set FOnRoadStatus = '2'
					where FVehicleID = @vehicleId
				
				--更新车辆
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

 
