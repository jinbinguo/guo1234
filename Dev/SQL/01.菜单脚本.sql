--4S��ģ
delete t_DataFlowTopClass where FTopClassID=800
INSERT INTO t_DataFlowTopClass(FTopClassID,FTopClassName,FTopClassName_EN,FTopClassName_CHT,FIndex,
					FVisible,FAcctType,FToolTips,FToolTips_CHT ,FToolTips_EN,
					FShowSysType)
values (800,'4S��ģ','4S��ģ','4S��ģ',0,
		1,',1,',null,null,null,
		1)
		
--4S��ģ_��������
delete t_DataFlowSubSystem where FSubSysID=8000
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8000,'��������','��������','��������',800,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8000,
     1,'','')
	 
--4S��ģ_��������_����
delete t_DataFlowSubFunc where FSubFuncID = 800000
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800000,8000,1,'����','����',
			'����','K3BOSActive.Application','Base|200000009',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_����_����-ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80000000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000000,'����-ά��','����-ά��','����-ά��',800000,
			1,'K3BOSActive.Application','Base|200000009',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000009',
			'newtab','base')
--4S��ģ_��������_������
delete t_DataFlowSubFunc where FSubFuncID = 800001
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800001,8000,2,'������','������',
			'������','K3BOSActive.Application','Base|200000012',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_������_������-ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80000100
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000100,'������-ά��','������-ά��','������-ά��',800001,
			1,'K3BOSActive.Application','Base|200000012',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000012',
			'newtab','base')
			
--4S��ģ_��������_������ʽ
delete t_DataFlowSubFunc where FSubFuncID = 800003
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800003,8000,4,'������ʽ','������ʽ',
			'������ʽ','K3BOSActive.Application','Base|200000014',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_������ʽ_������ʽ-ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80000300
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000300,'������ʽ-ά��','������ʽ-ά��','������ʽ-ά��',800003,
			1,'K3BOSActive.Application','Base|200000014',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000014',
			'newtab','base')
--4S��ģ_��������_������ʽ
delete t_DataFlowSubFunc where FSubFuncID = 800004
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800004,8000,5,'������ʽ','������ʽ',
			'������ʽ','K3BOSActive.Application','Base|200000015',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_������ʽ_������ʽ-ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80000400
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000400,'������ʽ-ά��','������ʽ-ά��','������ʽ-ά��',800004,
			1,'K3BOSActive.Application','Base|200000015',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000015',
			'newtab','base')
--4S��ģ_��������_��������
delete t_DataFlowSubFunc where FSubFuncID = 800005
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800005,8000,6,'��������','��������',
			'��������','K3BOSActive.Application','Base|200000016',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_��������_��������-ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80000500
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000500,'��������-ά��','��������-ά��','��������-ά��',800005,
			1,'K3BOSActive.Application','Base|200000016',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000016',
			'newtab','base')
--4S��ģ_��������_Ʒ��
delete t_DataFlowSubFunc where FSubFuncID = 800006
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800006,8000,7,'Ʒ��','Ʒ��',
			'Ʒ��','K3BOSActive.Application','Base|200000011',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_Ʒ��_Ʒ��-ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80000600
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000600,'Ʒ��-ά��','Ʒ��-ά��','Ʒ��-ά��',800006,
			1,'K3BOSActive.Application','Base|200000011',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000011',
			'newtab','base')
--4S��ģ_��������_������Դ
delete t_DataFlowSubFunc where FSubFuncID = 800007
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800007,8000,8,'������Դ','������Դ',
			'������Դ','K3BOSActive.Application','Base|200000020',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_������Դ_������Դ-ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80000700
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000700,'������Դ-ά��','������Դ-ά��','������Դ-ά��',800007,
			1,'K3BOSActive.Application','Base|200000020',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000020',
			'newtab','base')
--4S��ģ_��������_��ϵ
delete t_DataFlowSubFunc where FSubFuncID = 800008
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800008,8000,9,'��ϵ','��ϵ',
			'��ϵ','K3BOSActive.Application','List|200000019',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_��ϵ_��ϵ-ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80000800
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000800,'��ϵ-ά��','��ϵ-ά��','��ϵ-ά��',800008,
			1,'K3BOSActive.Application','List|200000019',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000019',
			'newtab','list')

--4S��ģ_��������_����
delete t_DataFlowSubFunc where FSubFuncID = 800009
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800009,8000,10,'����','����',
			'����','K3BOSActive.Application','List|200000021',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_����_���� - ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80000900
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80000900,'���� - ά��','���� - ά��','���� - ά��',800009,
			1,'K3BOSActive.Application','List|200000021',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000021',
			'newtab','list')

--4S��ģ_��������_��������
delete t_DataFlowSubFunc where FSubFuncID = 800010
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800010,8000,11,'��������','��������',
			'��������','K3BOSActive.Application','List|200000022',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_��������_�������� - ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80001000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80001000,'�������� - ά��','�������� - ά��','�������� - ά��',800010,
			1,'K3BOSActive.Application','List|200000022',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000022',
			'newtab','list')

--4S��ģ_��������_������;
delete t_DataFlowSubFunc where FSubFuncID = 800011
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800011,8000,1,'������;','������;',
			'������;','K3BOSActive.Application','Base|200000035',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_��������_������;_������;-ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80001100
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80001100,'������;-ά��','������;-ά��','������;-ά��',800011,
			1,'K3BOSActive.Application','Base|200000035',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000035',
			'newtab','base')
			
			
--4S��ģ_ϵͳ����
delete t_DataFlowSubSystem where FSubSysID=8001
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8001,'ϵͳ����','ϵͳ����','ϵͳ����',800,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8001,
     1,'','')
	 
--4S��ģ_ϵͳ����_������������
delete t_DataFlowSubFunc where FSubFuncID = 800100
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(800100,8001,1,'������������','������������',
			'������������','K3BOSActive.Application','Base|200000033',1,'',
			0,0,0,null,1,
			1,'','')
--4S��ģ_ϵͳ����_������������_������������-ά��
delete t_DataFlowDetailFunc where FDetailFuncID = 80001000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80001000,'������������-ά��','������������-ά��','������������-ά��',800100,
			1,'K3BOSActive.Application','Base|200000033',0,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000033',
			'newtab','base')

			

---��������
delete t_DataFlowTopClass where FTopClassID=801
INSERT INTO t_DataFlowTopClass(FTopClassID,FTopClassName,FTopClassName_EN,FTopClassName_CHT,FIndex,
					FVisible,FAcctType,FToolTips,FToolTips_CHT ,FToolTips_EN,
					FShowSysType)
values (801,'��������','��������','��������',0,
		1,',1,',null,null,null,
		1)
		
--��������_�����ɹ�
delete t_DataFlowSubSystem where FSubSysID=8011
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8011,'�����ɹ�','�����ɹ�','�����ɹ�',801,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8011,
     1,'','')
	 
--��������_�����ɹ�_�ɹ�ҵ��
delete t_DataFlowSubFunc where FSubFuncID = 801100
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801100,8011,1,'�ɹ�ҵ��','�ɹ�ҵ��',
			'�ɹ�ҵ��','','',1,'',
			0,0,0,null,0,
			1,'','')	 
			
--��������_�����ɹ�_�ɹ�ҵ��_�����ɹ����� - ά��			
delete t_DataFlowDetailFunc where FDetailFuncID = 80110000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80110000,'�����ɹ����� - ά��','�����ɹ����� - ά��','�����ɹ����� - ά��',801100,
			1,'K3BOSActive.Application','List|200000023',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000023',
			'newtab','list')
--��������_�����ɹ�_�ɹ�ҵ��_�����ɹ����� - ����
delete t_DataFlowDetailFunc where FDetailFuncID = 80110001
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80110001,'�����ɹ����� - ����','�����ɹ����� - ����','�����ɹ����� - ����',801100,
			2,'K3BOSActive.Application','Bill|200000023',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/BillEdit.aspx?FClassTypeID=200000023',
			'newtab','base')
     	 
	 
	 
--��������_�������
delete t_DataFlowSubSystem where FSubSysID=8012
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8012,'�������','�������','�������',801,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8012,
     1,'','')
	 
--��������_�����ɹ�_���ҵ��
delete t_DataFlowSubFunc where FSubFuncID = 801200
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801200,8012,1,'���ҵ��','���ҵ��',
			'���ҵ��','','',1,'',
			0,0,0,null,0,
			1,'','')
--��������_�����ɹ�_���ҵ��_�����ɹ���ⵥ - ά��			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120000,'�����ɹ���ⵥ - ά��','�����ɹ���ⵥ - ά��','�����ɹ���ⵥ - ά��',801200,
			1,'K3Purchase.Application','Opt1014601',1,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--��������_�����ɹ�_���ҵ��_�����ɹ���ⵥ - ����
delete t_DataFlowDetailFunc where FDetailFuncID = 80120001
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120001,'�����ɹ���ⵥ - ����','�����ɹ���ⵥ - ����','�����ɹ���ⵥ - ����',801200,
			2,'K3Purchase.Application','Opt10110',1,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')
--��������_�����ɹ�_���ҵ��_����������ⵥ - ά��			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120002
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120002,'����������ⵥ - ά��','����������ⵥ - ά��','����������ⵥ - ά��',801200,
			3,'RetailSys.Application','RefOpt1014604',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--��������_�����ɹ�_���ҵ��_����������ⵥ - ����
delete t_DataFlowDetailFunc where FDetailFuncID = 80120003
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120003,'����������ⵥ - ����','����������ⵥ - ����','����������ⵥ - ����',801200,
			4,'RetailSys.Application','RefOpt1011004',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')
			
--��������_�����ɹ�_���ҵ��_���������� - ά��			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120004
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120004,'���������� - ά��','���������� - ά��','���������� - ά��',801200,
			5,'K3Stock.Application','Opt10148',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--��������_�����ɹ�_���ҵ��_���������� - ����
delete t_DataFlowDetailFunc where FDetailFuncID = 80120005
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120005,'���������� - ����','���������� - ����','���������� - ����',801200,
			6,'K3Stock.Application','Opt10120',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')
			
--��������_�����ɹ�_����ҵ��
delete t_DataFlowSubFunc where FSubFuncID = 801201
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801201,8012,2,'����ҵ��','����ҵ��',
			'����ҵ��','','',1,'',
			0,0,0,null,0,
			1,'','')
--��������_�����ɹ�_����ҵ��_�������۳��ⵥ - ά��			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120100
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120100,'�������۳��ⵥ - ά��','�������۳��ⵥ - ά��','�������۳��ⵥ - ά��',801201,
			1,'K3SaleIn.Application','Opt1014701',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--��������_�����ɹ�_����ҵ��_�������۳��ⵥ - ����
delete t_DataFlowDetailFunc where FDetailFuncID = 80120101
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120101,'�������۳��ⵥ - ����','�������۳��ⵥ - ����','�������۳��ⵥ - ����',801201,
			2,'K3SaleIn.Application','Opt10115',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')
--��������_�����ɹ�_����ҵ��_�����������ⵥ - ά��			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120102
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120102,'�����������ⵥ - ά��','�����������ⵥ - ά��','�����������ⵥ - ά��',801201,
			3,'K3Stock.Application','Opt1014704',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--��������_�����ɹ�_����ҵ��_�����������ⵥ - ����
delete t_DataFlowDetailFunc where FDetailFuncID = 80120103
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120103,'�����������ⵥ - ����','�����������ⵥ - ����','�����������ⵥ - ����',801201,
			4,'K3Stock.Application','Opt1011504',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')

--��������_�����ɹ�_����ҵ��_���������� - ά��			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120104
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120104,'���������� - ά��','���������� - ά��','���������� - ά��',801201,
			5,'K3Stock.Application','Opt10148',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--��������_�����ɹ�_����ҵ��_���������� - ����
delete t_DataFlowDetailFunc where FDetailFuncID = 80120105
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120105,'���������� - ����','���������� - ����','���������� - ����',801201,
			6,'K3Stock.Application','Opt10120',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')
--��������_�����ɹ�_������
delete t_DataFlowSubFunc where FSubFuncID = 801202
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801202,8012,3,'������','������',
			'������','','',1,'',
			0,0,0,null,0,
			1,'','')

--��������_�����ɹ�_�����ƿ�ҵ��
delete t_DataFlowSubFunc where FSubFuncID = 801203
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801203,8012,4,'�����ƿ�ҵ��','�����ƿ�ҵ��',
			'�����ƿ�ҵ��','','',1,'',
			0,0,0,null,0,
			1,'','')
--��������_�����ɹ�_���ҵ��_���������� - ά��			
delete t_DataFlowDetailFunc where FDetailFuncID = 80120301
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120301,'���������� - ά��','���������� - ά��','���������� - ά��',801203,
			5,'K3Stock.Application','Opt10148',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','list')
--��������_�����ɹ�_���ҵ��_���������� - ����
delete t_DataFlowDetailFunc where FDetailFuncID = 80120302
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80120302,'���������� - ����','���������� - ����','���������� - ����',801203,
			6,'K3Stock.Application','Opt10120',0,'',
			1,',1,2,3,9,10,11,12,13,',-1,1,null,
			null,null,0,0,'',
			'','base')			
 
 --��������_�����ɹ�_����ҵ��
delete t_DataFlowSubFunc where FSubFuncID = 801204
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801204,8012,5,'����ҵ��','����ҵ��',
			'����ҵ��','','',1,'',
			0,0,0,null,0,
			1,'','')
 --��������_�����ɹ�_�������
delete t_DataFlowSubFunc where FSubFuncID = 801205
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801205,8012,6,'�������','�������',
			'�������','','',1,'',
			0,0,0,null,0,
			1,'','')	
			
--��������_��������     
delete t_DataFlowSubSystem where FSubSysID=8013
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8013,'��������','��������','��������',801,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8013,
     1,'','')  
--��������_��������_�������۶���  
delete t_DataFlowSubFunc where FSubFuncID = 801300
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801300,8013,1,'�������۶���','�������۶���',
			'�������۶���','K3BOSActive.Application','List|200000028',1,'',
			0,0,0,null,0,
			1,'','')
--��������_��������_�������۶���_�������۶��� - ά��			
delete t_DataFlowDetailFunc where FDetailFuncID = 80130000
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80130000,'�������۶��� - ά��','�������۶��� - ά��','�������۶��� - ά��',801300,
			1,'K3BOSActive.Application','List|200000028',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000028',
			'newtab','list')
--��������_��������_�������۶���_�������۶��� - ����
delete t_DataFlowDetailFunc where FDetailFuncID = 80130001
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80130001,'�������۶��� - ����','�������۶��� - ����','�������۶��� - ����',801300,
			2,'K3BOSActive.Application','Bill|200000028',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/BillEdit.aspx?FClassTypeID=200000028',
			'newtab','base')

--��������_��������_������  			
delete t_DataFlowSubFunc where FSubFuncID = 801301
INSERT INTO t_DataFlowSubFunc
           (FSubFuncID,FSubSysID,FIndex,FFuncName,FFuncName_CHT
           ,FFuncName_EN,FClassName,FClassParam,FVisible,FAcctType
           ,FFuncType,FRefresh,FSetEnable,FSubID,FIsEdit
           ,FShowSysType,FUrl,FUrlType)
     VALUES(801301,8013,1,'������','�������۶���',
			'������','K3BOSActive.Application','List|200000029',1,'',
			0,0,0,null,0,
			1,'','')

--��������_��������_�������۶���_������ - ά��			
delete t_DataFlowDetailFunc where FDetailFuncID = 80130100
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80130100,'������ - ά��','������ - ά��','������ - ά��',801301,
			1,'K3BOSActive.Application','List|200000029',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/Filter/BOSListManager.aspx?FClassTypeID=200000029',
			'newtab','list')
--��������_��������_�������۶���_������ - ����
delete t_DataFlowDetailFunc where FDetailFuncID = 80130101
INSERT INTO t_DataFlowDetailFunc
           (FDetailFuncID,FFuncName,FFuncName_CHT,FFuncName_EN,FSubFuncID
           ,FIndex,FClassName,FClassParam,FIsNormal,FHelpCode
           ,FVisible,FAcctType,FFuncType,FEnable,FShowName
           ,FShowName_CHT,FShowName_EN,FIsEdit,FShowSysType,FUrl
           ,FUrlType,FFuncType_Ex)
     VALUES (80130101,'������ - ����','������ - ����','������ - ����',801301,
			2,'K3BOSActive.Application','Bill|200000029',1,'',
			1,'',0,1,null,
			null,null,1,1,'ExtBOS/BillEdit.aspx?FClassTypeID=200000029',
			'newtab','base')
			

--4S��ͼ
delete t_DataFlowTopClass where FTopClassID=899
INSERT INTO t_DataFlowTopClass(FTopClassID,FTopClassName,FTopClassName_EN,FTopClassName_CHT,FIndex,
					FVisible,FAcctType,FToolTips,FToolTips_CHT ,FToolTips_EN,
					FShowSysType)
values (899,'4S��ͼ','4S��ͼ','4S��ͼ',0,
		0,',1,',null,null,null,
		1)
		
--4S��ͼ_4S��ͼ
delete t_DataFlowSubSystem where FSubSysID=8990
INSERT INTO t_DataFlowSubSystem(FSubSysID,FName,FName_CHT ,FName_EN ,FTopClassID,
			FClassName,FIndex,FVisible ,FAcctType,FRefresh,
			FNote,FNote_CHT,FNote_EN,FAppClassName,FHelpFileName,
			FTipID,FUpdateBaseData,FSubID,FIsEdit,FSubSystemID,
			FShowSysType,FUrl,FUrlType)
     VALUES(8990,'4S��ͼ','4S��ͼ','4S��ͼ',899,
     'K3BOSActive.Application',0,1,',1,',0,
     null,null,null,null,null,
     0,0,'',0,8990,
     1,'','')

GO
update t_DataFlowTimeStamp
set FName=FName

