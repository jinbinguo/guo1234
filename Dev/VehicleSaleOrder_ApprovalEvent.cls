VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VehicleSaleOrder_ApprovalEvent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Description = "This is ApprovalEvents Interface Class, made by K3BOSPLUGINSWIZAED"
 

Private WithEvents m_ApprovalInterface  As MixedApprovalEvents
Attribute m_ApprovalInterface.VB_VarHelpID = -1
 
Public Sub Show(ByVal oApprovalInterface As Object)
 
    
    '注意: 此方法必须存在, 请勿修改
    Set m_ApprovalInterface = oApprovalInterface
 
End Sub

Private Sub Class_Terminate()
 
    '释放接口对象
    '注意: 此方法必须存在, 请勿修改
    Set m_ApprovalInterface = Nothing

End Sub

Private Sub m_ApprovalInterface_UnCheckDone(ByVal lUnCheckNodeIndex As Long, ByVal bSucceed As Variant)
'    Dim dct As KFO.Dictionary
'    Set dct = m_ApprovalInterface.BillData
'    Dim sql As String
'    sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FIsAssign=1 and FID=" & Val(dct("FID"))
'    Dim rs As ADODB.Recordset
'    Set rs = m_ApprovalInterface.K3Lib.GetData(sql)
'    If Not rs.EOF Then
'        MsgBox "已配车,不能驳回审核", vbExclamation, "金蝶提示"
'        bCancel = True
'        Exit Sub
'    End If
'    '反审核，删除结算检查单
'    sql = "delete t_ats_SettlementCheckEntry where FID in (select FID from t_ats_SettlementCheck where FID_SRC=" & Val(dct("FID")) & ")"
'    m_ApprovalInterface.K3Lib.UpdateData (sql)
'
'    sql = "delete t_ats_SettlementCheck where FID_SRC=" & Val(dct("FID"))
'    m_ApprovalInterface.K3Lib.UpdateData (sql)
'
'
'    '反审核，删除配车单
'    sql = "delete T_ATS_AssignEntry where FID in (select FID from T_ATS_Assign where FID_SRC=" & Val(dct("FID")) & ")"
'    m_ApprovalInterface.K3Lib.UpdateData (sql)
'
'    sql = "delete T_ATS_Assign where FID_SRC=" & Val(dct("FID"))
'    m_ApprovalInterface.K3Lib.UpdateData (sql)
'
'
'
'    '清除配车、结算检查相关信息
'    sql = "update T_ATS_VehicleSaleOrderEntry " & _
'          "set FIsAssign = 0," & _
'          "FAssignDate = null," & _
'          "FVehicleID = 0, " & _
'          "FAssignBillID=0," & _
'          "FAssignBillNo=''," & _
'          "FCheckStatus = '1'," & _
'          "FSettlementCheckID = 0" & _
'          " where FID=" & Val(dct("FID"))
'   m_ApprovalInterface.K3Lib.UpdateData (sql)

End Sub

