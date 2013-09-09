--4S建模
delete t_DataFlowTopClass where FTopClassID=800
INSERT INTO t_DataFlowTopClass(FTopClassID,FTopClassName,FTopClassName_EN,FTopClassName_CHT,FIndex,
					FVisible,FAcctType,FToolTips,FToolTips_CHT ,FToolTips_EN,
					FShowSysType)
values (800,'4S建模','4S建模','4S建模',0,
		1,',1,',null,null,null,
		1)
		
--4S建模_基础资料
delete t_DataFlowSubSystem where FSubSysID=8000
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8000,'基础资料','基础资料','基础资料',800,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8000,
     1,'','')
	 
--4S建模_基础资料_排量
delete t_DataFlowSubFunc where FSubFuncID = 800000
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800000,8000,1,'排量','排量',
			'排量','K3BOSActive.Application','Base|200000009',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_排量_排量-维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80000000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000000,'排量-维护','排量-维护','排量-维护',800000,
			1,'K3BOSActive.Application','Base|200000009',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000009',
			'newtab','base')
--4S建模_基础资料_变速箱
delete t_DataFlowSubFunc where FSubFuncID = 800001
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800001,8000,2,'变速箱','变速箱',
			'变速箱','K3BOSActive.Application','Base|200000012',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_变速箱_变速箱-维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80000100
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000100,'变速箱-维护','变速箱-维护','变速箱-维护',800001,
			1,'K3BOSActive.Application','Base|200000012',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000012',
			'newtab','base')
			
--4S建模_基础资料_驱动形式
delete t_DataFlowSubFunc where FSubFuncID = 800003
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800003,8000,4,'驱动形式','驱动形式',
			'驱动形式','K3BOSActive.Application','Base|200000014',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_驱动形式_驱动形式-维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80000300
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000300,'驱动形式-维护','驱动形式-维护','驱动形式-维护',800003,
			1,'K3BOSActive.Application','Base|200000014',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000014',
			'newtab','base')
--4S建模_基础资料_动力形式
delete t_DataFlowSubFunc where FSubFuncID = 800004
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800004,8000,5,'动力形式','动力形式',
			'动力形式','K3BOSActive.Application','Base|200000015',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_动力形式_动力形式-维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80000400
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000400,'动力形式-维护','动力形式-维护','动力形式-维护',800004,
			1,'K3BOSActive.Application','Base|200000015',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000015',
			'newtab','base')
--4S建模_基础资料_车辆分类
delete t_DataFlowSubFunc where FSubFuncID = 800005
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800005,8000,6,'车辆分类','车辆分类',
			'车辆分类','K3BOSActive.Application','Base|200000016',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_车辆分类_车辆分类-维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80000500
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000500,'车辆分类-维护','车辆分类-维护','车辆分类-维护',800005,
			1,'K3BOSActive.Application','Base|200000016',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000016',
			'newtab','base')
--4S建模_基础资料_品牌
delete t_DataFlowSubFunc where FSubFuncID = 800006
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800006,8000,7,'品牌','品牌',
			'品牌','K3BOSActive.Application','Base|200000011',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_品牌_品牌-维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80000600
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000600,'品牌-维护','品牌-维护','品牌-维护',800006,
			1,'K3BOSActive.Application','Base|200000011',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000011',
			'newtab','base')
--4S建模_基础资料_车型来源
delete t_DataFlowSubFunc where FSubFuncID = 800007
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800007,8000,8,'车型来源','车型来源',
			'车型来源','K3BOSActive.Application','Base|200000020',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_车型来源_车型来源-维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80000700
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000700,'车型来源-维护','车型来源-维护','车型来源-维护',800007,
			1,'K3BOSActive.Application','Base|200000020',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000020',
			'newtab','base')
--4S建模_基础资料_车系
delete t_DataFlowSubFunc where FSubFuncID = 800008
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800008,8000,9,'车系','车系',
			'车系','K3BOSActive.Application','List|200000019',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_车系_车系-维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80000800
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000800,'车系-维护','车系-维护','车系-维护',800008,
			1,'K3BOSActive.Application','List|200000019',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000019',
			'newtab','list')

--4S建模_基础资料_车型
delete t_DataFlowSubFunc where FSubFuncID = 800009
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800009,8000,10,'车型','车型',
			'车型','K3BOSActive.Application','List|200000021',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_车型_车型 - 维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80000900
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000900,'车型 - 维护','车型 - 维护','车型 - 维护',800009,
			1,'K3BOSActive.Application','List|200000021',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000021',
			'newtab','list')

--4S建模_基础资料_车辆档案
delete t_DataFlowSubFunc where FSubFuncID = 800010
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800010,8000,11,'车辆档案','车辆档案',
			'车辆档案','K3BOSActive.Application','List|200000022',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_车辆档案_车辆档案 - 维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80001000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80001000,'车辆档案 - 维护','车辆档案 - 维护','车辆档案 - 维护',800010,
			1,'K3BOSActive.Application','List|200000022',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000022',
			'newtab','list')

--4S建模_基础资料_购车用途
delete t_DataFlowSubFunc where FSubFuncID = 800011
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800011,8000,1,'购车用途','购车用途',
			'购车用途','K3BOSActive.Application','Base|200000035',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_基础资料_购车用途_购车用途-维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80001100
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80001100,'购车用途-维护','购车用途-维护','购车用途-维护',800011,
			1,'K3BOSActive.Application','Base|200000035',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000035',
			'newtab','base')
			
			
--4S建模_系统设置
delete t_DataFlowSubSystem where FSubSysID=8001
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8001,'系统设置','系统设置','系统设置',800,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8001,
     1,'','')
	 
--4S建模_系统设置_车型物料配置
delete t_DataFlowSubFunc where FSubFuncID = 800100
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800100,8001,1,'车型物料配置','车型物料配置',
			'车型物料配置','K3BOSActive.Application','Base|200000033',1,'',
			0,0,0,null,1,
			1,'','')
--4S建模_系统设置_车型物料配置_车型物料配置-维护
delete t_DataFlowDetailFunc where FDetailFuncID = 80001000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80001000,'车型物料配置-维护','车型物料配置-维护','车型物料配置-维护',800100,
			1,'K3BOSActive.Application','Base|200000033',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000033',
			'newtab','base')

			

---整车管理
delete t_DataFlowTopClass where FTopClassID=801
INSERT INTO t_DataFlowTopClass(FTopClassID,FTopClassName,FTopClassName_EN,FTopClassName_CHT,FIndex,
					FVisible,FAcctType,FToolTips,FToolTips_CHT ,FToolTips_EN,
					FShowSysType)
values (801,'整车管理','整车管理','整车管理',0,
		1,',1,',null,null,null,
		1)
		
--整车管理_整车采购
delete t_DataFlowSubSystem where FSubSysID=8011
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8011,'整车采购','整车采购','整车采购',801,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8011,
     1,'','')
	 
--整车管理_整车采购_采购业务
delete t_DataFlowSubFunc where FSubFuncID = 801100
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801100,8011,1,'采购业务','采购业务',
			'采购业务','','',1,'',
			0,0,0,null,0,
			1,'','')	 
			
--整车管理_整车采购_采购业务_整车采购订单 - 维护			
delete t_DataFlowDetailFunc where FDetailFuncID = 80110000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80110000,'整车采购订单 - 维护','整车采购订单 - 维护','整车采购订单 - 维护',801100,
			1,'K3BOSActive.Application','List|200000023',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000023',
			'newtab','list')
--整车管理_整车采购_采购业务_整车采购订单 - 新增
delete t_DataFlowDetailFunc where FDetailFuncID = 80110001
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80110001,'整车采购订单 - 新增','整车采购订单 - 新增','整车采购订单 - 新增',801100,
			2,'K3BOSActive.Application','Bill|200000023',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/BillEdit.aspx?FClassTypeID=200000023',
			'newtab','base')
     	 
	 
	 
--整车管理_整车库存
delete t_DataFlowSubSystem where FSubSysID=8012
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8012,'整车库存','整车库存','整车库存',801,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8012,
     1,'','')
	 
--整车管理_整车采购_入库业务
delete t_DataFlowSubFunc where FSubFuncID = 801200
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801200,8012,1,'入库业务','入库业务',
			'入库业务','','',1,'',
			0,0,0,null,0,
			1,'','')
--整车管理_整车采购_入库业务_整车采购入库单 - 维护			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120000,'整车采购入库单 - 维护','整车采购入库单 - 维护','整车采购入库单 - 维护',801200,
			1,'K3Purchase.Application','Opt1014601',1,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--整车管理_整车采购_入库业务_整车采购入库单 - 新增
delete t_DataFlowDetailFunc where FDetailFuncID = 80120001
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120001,'整车采购入库单 - 新增','整车采购入库单 - 新增','整车采购入库单 - 新增',801200,
			2,'K3Purchase.Application','Opt10110',1,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')
--整车管理_整车采购_入库业务_整车其他入库单 - 维护			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120002
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120002,'整车其他入库单 - 维护','整车其他入库单 - 维护','整车其他入库单 - 维护',801200,
			3,'RetailSys.Application','RefOpt1014604',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--整车管理_整车采购_入库业务_整车其他入库单 - 新增
delete t_DataFlowDetailFunc where FDetailFuncID = 80120003
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120003,'整车其他入库单 - 新增','整车其他入库单 - 新增','整车其他入库单 - 新增',801200,
			4,'RetailSys.Application','RefOpt1011004',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')
			
--整车管理_整车采购_入库业务_整车调拨单 - 维护			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120004
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120004,'整车调拨单 - 维护','整车调拨单 - 维护','整车调拨单 - 维护',801200,
			5,'K3Stock.Application','Opt10148',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--整车管理_整车采购_入库业务_整车调拨单 - 新增
delete t_DataFlowDetailFunc where FDetailFuncID = 80120005
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120005,'整车调拨单 - 新增','整车调拨单 - 新增','整车调拨单 - 新增',801200,
			6,'K3Stock.Application','Opt10120',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')
			
--整车管理_整车采购_出库业务
delete t_DataFlowSubFunc where FSubFuncID = 801201
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801201,8012,2,'出库业务','出库业务',
			'出库业务','','',1,'',
			0,0,0,null,0,
			1,'','')
--整车管理_整车采购_出库业务_整车销售出库单 - 维护			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120100
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120100,'整车销售出库单 - 维护','整车销售出库单 - 维护','整车销售出库单 - 维护',801201,
			1,'K3SaleIn.Application','Opt1014701',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--整车管理_整车采购_出库业务_整车销售出库单 - 新增
delete t_DataFlowDetailFunc where FDetailFuncID = 80120101
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120101,'整车销售出库单 - 新增','整车销售出库单 - 新增','整车销售出库单 - 新增',801201,
			2,'K3SaleIn.Application','Opt10115',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')
--整车管理_整车采购_出库业务_整车其他出库单 - 维护			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120102
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120102,'整车其他出库单 - 维护','整车其他出库单 - 维护','整车其他出库单 - 维护',801201,
			3,'K3Stock.Application','Opt1014704',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--整车管理_整车采购_出库业务_整车其他出库单 - 新增
delete t_DataFlowDetailFunc where FDetailFuncID = 80120103
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120103,'整车其他出库单 - 新增','整车其他出库单 - 新增','整车其他出库单 - 新增',801201,
			4,'K3Stock.Application','Opt1011504',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')

--整车管理_整车采购_出库业务_整车调拨单 - 维护			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120104
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120104,'整车调拨单 - 维护','整车调拨单 - 维护','整车调拨单 - 维护',801201,
			5,'K3Stock.Application','Opt10148',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--整车管理_整车采购_出库业务_整车调拨单 - 新增
delete t_DataFlowDetailFunc where FDetailFuncID = 80120105
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120105,'整车调拨单 - 新增','整车调拨单 - 新增','整车调拨单 - 新增',801201,
			6,'K3Stock.Application','Opt10120',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')
--整车管理_整车采购_库存管理
delete t_DataFlowSubFunc where FSubFuncID = 801202
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801202,8012,3,'库存管理','库存管理',
			'库存管理','','',1,'',
			0,0,0,null,0,
			1,'','')

--整车管理_整车采购_调拨移库业务
delete t_DataFlowSubFunc where FSubFuncID = 801203
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801203,8012,4,'调拨移库业务','调拨移库业务',
			'调拨移库业务','','',1,'',
			0,0,0,null,0,
			1,'','')
--整车管理_整车采购_入库业务_整车调拨单 - 维护			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120301
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120301,'整车调拨单 - 维护','整车调拨单 - 维护','整车调拨单 - 维护',801203,
			5,'K3Stock.Application','Opt10148',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--整车管理_整车采购_入库业务_整车调拨单 - 新增
delete t_DataFlowDetailFunc where FDetailFuncID = 80120302
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120302,'整车调拨单 - 新增','整车调拨单 - 新增','整车调拨单 - 新增',801203,
			6,'K3Stock.Application','Opt10120',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')			
 
 --整车管理_整车采购_二网业务
delete t_DataFlowSubFunc where FSubFuncID = 801204
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801204,8012,5,'二网业务','二网业务',
			'二网业务','','',1,'',
			0,0,0,null,0,
			1,'','')
 --整车管理_整车采购_存货核算
delete t_DataFlowSubFunc where FSubFuncID = 801205
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801205,8012,6,'存货核算','存货核算',
			'存货核算','','',1,'',
			0,0,0,null,0,
			1,'','')	
			
--整车管理_整车销售     
delete t_DataFlowSubSystem where FSubSysID=8013
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8013,'整车销售','整车销售','整车销售',801,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8013,
     1,'','')  
--整车管理_整车销售_整车销售订单  
delete t_DataFlowSubFunc where FSubFuncID = 801300
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801300,8013,1,'整车销售订单','整车销售订单',
			'整车销售订单','K3BOSActive.Application','List|200000028',1,'',
			0,0,0,null,0,
			1,'','')
--整车管理_整车销售_整车销售订单_整车销售订单 - 维护			
delete t_DataFlowDetailFunc where FDetailFuncID = 80130000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80130000,'整车销售订单 - 维护','整车销售订单 - 维护','整车销售订单 - 维护',801300,
			1,'K3BOSActive.Application','List|200000028',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000028',
			'newtab','list')
--整车管理_整车销售_整车销售订单_整车销售订单 - 新增
delete t_DataFlowDetailFunc where FDetailFuncID = 80130001
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80130001,'整车销售订单 - 新增','整车销售订单 - 新增','整车销售订单 - 新增',801300,
			2,'K3BOSActive.Application','Bill|200000028',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/BillEdit.aspx?FClassTypeID=200000028',
			'newtab','base')

--整车管理_整车销售_交车单  			
delete t_DataFlowSubFunc where FSubFuncID = 801301
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801301,8013,1,'交车单','整车销售订单',
			'交车单','K3BOSActive.Application','List|200000029',1,'',
			0,0,0,null,0,
			1,'','')

--整车管理_整车销售_整车销售订单_交车单 - 维护			
delete t_DataFlowDetailFunc where FDetailFuncID = 80130100
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80130100,'交车单 - 维护','交车单 - 维护','交车单 - 维护',801301,
			1,'K3BOSActive.Application','List|200000029',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000029',
			'newtab','list')
--整车管理_整车销售_整车销售订单_交车单 - 新增
delete t_DataFlowDetailFunc where FDetailFuncID = 80130101
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80130101,'交车单 - 新增','交车单 - 新增','交车单 - 新增',801301,
			2,'K3BOSActive.Application','Bill|200000029',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/BillEdit.aspx?FClassTypeID=200000029',
			'newtab','base')
			

--4S视图
delete t_DataFlowTopClass where FTopClassID=899
INSERT INTO t_DataFlowTopClass(FTopClassID,FTopClassName,FTopClassName_EN,FTopClassName_CHT,FIndex,
					FVisible,FAcctType,FToolTips,FToolTips_CHT ,FToolTips_EN,
					FShowSysType)
values (899,'4S视图','4S视图','4S视图',0,
		0,',1,',null,null,null,
		1)
		
--4S视图_4S视图
delete t_DataFlowSubSystem where FSubSysID=8990
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8990,'4S视图','4S视图','4S视图',899,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8990,
     1,'','')

GO
update t_DataFlowTimeStamp
set FName=FName

