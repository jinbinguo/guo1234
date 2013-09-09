VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Assign_BillEvent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Description = "This is BillEvent Interface Class, made by K3BOSPLUGINSWIZAED"
 
'定义 BillEvent 接口. 必须具有的声明, 以此来获得事件
Private WithEvents m_BillInterface  As BillEvent
Attribute m_BillInterface.VB_VarHelpID = -1
 
Public Sub Show(ByVal oBillInterface As Object)
 
    'BillEvent 接口实现
    '注意: 此方法必须存在, 请勿修改
    Set m_BillInterface = oBillInterface
    
    Dim dct As Object
    
    Set dct = m_BillInterface.GetDataFldbyKey("FBase2")

    If (Not (dct Is Nothing) And m_BillInterface.BillStatus = Enu_BillStatusExt_New) Then '解决 车型自动带出其他属性值
        m_BillInterface.SetFieldValue "FBase2", dct("FFND")
    End If
    
 
End Sub

Private Sub Class_Terminate()
 
    '释放接口对象
    '注意: 此方法必须存在, 请勿修改
    Set m_BillInterface = Nothing

End Sub

Private Sub m_BillInterface_AfterSave(bCancel As Boolean)
 
    'TODO: 请在此处添加代码响应事件
    Dim sourceID As Integer
    Dim sourceEntryID As Integer
    Dim assignDate As Date
    Dim personID As Integer
    Dim vehicleId As Integer
    Dim assignNum As String
    Dim sql As String
    Dim assignID As Integer
    Dim rs As ADODB.Recordset
    Dim vin As String
    
    
    sourceID = m_BillInterface.GetFieldValue("FID_SRC")
    
    assignID = m_BillInterface.GetFieldValue("FID")
    sourceEntryID = m_BillInterface.GetFieldValue("FEntryID_SRC")
    assignDate = m_BillInterface.GetFieldValue("FDate")
    personID = m_BillInterface.GetFieldValue("FBase")
    vehicleId = m_BillInterface.GetFieldValue("FBase1")
    assignNum = m_BillInterface.GetFieldValue("FBillNO")
    vin = m_BillInterface.GetFieldValue("FBaseProperty11")
    '更新销售订单配车信息
    sql = "update T_ATS_VehicleSaleOrderEntry " & _
          "set FIsAssign = 1," & _
          "FAssignDate = '" & FormatDateTime(assignDate) & "'," & _
          "FVehicleID = " & vehicleId & ", " & _
          "FAssignBillID=" & assignID & "," & _
          "FAssignBillNo='" & assignNum & "'," & _
          "FVin='" & vin & "' " & _
          "where FID=" & sourceID & " and FEntryID=" & sourceEntryID
   m_BillInterface.K3Lib.UpdateData (sql)
   '更新车辆状态为"已配车"
   sql = "update t_ats_vehicle set FVehicleStatus=2 where fid=" & vehicleId
   m_BillInterface.K3Lib.UpdateData (sql)
   MsgBox "配车成功", vbInformation, "金蝶提示"
   m_BillInterface.BillCtl.BillStatus = Enu_BillStatusExt_View
   m_BillInterface.RefreshBill
   
   
   

End Sub




Private Sub m_BillInterface_MenuBarClick(ByVal BOSTool As K3ClassEvents.BOSTool, Cancel As Boolean)
    Dim sql As String
    Dim sourceID As Integer
    Dim sourceEntryID As Integer
    Dim rs As ADODB.Recordset
    sourceID = Val(m_BillInterface.GetFieldValue("FID_SRC"))
    sourceEntryID = Val(m_BillInterface.GetFieldValue("FEntryID_SRC"))
    
    If BOSTool.ToolName = "mnuFileSave" Then '配车
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where fisassign=1 and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
            MsgBox "已配车，若需重新配车，请先取消配车", vbInformation, "金蝶提示"
            Cancel = True
            Exit Sub
        End If
        If MsgBox("是否进行配车？", vbQuestion + vbYesNo, "金蝶提示") = vbNo Then
                Cancel = True
                Exit Sub
            End If
    End If
    
    If BOSTool.ToolName = "unAssign" Then '取消配车
        Dim vehicle As KFO.Dictionary
        Set vehicle = m_BillInterface.GetDataFldbyKey("FBase1") '车辆
        
        '是否已结算检查
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FCheckStatus<>'1' and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
             MsgBox "已结算检查，若需重新配车，请先取消结算检查", vbInformation, "金蝶提示"
            Cancle = True
            Exit Sub
        End If
        
        
        If vehicle("FFLD") <> "" Then
            If MsgBox("是否取消配车？", vbQuestion + vbYesNo, "金蝶提示") = vbNo Then
                Cancel = True
                Exit Sub
            End If
            
            '更新车辆状态为"在售中"
            sql = "update t_ats_vehicle set FVehicleStatus=1 where fid=" & vehicle("FFLD")
            m_BillInterface.K3Lib.UpdateData (sql)
            
            '清除销售订单的配车标记
            sql = "update T_ATS_VehicleSaleOrderEntry " & _
                  "set FIsAssign = 0," & _
                  "FAssignDate = null," & _
                  "FVehicleID = 0, " & _
                  "FVIN='' " & _
                  "where FID=" & sourceID & " and FEntryID=" & sourceEntryID
            m_BillInterface.K3Lib.UpdateData (sql)
            
            '清除配车单的配车信息
            sql = "update T_ATS_Assign " & _
                  "set FVehicleID=0,FDate=null,FPersonID = 0 " & _
                  "where FID= " & Val(m_BillInterface.Data("FID"))
            m_BillInterface.K3Lib.UpdateData (sql)
            MsgBox "取消配车成功", vbInformation, "金蝶提示"
            m_BillInterface.BillCtl.BillStatus = Enu_BillStatusExt_Modify
            m_BillInterface.RefreshBill
            
        Else
            MsgBox "未配车,不能取消配车", vbInformation, "金蝶提示"
        End If
    
    End If
    
    
End Sub

Private Sub m_BillInterface_MenuBarInitialize(ByVal oMenuBar As K3ClassEvents.MenuBar)
    oMenuBar.BOSTools.Item("mnuFileSave").Caption = "配车"
    oMenuBar.BOSTools.Item("mnuFileSave").Description = "配车"
    oMenuBar.BOSTools.Item("mnuFileSave").ToolTipText = "配车"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").Caption = "配车"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").Description = "配车"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").ToolTipText = "配车"
End Sub
