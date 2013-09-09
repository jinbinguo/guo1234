--车型视图
drop view v_ats_model
create view v_ats_model as
select a.FID,a.FName,a.FNumber,0 'FParentID',-1 'FLogic',1 'FDetail',0 'FDiscontinued',1 'FLevels',
a.FNumber 'FFullNumber',1 'FEntryID', 0 'FIndex',200000026 'FClassTypeID',
a.FSeriesID,isnull(a.FMakerModelNum,'') FMakerModelNum,b.FBrandID,a.FDisplacementID,a.FGearboxID,a.FStereotypeID,a.FPowerFormID,
a.FDriverFormID,isnull(a.FCfgDesc,'') FCfgDesc,a.FICItemID,a.FUnitID,a.FMakerGuideAmount,a.FCompGuideAmount,a.fstatus,a.FCarSourceID,
ISNULL(b.FName,'') FSeriesName,ISNULL(c.FName,'') FBrandName,ISNULL(d.FName,'') FDisplacementName,
ISNULL(e.FName,'') FGearboxName,ISNULL(f.FName,'') FStereotypeName,ISNULL(g.FName,'') FPowerFormName,
ISNULL(h.FName,'') FDriverFormName,ISNULL(i.FName,'') FCarSourceName,ISNULL(j.FName,'') FICItemName,
ISNULL(k.FName,'') FUnitName
from T_ATS_Model a
left join T_ATS_Series b on b.FID=a.FSeriesID
left join T_ATS_Brand c on c.FID=a.FBrandID
left join T_ATS_Displacement d on d.FID=a.FDisplacementID
left join T_ATS_Gearbox e on e.FID=a.FGearboxID
left join T_ATS_Stereotype f on f.FID=a.FStereotypeID 
left join T_ATS_PowerForm g on g.FID=a.FPowerFormID 
left join T_ATS_DriverForm h on h.FID=a.FDriverFormID
left join T_ATS_CarSource i on i.FID=a.FCarSourceID 
left join t_ICItem j on j.FItemID=a.FICItemID
left join t_MeasureUnit k on k.FItemID=a.FUnitID

--车系视图
drop view v_ats_series
create view V_ATS_Series as
select FID,FName,FNumber,0 'FParentID',-1 'FLogic',1 'FDetail',0 'FDiscontinued',1 'FLevels',
FNumber 'FFullNumber',1 'FEntryID', 0 'FIndex',200000027 'FClassTypeID',FBrandID,FCarTypeID,FStatus
from T_ATS_Series

--车辆档案
drop table V_ATS_Vehicle
alter view V_ATS_Vehicle as
select a.FID,a.FCfgDesc 'FName',a.FBillNo 'FNumber',0 'FParentID',-1 'FLogic',1 'FDetail',0 'FDiscontinued',1 'FLevels',
a.FBillNo 'FFullNumber',1 'FEntryID', 0 'FIndex',200000030 'FClassTypeID',a.FModelID,b.FBrandID,b.FCarSourceID,
isnull(a.FCfgDesc,'') FCfgDesc,isnull(a.FVIN,'') FVIN,
isnull(a.FEngineNum,'') FEngineNum,b.FDisplacementID,b.FGearboxID,b.FStereotypeID,b.FPowerFormID,b.FDriverFormID,
a.FInteriorID,a.FColorID,isnull(a.FOptional,'') FOptional,b.FICItemID,b.FUnitID,b.FSeriesID,isnull(b.FMakerModelNum,'') FMakerModelNum,
a.FStatus,a.FVehicleStatus,isnull(c.FName,'') FSeriesName,isnull(d.FName,'') FBrandName,isnull(e.FName,'') FDisplacementName,
isnull(f.FName,'') FGearboxName,isnull(g.FName,'') FStereotypeName,isnull(b.FName,'') FModelName, isnull(h.FName,'') FPowerFormName,
isnull(i.FName,'') FDriverFormName,isnull(j.FName,'') FCarSourceName, isnull(k.FInterior,'') FInteriorName,isnull(l.FColor,'') FColorName,
isnull(m.FName,'') FICItemName,isnull(n.FName,'') FUnitName
from T_ATS_Vehicle a
left join T_ATS_Model b on b.FID=a.FModelID
left join T_ATS_Series c on c.FID=b.FSeriesID 
left join T_ATS_Brand d on d.FID=b.FBrandID 
left join T_ATS_Displacement e on e.FID=b.FDisplacementID
left join T_ATS_Gearbox f on f.FID=b.FGearboxID
left join T_ATS_Stereotype g on g.FID=b.FStereotypeID
left join T_ATS_PowerForm h on h.FID=b.FPowerFormID 
left join T_ATS_DriverForm i on i.FID=b.FDriverFormID
left join T_ATS_CarSource j on j.FID=b.FCarSourceID 
left join T_ATS_SeriesInterior k on k.FEntryID =a.FInteriorID 
left join T_ATS_SeriesColor l on l.FEntryID=a.FColorID 
left join t_ICItem m on m.FItemID = b.FICItemID 
left join t_MeasureUnit n on n.FItemID = b.FUnitID 


--车系_颜色视图
drop table v_ats_color
create view v_ats_color as
select FEntryID,200000024 'FClassTypeID',FEntryID 'FID',FIndex,FColorNumber 'FNumber',
FColor 'FName',0 'FParentID',-1 'FLogic',1 'FDetail',0 'FDiscontinued',1 'FLevels',
FColorNumber 'FFullNumber',FID 'FSeriesID'
from T_ATS_SeriesColor

--车系_内饰视图
drop table v_ats_interior
create view v_ats_interior as
select FEntryID,200000025 'FClassTypeID',FEntryID 'FID',FIndex,FInteriorNumber 'FNumber',
FInterior 'FName',0 'FParentID',-1 'FLogic',1 'FDetail',0 'FDiscontinued',1 'FLevels',
FInteriorNumber 'FFullNumber',FID 'FSeriesID'
from T_ATS_SeriesInterior

--车系_型/版视图
drop table V_ATS_Stereotype
create view V_ATS_Stereotype as
select FEntryID,200000031 'FClassTypeID',FEntryID 'FID',FIndex,FStereotypeNumber 'FNumber',
FStereotype 'FName',0 'FParentID',-1 'FLogic',1 'FDetail',0 'FDiscontinued',1 'FLevels',
FStereotypeNumber 'FFullNumber',FID 'FSeriesID'
from T_ATS_SeriesStereotype

--物料分类视图
drop table V_ATS_ICItemClassTree
create view V_ATS_ICItemClassTree as
select FItemID 'FID',FName,FNumber,FParentID,-1 'FLogic',FDetail,0 'FDiscontinued',FLevel,FFullNumber,200000032 'FClassTypeID'
from t_Item where FItemClassID=4 and FDetail=0 

drop table V_ATS_ICItemClass
create view V_ATS_ICItemClass as 
select 0 'FEntryID',200000032 'FClassTypeID',FItemID 'FID',0 'FIndex',FNumber,FName
from t_Item where FItemClassID=4 and FDetail=0 

--计量单位视图
drop view v_ats_unittree
create view v_ats_unittree as
select FItemID 'FID',FName,FNumber,FUnitGroupID 'FParentID',-1 'FLogic',1 'FDetail',0 'FDiscontinued',2 'FLevel',FNumber 'FFullNumber',200000034 'FClassTypeID'
from t_MeasureUnit  where FItemID>0
union
select FItemID 'FID',FName,FNumber,0 'FParentID',-1 'FLogic',0 'FDetail',0 'FDiscontinued',1 'FLevel',FFullNumber,200000034 'FClassTypeID'
from t_Item where FItemClassID=7 and FDetail=0 
 

drop view v_ats_unit
create view v_ats_unit as 
select 0 'FEntryID',200000034 'FClassTypeID',FItemID 'FID',0 'FIndex',FNumber,FName
from t_Item where FItemClassID=7 and FDetail=0 
union
select 0 'FEntryID',200000034 'FClassTypeID',FItemID 'FID',0 'FIndex',FNumber,FName
from t_MeasureUnit where FItemID>0



