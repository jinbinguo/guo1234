/*
һ�����ݻ���ģ��
01��ICTransactionType���ñ�ӳ�˹��������е��ݵ����������
02��ICClassType����������
03��ICTemplate���ñ�ӳ�����е��ݵı�ͷ����ϸ�����
04��ICTemplateEntry���ñ�ӳ�����е��ݵķ�¼����ϸ�����
��������ѡ��ģ��
01��ICSelbills����¼ѡ����ϵ�ı�ѡ��Ҫȡ����Щֵ����Щֵ����ζ����ģ��Լ������ĸ���Ӧ�Ŀؼ��
02��ICTableRelation��ѡ�����漰�����б�֮������ӹ�ϵ��
03��ICWriteBackTemplate�����ݻ��д��
04��ICListTemplate�������б�ģ��
05��ICClassLink���������̶����
�������ݿ���
01��ICBillNo ���ݱ�ű�
02��ICMaxNum ��󵥾�����(FInterID)�ű�
�ġ������״�
01��GLNoteType�������״����¼�������״��ŵĹ�ϵ��
02��GLNoteCitation�������״��ϵ����¼�����״��ֶε����ԡ�
�塢������ʱ����
01��ICChatBillTitle��������ʱ����
 
һ����ҵ������ر����
01. �����������ͱ�		IctransactionType
02. ����ģ���          ICtemplate
03. ����ģ���¼��		ICtemplateentry
04. ��ʱ��ģ��          IClisttemplate
05. ��ʱ������ʾ�ֶα�  ICchatbilltitle
06. ��ʱ���Ĺ�������    ICtableRelation
07. ѡ��ģ���(����ѡ��ʱ���ݼ�Я�����ݵĶ�Ӧ��ϵ��) ICselbills
08. ��������            t_TableDescription
09. �ֶ�������			t_FieldDescription
10.ƾ֤�����Դ			ICVoucherTField
11.������Ŀ������Ϣ���� t_ItemPropDesc
12.���״��ʽ�ֶα�     GLNoteCitation  
 */

--���۳����¼.����
update ICTableRelation 
set FFieldName='FVehicleID'
where FFieldName = 'FEntrySelfB0167'

update ICClassTableInfo
set ffieldname='FVehicleID'
where FFieldName='FEntrySelfB0167'

update ICTemplateEntry
set FFieldName='FVehicleID',
	FFilter= 'V_ATS_Vehicle.FICItemID=GetFldValue(FItemID,1)'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfB0167'
 
 update ICChatBillTitle
set FColName='FVehicleID'
where FColName='FEntrySelfB0167'

EXEC sp_rename 'ICStockBillEntry.FEntrySelfB0167', 'FVehicleID', 'COLUMN'
EXEC sp_rename 'ICStockBillEntry_1.FEntrySelfB0167', 'FVehicleID', 'COLUMN'
EXEC sp_rename 'ICStockBillEntry_10.FEntrySelfB0167', 'FVehicleID', 'COLUMN'
EXEC sp_rename 'ICStockBillEntry_2.FEntrySelfB0167', 'FVehicleID', 'COLUMN'
EXEC sp_rename 'ICStockBillEntry_21.FEntrySelfB0167', 'FVehicleID', 'COLUMN' 
EXEC sp_rename 'ICStockBillEntry_24.FEntrySelfB0167', 'FVehicleID', 'COLUMN' 
EXEC sp_rename 'ICStockBillEntry_28.FEntrySelfB0167', 'FVehicleID', 'COLUMN' 
EXEC sp_rename 'ICStockBillEntry_29.FEntrySelfB0167', 'FVehicleID', 'COLUMN' 
EXEC sp_rename 'ICStockBillEntry_41.FEntrySelfB0167', 'FVehicleID', 'COLUMN' 
EXEC sp_rename 'ICStockBillEntry_5.FEntrySelfB0167', 'FVehicleID', 'COLUMN'



--���۳����¼.��ϵ

update ICTemplateEntry
set FFieldName='FSeriesName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='��ϵ' and FFieldName = 'FEntrySelfB0168'
 
update ICChatBillTitle
set FColName='FSeriesName'
where FColName='FEntrySelfB0168'


--���۳����¼.����
update ICTemplateEntry
set FFieldName='FModelName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfB0169'
 
 update ICChatBillTitle
set FColName='FModelName'
where FColName='FEntrySelfB0169'


--���۳����¼.���̺�
update ICTemplateEntry
set FFieldName='FVin'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='���̺�' and FFieldName = 'FEntrySelfB0170'
 
 update ICChatBillTitle
set FColName='FVin'
where FColName='FEntrySelfB0170'

--���۳����¼.Ʒ��
update ICTemplateEntry
set FFieldName='FBrandName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='Ʒ��' and FFieldName = 'FEntrySelfB0171'
 
 update ICChatBillTitle
set FColName='FBrandName'
where FColName='FEntrySelfB0171'

--���۳����¼.������ʽ
update ICTemplateEntry
set FFieldName='FDriverFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfB0172'
 
 update ICChatBillTitle
set FColName='FDriverFormName'
where FColName='FEntrySelfB0172'

--���۳����¼.������ʽ
update ICTemplateEntry
set FFieldName='FPowerFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfB0173'
 
 update ICChatBillTitle
set FColName='FPowerFormName'
where FColName='FEntrySelfB0173'

--���۳����¼.����
update ICTemplateEntry
set FFieldName='FInteriorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfB0174'
 
 update ICChatBillTitle
set FColName='FInteriorName'
where FColName='FEntrySelfB0174'
--���۳����¼.��ɫ
update ICTemplateEntry
set FFieldName='FColorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='��ɫ' and FFieldName = 'FEntrySelfB0175'
 
update ICChatBillTitle
set FColName='FColorName'
where FColName='FEntrySelfB0175'

--���۳����¼.ѡװ
update ICTemplateEntry
set FFieldName='FOptional'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='ѡװ' and FFieldName = 'FEntrySelfB0176'
 
 update ICChatBillTitle
set FColName='FOptional'
where FColName='FEntrySelfB0176'

--���۳����¼.����

update ICTemplateEntry
set FFieldName='FDisplacementName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfB0177'
 
 update ICChatBillTitle
set FColName='FDisplacementName'
where FColName='FEntrySelfB0177'

--���۳����¼.��/��
update ICTemplateEntry
set FFieldName='FStereotypeName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='��/��' and FFieldName = 'FEntrySelfB0178'
 
 update ICChatBillTitle
set FColName='FStereotypeName'
where FColName='FEntrySelfB0178'

--���۳����¼.����˵��
update ICTemplateEntry
set FFieldName='FCfgDesc'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='����˵��' and FFieldName = 'FEntrySelfB0179'
 
 update ICChatBillTitle
set FColName='FCfgDesc'
where FColName='FEntrySelfB0179'
--���۳����¼.��������
update ICTemplateEntry
set FFieldName='FEngineNum'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='��������' and FFieldName = 'FEntrySelfB0180'
 
 update ICChatBillTitle
set FColName='FEngineNum'
where FColName='FEntrySelfB0180'
--���۳����¼.������
update ICTemplateEntry
set FFieldName='FGearboxName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='���۳���')
 and FHeadCaption='������' and FFieldName = 'FEntrySelfB0181'
 
 update ICChatBillTitle
set FColName='FGearboxName'
where FColName='FEntrySelfB0181'



--��Ʒ����¼.����
update ICTableRelation 
set FFieldName='FVehicleID'
where FFieldName = 'FEntrySelfA0239'

update ICClassTableInfo
set ffieldname='FVehicleID'
where FFieldName='FEntrySelfA0239'

update ICTemplateEntry
set FFieldName='FVehicleID'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA0239'
 
 update ICChatBillTitle
set FColName='FVehicleID'
where FColName='FEntrySelfA0239'

alter table ICStockBillEntry drop column FEntrySelfA0239;
alter table ICStockBillEntry_1 drop column FEntrySelfA0239;
alter table ICStockBillEntry_10 drop column FEntrySelfA0239;
alter table ICStockBillEntry_2 drop column FEntrySelfA0239;
alter table ICStockBillEntry_21 drop column FEntrySelfA0239;
alter table ICStockBillEntry_24 drop column FEntrySelfA0239;
alter table ICStockBillEntry_28 drop column FEntrySelfA0239;
alter table ICStockBillEntry_29 drop column FEntrySelfA0239;
alter table ICStockBillEntry_41 drop column FEntrySelfA0239;
alter table ICStockBillEntry_5 drop column FEntrySelfA0239;

--��Ʒ����¼.��ϵ

update ICTemplateEntry
set FFieldName='FSeriesName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='��ϵ' and FFieldName = 'FEntrySelfA0240'
 
update ICChatBillTitle
set FColName='FSeriesName'
where FColName='FEntrySelfA0240'


--��Ʒ����¼.����
update ICTemplateEntry
set FFieldName='FModelName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA0241'

 update ICChatBillTitle
set FColName='FModelName'
where FColName='FEntrySelfA0241'


--��Ʒ����¼.���̺�
update ICTemplateEntry
set FFieldName='FVin'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='���̺�' and FFieldName = 'FEntrySelfA0242'

 update ICChatBillTitle
set FColName='FVin'
where FColName='FEntrySelfA0242'

--��Ʒ����¼.Ʒ��
update ICTemplateEntry
set FFieldName='FBrandName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='Ʒ��' and FFieldName = 'FEntrySelfA0243'

 update ICChatBillTitle
set FColName='FBrandName'
where FColName='FEntrySelfA0243'

--��Ʒ����¼.������ʽ
update ICTemplateEntry
set FFieldName='FDriverFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfA0244'

 update ICChatBillTitle
set FColName='FDriverFormName'
where FColName='FEntrySelfA0244'

--��Ʒ����¼.������ʽ
update ICTemplateEntry
set FFieldName='FPowerFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfA0245'

 update ICChatBillTitle
set FColName='FPowerFormName'
where FColName='FEntrySelfA0245'

--��Ʒ����¼.����
update ICTemplateEntry
set FFieldName='FInteriorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA0246'

 update ICChatBillTitle
set FColName='FInteriorName'
where FColName='FEntrySelfA0246'
--��Ʒ����¼.��ɫ
update ICTemplateEntry
set FFieldName='FColorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='��ɫ' and FFieldName = 'FEntrySelfA0247'

update ICChatBillTitle
set FColName='FColorName'
where FColName='FEntrySelfA0247'

--��Ʒ����¼.ѡװ
update ICTemplateEntry
set FFieldName='FOptional'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='ѡװ' and FFieldName = 'FEntrySelfA0248'

 update ICChatBillTitle
set FColName='FOptional'
where FColName='FEntrySelfA0248'

--��Ʒ����¼.����

update ICTemplateEntry
set FFieldName='FDisplacementName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA0249'

 update ICChatBillTitle
set FColName='FDisplacementName'
where FColName='FEntrySelfA0249'

--��Ʒ����¼.��/��
update ICTemplateEntry
set FFieldName='FStereotypeName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='��/��' and FFieldName = 'FEntrySelfA0250'

 update ICChatBillTitle
set FColName='FStereotypeName'
where FColName='FEntrySelfA0250'

--��Ʒ����¼.����˵��
update ICTemplateEntry
set FFieldName='FCfgDesc'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='����˵��' and FFieldName = 'FEntrySelfA0251'

 update ICChatBillTitle
set FColName='FCfgDesc'
where FColName='FEntrySelfA0251'

--��Ʒ����¼.��������
update ICTemplateEntry
set FFieldName='FEngineNum'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='��������' and FFieldName = 'FEntrySelfA0252'
 
 update ICChatBillTitle
set FColName='FEngineNum'
where FColName='FEntrySelfA0252'
--��Ʒ����¼.������
update ICTemplateEntry
set FFieldName='FGearboxName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='��Ʒ���')
 and FHeadCaption='������' and FFieldName = 'FEntrySelfA0253'
 
update ICChatBillTitle
set FColName='FGearboxName'
where FColName='FEntrySelfA0253'


--��������¼.����
update ICTableRelation 
set FFieldName='FVehicleID'
where FFieldName = 'FEntrySelfD0154'

update ICClassTableInfo
set ffieldname='FVehicleID'
where FFieldName='FEntrySelfD0154'

update ICTemplateEntry
set FFieldName='FVehicleID'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfD0154'
 
 update ICChatBillTitle
set FColName='FVehicleID'
where FColName='FEntrySelfD0154'

alter table ICStockBillEntry drop column FEntrySelfD0154;
alter table ICStockBillEntry_1 drop column FEntrySelfD0154;
alter table ICStockBillEntry_10 drop column FEntrySelfD0154;
alter table ICStockBillEntry_2 drop column FEntrySelfD0154;
alter table ICStockBillEntry_21 drop column FEntrySelfD0154;
alter table ICStockBillEntry_24 drop column FEntrySelfD0154;
alter table ICStockBillEntry_28 drop column FEntrySelfD0154;
alter table ICStockBillEntry_29 drop column FEntrySelfD0154;
alter table ICStockBillEntry_41 drop column FEntrySelfD0154;
alter table ICStockBillEntry_5 drop column FEntrySelfD0154;


--��������¼.��ϵ

update ICTemplateEntry
set FFieldName='FSeriesName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='��ϵ' and FFieldName = 'FEntrySelfD0155'
 
update ICChatBillTitle
set FColName='FSeriesName'
where FColName='FEntrySelfD0155'


--��������¼.����
update ICTemplateEntry
set FFieldName='FModelName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfD0156'

 update ICChatBillTitle
set FColName='FModelName'
where FColName='FEntrySelfD0156'


--��������¼.���̺�
update ICTemplateEntry
set FFieldName='FVin'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='���̺�' and FFieldName = 'FEntrySelfD0157'

 update ICChatBillTitle
set FColName='FVin'
where FColName='FEntrySelfD0157'

--��������¼.Ʒ��
update ICTemplateEntry
set FFieldName='FBrandName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='Ʒ��' and FFieldName = 'FEntrySelfD0158'

 update ICChatBillTitle
set FColName='FBrandName'
where FColName='FEntrySelfD0158'

--��������¼.������ʽ
update ICTemplateEntry
set FFieldName='FDriverFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfD0159'

 update ICChatBillTitle
set FColName='FDriverFormName'
where FColName='FEntrySelfD0159'

--��������¼.������ʽ
update ICTemplateEntry
set FFieldName='FPowerFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfD0160'

 update ICChatBillTitle
set FColName='FPowerFormName'
where FColName='FEntrySelfD0160'

--��������¼.����
update ICTemplateEntry
set FFieldName='FInteriorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfD0161'

 update ICChatBillTitle
set FColName='FInteriorName'
where FColName='FEntrySelfD0161'
--��������¼.��ɫ
update ICTemplateEntry
set FFieldName='FColorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='��ɫ' and FFieldName = 'FEntrySelfD0162'

update ICChatBillTitle
set FColName='FColorName'
where FColName='FEntrySelfD0162'

--��������¼.ѡװ
update ICTemplateEntry
set FFieldName='FOptional'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='ѡװ' and FFieldName = 'FEntrySelfD0163'

 update ICChatBillTitle
set FColName='FOptional'
where FColName='FEntrySelfD0163'

--��������¼.����

update ICTemplateEntry
set FFieldName='FDisplacementName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfD0164'

 update ICChatBillTitle
set FColName='FDisplacementName'
where FColName='FEntrySelfD0164'

--��������¼.��/��
update ICTemplateEntry
set FFieldName='FStereotypeName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='��/��' and FFieldName = 'FEntrySelfD0165'

 update ICChatBillTitle
set FColName='FStereotypeName'
where FColName='FEntrySelfD0165'

--��������¼.����˵��
update ICTemplateEntry
set FFieldName='FCfgDesc'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='����˵��' and FFieldName = 'FEntrySelfD0166'

 update ICChatBillTitle
set FColName='FCfgDesc'
where FColName='FEntrySelfD0166'

--��������¼.��������
update ICTemplateEntry
set FFieldName='FEngineNum'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='��������' and FFieldName = 'FEntrySelfD0167'
 
 update ICChatBillTitle
set FColName='FEngineNum'
where FColName='FEntrySelfD0167'
--��������¼.������
update ICTemplateEntry
set FFieldName='FGearboxName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='������')
 and FHeadCaption='������' and FFieldName = 'FEntrySelfD0168'
 
 update ICChatBillTitle
set FColName='FGearboxName'
where FColName='FEntrySelfD0168'

--�⹺����¼.����
update ICTableRelation 
set FFieldName='FVehicleID'
where FFieldName = 'FEntrySelfA0158'

update ICClassTableInfo
set ffieldname='FVehicleID'
where FFieldName='FEntrySelfA0158'

update ICTemplateEntry
set FFieldName='FVehicleID'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA0158'
 
 update ICChatBillTitle
set FColName='FVehicleID'
where FColName='FEntrySelfA0158'

alter table ICStockBillEntry drop column FEntrySelfA0158;
alter table ICStockBillEntry_1 drop column FEntrySelfA0158;
alter table ICStockBillEntry_10 drop column FEntrySelfA0158;
alter table ICStockBillEntry_2 drop column FEntrySelfA0158;
alter table ICStockBillEntry_21 drop column FEntrySelfA0158;
alter table ICStockBillEntry_24 drop column FEntrySelfA0158;
alter table ICStockBillEntry_28 drop column FEntrySelfA0158;
alter table ICStockBillEntry_29 drop column FEntrySelfA0158;
alter table ICStockBillEntry_41 drop column FEntrySelfA0158;
alter table ICStockBillEntry_5 drop column FEntrySelfA0158;

--�⹺����¼.��ϵ

update ICTemplateEntry
set FFieldName='FSeriesName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='��ϵ' and FFieldName = 'FEntrySelfA0159'
 
update ICChatBillTitle
set FColName='FSeriesName'
where FColName='FEntrySelfA0159'


--�⹺����¼.����
update ICTemplateEntry
set FFieldName='FModelName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA0160'

 update ICChatBillTitle
set FColName='FModelName'
where FColName='FEntrySelfA0160'


--�⹺����¼.���̺�
update ICTemplateEntry
set FFieldName='FVin'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='���̺�' and FFieldName = 'FEntrySelfA0161'

 update ICChatBillTitle
set FColName='FVin'
where FColName='FEntrySelfA0161'

--�⹺����¼.Ʒ��
update ICTemplateEntry
set FFieldName='FBrandName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='Ʒ��' and FFieldName = 'FEntrySelfA0162'

 update ICChatBillTitle
set FColName='FBrandName'
where FColName='FEntrySelfA0162'

--�⹺����¼.������ʽ
update ICTemplateEntry
set FFieldName='FDriverFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfA0163'

 update ICChatBillTitle
set FColName='FDriverFormName'
where FColName='FEntrySelfA0163'

--�⹺����¼.������ʽ
update ICTemplateEntry
set FFieldName='FPowerFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfA0164'

 update ICChatBillTitle
set FColName='FPowerFormName'
where FColName='FEntrySelfA0164'

--�⹺����¼.����
update ICTemplateEntry
set FFieldName='FInteriorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA0165'

 update ICChatBillTitle
set FColName='FInteriorName'
where FColName='FEntrySelfA0165'
--�⹺����¼.��ɫ
update ICTemplateEntry
set FFieldName='FColorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='��ɫ' and FFieldName = 'FEntrySelfA0166'

update ICChatBillTitle
set FColName='FColorName'
where FColName='FEntrySelfA0166'

--�⹺����¼.ѡװ
update ICTemplateEntry
set FFieldName='FOptional'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='ѡװ' and FFieldName = 'FEntrySelfA0167'

 update ICChatBillTitle
set FColName='FOptional'
where FColName='FEntrySelfA0167'

--�⹺����¼.����

update ICTemplateEntry
set FFieldName='FDisplacementName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA0168'

 update ICChatBillTitle
set FColName='FDisplacementName'
where FColName='FEntrySelfA0168'

--�⹺����¼.��/��
update ICTemplateEntry
set FFieldName='FStereotypeName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='��/��' and FFieldName = 'FEntrySelfA0169'

 update ICChatBillTitle
set FColName='FStereotypeName'
where FColName='FEntrySelfA0169'

--�⹺����¼.����˵��
update ICTemplateEntry
set FFieldName='FCfgDesc'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='����˵��' and FFieldName = 'FEntrySelfA0170'

 update ICChatBillTitle
set FColName='FCfgDesc'
where FColName='FEntrySelfA0170'

--�⹺����¼.��������
update ICTemplateEntry
set FFieldName='FEngineNum'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='��������' and FFieldName = 'FEntrySelfA0171'
 
 update ICChatBillTitle
set FColName='FEngineNum'
where FColName='FEntrySelfA0171'
--�⹺����¼.������
update ICTemplateEntry
set FFieldName='FGearboxName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�⹺���')
 and FHeadCaption='������' and FFieldName = 'FEntrySelfA0172'
 
 update ICChatBillTitle
set FColName='FGearboxName'
where FColName='FEntrySelfA0172'

--��������¼.����
update ICTableRelation 
set FFieldName='FVehicleID'
where FFieldName = 'FEntrySelfA9744'

update ICClassTableInfo
set ffieldname='FVehicleID'
where FFieldName='FEntrySelfA9744'

update ICTemplateEntry
set FFieldName='FVehicleID'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA9744'
 
 update ICChatBillTitle
set FColName='FVehicleID'
where FColName='FEntrySelfA9744'

alter table ICStockBillEntry drop column FEntrySelfA9744;
alter table ICStockBillEntry_1 drop column FEntrySelfA9744;
alter table ICStockBillEntry_10 drop column FEntrySelfA9744;
alter table ICStockBillEntry_2 drop column FEntrySelfA9744;
alter table ICStockBillEntry_21 drop column FEntrySelfA9744;
alter table ICStockBillEntry_24 drop column FEntrySelfA9744;
alter table ICStockBillEntry_28 drop column FEntrySelfA9744;
alter table ICStockBillEntry_29 drop column FEntrySelfA9744;
alter table ICStockBillEntry_41 drop column FEntrySelfA9744;
alter table ICStockBillEntry_5 drop column FEntrySelfA9744;


--��������¼.��ϵ

update ICTemplateEntry
set FFieldName='FSeriesName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='��ϵ' and FFieldName = 'FEntrySelfA9745'
 
update ICChatBillTitle
set FColName='FSeriesName'
where FColName='FEntrySelfA9745'


--��������¼.����
update ICTemplateEntry
set FFieldName='FModelName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA9746'

 update ICChatBillTitle
set FColName='FModelName'
where FColName='FEntrySelfA9746'


--��������¼.���̺�
update ICTemplateEntry
set FFieldName='FVin'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='���̺�' and FFieldName = 'FEntrySelfA9747'

 update ICChatBillTitle
set FColName='FVin'
where FColName='FEntrySelfA9747'

--��������¼.Ʒ��
update ICTemplateEntry
set FFieldName='FBrandName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='Ʒ��' and FFieldName = 'FEntrySelfA9748'

 update ICChatBillTitle
set FColName='FBrandName'
where FColName='FEntrySelfA9748'

--��������¼.������ʽ
update ICTemplateEntry
set FFieldName='FDriverFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfA9749'

 update ICChatBillTitle
set FColName='FDriverFormName'
where FColName='FEntrySelfA9749'

--��������¼.������ʽ
update ICTemplateEntry
set FFieldName='FPowerFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfA9750'

 update ICChatBillTitle
set FColName='FPowerFormName'
where FColName='FEntrySelfA9750'

--��������¼.����
update ICTemplateEntry
set FFieldName='FInteriorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA9751'

 update ICChatBillTitle
set FColName='FInteriorName'
where FColName='FEntrySelfA9751'
--��������¼.��ɫ
update ICTemplateEntry
set FFieldName='FColorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='��ɫ' and FFieldName = 'FEntrySelfA9752'

update ICChatBillTitle
set FColName='FColorName'
where FColName='FEntrySelfA9752'

--��������¼.ѡװ
update ICTemplateEntry
set FFieldName='FOptional'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='ѡװ' and FFieldName = 'FEntrySelfA9753'

 update ICChatBillTitle
set FColName='FOptional'
where FColName='FEntrySelfA9753'

--��������¼.����

update ICTemplateEntry
set FFieldName='FDisplacementName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfA9754'

 update ICChatBillTitle
set FColName='FDisplacementName'
where FColName='FEntrySelfA9754'

--��������¼.��/��
update ICTemplateEntry
set FFieldName='FStereotypeName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='��/��' and FFieldName = 'FEntrySelfA9755'

 update ICChatBillTitle
set FColName='FStereotypeName'
where FColName='FEntrySelfA9755'

--��������¼.����˵��
update ICTemplateEntry
set FFieldName='FCfgDesc'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='����˵��' and FFieldName = 'FEntrySelfA9756'

 update ICChatBillTitle
set FColName='FCfgDesc'
where FColName='FEntrySelfA9756'

--��������¼.��������
update ICTemplateEntry
set FFieldName='FEngineNum'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='��������' and FFieldName = 'FEntrySelfA9757'
 
 update ICChatBillTitle
set FColName='FEngineNum'
where FColName='FEntrySelfA9757'
--��������¼.������
update ICTemplateEntry
set FFieldName='FGearboxName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������')
 and FHeadCaption='������' and FFieldName = 'FEntrySelfA9758'
 
 update ICChatBillTitle
set FColName='FGearboxName'
where FColName='FEntrySelfA9758'


--�������ⵥ��¼.����
update ICTableRelation 
set FFieldName='FVehicleID'
where FFieldName = 'FEntrySelfB0944'

update ICClassTableInfo
set ffieldname='FVehicleID'
where FFieldName='FEntrySelfB0944'

update ICTemplateEntry
set FFieldName='FVehicleID'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfB0944'
 
 update ICChatBillTitle
set FColName='FVehicleID'
where FColName='FEntrySelfB0944'

alter table ICStockBillEntry drop column FEntrySelfB0944;
alter table ICStockBillEntry_1 drop column FEntrySelfB0944;
alter table ICStockBillEntry_10 drop column FEntrySelfB0944;
alter table ICStockBillEntry_2 drop column FEntrySelfB0944;
alter table ICStockBillEntry_21 drop column FEntrySelfB0944;
alter table ICStockBillEntry_24 drop column FEntrySelfB0944;
alter table ICStockBillEntry_28 drop column FEntrySelfB0944;
alter table ICStockBillEntry_29 drop column FEntrySelfB0944;
alter table ICStockBillEntry_41 drop column FEntrySelfB0944;
alter table ICStockBillEntry_5 drop column FEntrySelfB0944;


--�������ⵥ��¼.��ϵ

update ICTemplateEntry
set FFieldName='FSeriesName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='��ϵ' and FFieldName = 'FEntrySelfB0945'
 
update ICChatBillTitle
set FColName='FSeriesName'
where FColName='FEntrySelfB0945'


--�������ⵥ��¼.����
update ICTemplateEntry
set FFieldName='FModelName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfB0946'

 update ICChatBillTitle
set FColName='FModelName'
where FColName='FEntrySelfB0946'


--�������ⵥ��¼.���̺�
update ICTemplateEntry
set FFieldName='FVin'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='���̺�' and FFieldName = 'FEntrySelfB0947'

 update ICChatBillTitle
set FColName='FVin'
where FColName='FEntrySelfB0947'

--�������ⵥ��¼.Ʒ��
update ICTemplateEntry
set FFieldName='FBrandName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='Ʒ��' and FFieldName = 'FEntrySelfB0948'

 update ICChatBillTitle
set FColName='FBrandName'
where FColName='FEntrySelfB0948'

--�������ⵥ��¼.������ʽ
update ICTemplateEntry
set FFieldName='FDriverFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfB0949'

 update ICChatBillTitle
set FColName='FDriverFormName'
where FColName='FEntrySelfB0949'

--�������ⵥ��¼.������ʽ
update ICTemplateEntry
set FFieldName='FPowerFormName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='������ʽ' and FFieldName = 'FEntrySelfB0950'

 update ICChatBillTitle
set FColName='FPowerFormName'
where FColName='FEntrySelfB0950'

--�������ⵥ��¼.����
update ICTemplateEntry
set FFieldName='FInteriorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfB0951'

 update ICChatBillTitle
set FColName='FInteriorName'
where FColName='FEntrySelfB0951'
--�������ⵥ��¼.��ɫ
update ICTemplateEntry
set FFieldName='FColorName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='��ɫ' and FFieldName = 'FEntrySelfB0952'

update ICChatBillTitle
set FColName='FColorName'
where FColName='FEntrySelfB0952'

--�������ⵥ��¼.ѡװ
update ICTemplateEntry
set FFieldName='FOptional'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='ѡװ' and FFieldName = 'FEntrySelfB0953'

 update ICChatBillTitle
set FColName='FOptional'
where FColName='FEntrySelfB0953'

--�������ⵥ��¼.����

update ICTemplateEntry
set FFieldName='FDisplacementName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='����' and FFieldName = 'FEntrySelfB0954'

 update ICChatBillTitle
set FColName='FDisplacementName'
where FColName='FEntrySelfB0954'

--�������ⵥ��¼.��/��
update ICTemplateEntry
set FFieldName='FStereotypeName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='��/��' and FFieldName = 'FEntrySelfB0955'

 update ICChatBillTitle
set FColName='FStereotypeName'
where FColName='FEntrySelfB0955'

--�������ⵥ��¼.����˵��
update ICTemplateEntry
set FFieldName='FCfgDesc'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='����˵��' and FFieldName = 'FEntrySelfB0956'

 update ICChatBillTitle
set FColName='FCfgDesc'
where FColName='FEntrySelfB0956'

--�������ⵥ��¼.��������
update ICTemplateEntry
set FFieldName='FEngineNum'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='��������' and FFieldName = 'FEntrySelfB0957'
 
 update ICChatBillTitle
set FColName='FEngineNum'
where FColName='FEntrySelfB0957'
--�������ⵥ��¼.������
update ICTemplateEntry
set FFieldName='FGearboxName'
where FID=(select FTemplateID from ICTransactionType where FHeadTable='ICStockBill' and FName='�������ⵥ')
 and FHeadCaption='������' and FFieldName = 'FEntrySelfB0958'
 
 update ICChatBillTitle
set FColName='FGearboxName'
where FColName='FEntrySelfB0958'
update t_DataFlowTimeStamp 
set FName=FName