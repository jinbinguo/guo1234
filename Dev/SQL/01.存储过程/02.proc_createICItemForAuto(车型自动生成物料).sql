SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		jinbin_guo
-- Create date: 2013-7-27
-- Description:	�����Զ���������
-- =============================================
alter PROCEDURE proc_createICItemForAuto
	@modelId int,@userId int
AS
BEGIN
	SET NOCOUNT ON;
	begin tran
	begin try
	declare @itemID int;
	exec GetICMaxNum 'T_Item',@itemId output; --��������
	declare @itemClassID int; --���Ϸ���ID
	declare @name varchar(80); --��������
	declare @cfgDesc varchar(255); --��������˵��
	declare @unitID int; --������λ
	declare @unitGroupID int; --������λ��
	declare @acctID int; --�����Ŀ����
	declare @saleAcctID int; --���������Ŀ����
	declare @costAcctID int; --���۳ɱ���Ŀ����
	declare @purPrice decimal(28,10); --�ɹ�����
	declare @salePrice decimal(28,10); --���۵���
	declare @taxRate decimal(28,10); --˰��
	declare @icitemClassFullName varchar(255); --���Ϸ���ȫ��
	declare @icitemClassLevel int; ----���Ϸ��༶��
	declare @fullname varchar(255); --����ȫ��
	declare @icitemNum varchar(50); --���ϴ���
	declare @unitNum varchar(50); --������λ����
	
	select @itemClassID = FICItemClassID,@name=FName,@purPrice=FTaxPrice from t_ats_model where FID=@modelId;
	declare @icitemShortNum varchar(80);
	exec proc_getModelICItemNum @itemClassId,@icitemNum output,@icitemShortNum output; --���ϴ���
	
	select top 1 @unitID=a.FUnitID,@unitNum=b.FNumber,@unitGroupID=b.FParentID,@acctID=FAcctID,
		@saleAcctID=FSaleAcctID,@costAcctID=FCostAcctID,@taxRate=FTaxRate from T_ATS_ModelICItemConfig a
		left join v_ats_unittree b on a.FUnitID=b.fid;
	select @icitemClassFullName=FFullName,@icitemClassLevel=FLevel from t_Item where FItemID=@itemClassID;
	set @fullname = @icitemClassFullName + '_'  + @name;

	--select * from t_item where FItemId=2598 --
	--select * from t_ICItemCore where FItemID=2598  --���Ϻ�������
	--select * from t_ICItemBase where FItemID=2598  ---���ϻ�������ҳǩ
	--select * from t_ICItemMaterial where FItemID=2598  --������������ҳǩ
	--select * from t_ICItemPlan where FItemID=2598  --���ϼƻ�����ҳǩ
	--select * from t_ICItemDesign where FItemID=2598  --�������\��������ҳǩ
	--select * from t_ICItemStandard  where FItemID=2598  --���ϱ�׼����ҳǩ
	--select * from t_ICItemQuality where FItemID=2598  --������������ҳǩ
	--select * from T_BASE_ICItemEntrance where FItemID=2598  --���Ͻ���������ҳǩ
	--select * from t_ICItemCustom where FItemID=2598  --�����Զ�������ҳǩ
	insert into t_Item(FItemID,FItemClassID,FExternID,FNumber,
		FParentID,FLevel,FDetail,FName,FUnUsed,
		FBrNo,FFullNumber,FDiff,FDeleted,FShortNumber,
		FFullName,UUID,FGRCommonID,FSystemType,FUseSign,
		FChkUserID,FAccessory,FGrControl,FHavePicture)
	values(@itemID,4,-1,@icitemNum,
		@itemClassID,ISNULL(@icitemClassLevel,0)+1,1,@name,0,
		0,@icitemNum,0,0,@icitemShortNum,
		@fullname,NEWID(),-1,1,0,
		@userId,0,-1,0);

	--���Ϻ�������
	insert into t_ICItemCore(FItemID,FModel,FName,FHelpCode,FDeleted,
		FShortNumber,FNumber,FParentID,FBrNo,FTopID,
		FRP,FOmortize,FOmortizeScale,FForSale,FStaCost,
		FOrderPrice,FOrderMethod,FPriceFixingType,FSalePriceFixingType,FPerWastage,
		FARAcctID,FPlanPriceMethod,FPlanClass)
	values(@itemID,@cfgDesc,@name,null,0,
		@icitemShortNum,@icitemNum,@itemClassID,0,0,
		0,null,null,0,null,
		@purPrice ,null,null,null,0,
		null,null,null);
			
	--���ϻ�������ҳǩ
	insert into t_ICItemBase(FItemID,FErpClsID,FUnitID,FUnitGroupID,FDefaultLoc,
		FSPID,FSource,FQtyDecimal,FLowLimit,FHighLimit,
		FSecInv,FUseState,FIsEquipment,FEquipmentNum,FIsSparePart,
		FFullName,FSecUnitID,FSecCoefficient,FSecUnitDecimal,FAlias,
		FOrderUnitID,FSaleUnitID,FStoreUnitID,FProductUnitID,FApproveNo,
		FAuxClassID,FTypeID,FPreDeadLine,FSerialClassID,FDefaultReadyLoc,FSPIDReady)
	values (@itemID,1,@unitID,@unitGroupID,0,
			0,0,0,0,1000,
			0,341,0,null,0,
			@name,0,0,0,null,
			@unitID,@unitID,@unitID,@unitID,null,
			0,0,null,0,0,0);
	
	--������������ҳǩ
	insert into t_ICItemMaterial(FItemID,FOrderRector,FPOHghPrcMnyType,FPOHighPrice,FWWHghPrc,
		FWWHghPrcMnyType,FSOLowPrc,FSOLowPrcMnyType,FIsSale,
		FProfitRate,FSalePrice,FBatchManager,FISKFPeriod,FKFPeriod,
		FTrack,FPlanPrice,FPriceDecimal,FAcctID,FSaleAcctID,
		FCostAcctID,FAPAcctID,FGoodSpec,FCostProject,FIsSnManage,
		FStockTime,FBookPlan,FBeforeExpire,FTaxRate,FAdminAcctID,
		FNote,FIsSpecialTax,FSOHighLimit,FSOLowLimit,FOIHighLimit,
		FOILowLimit,FDaysPer,FLastCheckDate,FCheckCycle,FCheckCycUnit,
		FStockPrice,FABCCls,FBatchQty,FClass,FCostDiffRate,
		FDepartment,FSaleTaxAcctID,FCBBmStandardID,FCBRestore,FPickHighLimit,FPickLowLimit)
	values (@itemID,0,1,0,0,
		1,0,1,0,
		0,@salePrice,0,0,0,
		76,0,2,@acctID,@saleAcctID,
		@costAcctID,0,0,0,0,
		0,0,0,@taxRate,0,
		null,0,0,0,0,
		0,null,null,null,0,
		0,null,null,0,null,
		0,null,0,1,0,0);
	
	--���ϼƻ�����ҳǩ
	insert into t_ICItemPlan(FItemID,FPlanTrategy,FOrderTrategy,FLeadTime,FFixLeadTime,
		FTotalTQQ,FQtyMin,FQtyMax,FCUUnitID,FOrderInterVal,
		FBatchAppendQty,FOrderPoint,FBatFixEconomy,FBatChangeEconomy,
		FRequirePoint,FPlanPoint,FDefaultRoutingID,FDefaultWorkTypeID,FProductPrincipal,
		FDailyConsume,FMRPCon,FPlanner,FPutInteger,FInHighLimit,
		FInLowLimit,FLowestBomCode,FMRPOrder,FIsCharSourceItem,FCharSourceItemID,
		FPlanMode,FCtrlType,FCtrlStraregy,FContainerName,FKanBanCapability,
		FIsBackFlush,FBackFlushStockID,FBatchSplitDays,FBatchSplit,FIsFixedReOrder)
	values (@itemID,321,333,0,0,
			0,0,100000,0,0,
			0,0,1,1,
			1,1,0,0,0,
			0,1,0,0,0,
			0,null,0,0,null,
			14035,14039,0,null,1, --��������ƻ�(MRP),MTO�ƻ�ģʽ
			0,0,0,0,1);
	
	--�������\��������ҳǩ	
	insert into t_ICItemDesign(FItemID,FChartNumber,FIsKeyItem,FMaund,FGrossWeight,
		FNetWeight,FCubicMeasure,FLength,FWidth,FHeight,
		FSize,FVersion,FStartService,FMakeFile,FIsFix,
		FTtermOfService,FTtermOfUsefulTime)
	values (@itemID,null,0,0,0,
		0,0,0,0,0,
		0,null,0,0,0,
		0,0);
	
	--���ϱ�׼����ҳǩ
	insert into t_ICItemStandard(FItemID,FStandardCost,FStandardManHour,FStdPayRate,
		FChgFeeRate,FStdFixFeeRate,FOutMachFee,FPieceRate,
		FStdBatchQty,FPOVAcctID,FPIVAcctID,FMCVAcctID,
		FPCVAcctID,FSLAcctID,FCAVAcctID,FCBAppendRate,FCBAppendProject,
		FCostBomID,FCBRouting,FOutMachFeeProject)
	values (@itemID,0,0,0,
		0,0,0,0,
		1,0,0,0,
		0,0,0,0,0,
		0,0,0);
	
	 --������������ҳǩ
	 insert into t_ICItemQuality(FItemID,FInspectionLevel,FInspectionProject,FIsListControl,FProChkMde,
		FWWChkMde,FSOChkMde,FWthDrwChkMde,FStkChkMde,FOtherChkMde,
		FStkChkPrd,FStkChkAlrm,FIdentifier,FSampStdCritical,FSampStdStrict,FSampStdSlight)
	values (@itemID,352,0,null,352,
	352,352,352,352,352,
	9999,0,0,0,0,0);
	
	--���Ͻ���������ҳǩ
	insert into T_BASE_ICItemEntrance(FItemID,FNameEn,FModelEn,FHSNumber,FFirstUnit,
		FSecondUnit,FFirstUnitRate,FSecondUnitRate,FIsManage,FPackType,
		FLenDecimal,FCubageDecimal,FWeightDecimal,FImpostTaxRate,FConsumeTaxRate,
		FManageType,FExportRate)
	values (@itemID,null,null,0,null,
		null,0,0,0,null,
		2,4,2,0,0,
		0,0); 
	
	--�����Զ�������ҳǩ
	insert into t_ICItemCustom(FItemID)
	values( @itemId); 
	
	update t_ICItem
	set FItemID=FItemID
	where FItemID=@itemID;
	
	if @@error = 0
		commit;
	else rollback;
	end try
	begin catch
		declare @errorMsg varchar(4000);
		select @errorMsg=ERROR_MESSAGE();
		raiserror (@errorMsg,16,1)
		rollback;
	end catch
	
	select @icitemNum,@unitNum 
END
GO


