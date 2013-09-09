VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SettlementCheck_BillEvent"
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
    
    Set dct = m_BillInterface.GetDataFldbyKey("FBase")

    If (Not (dct Is Nothing) And m_BillInterface.BillStatus = Enu_BillStatusExt_New) Then '解决 车辆自动带出其他属性值
        m_BillInterface.SetFieldValue "FBase", dct("FFND")
    End If
    
 
End Sub

Private Sub Class_Terminate()
 
    '释放接口对象
    '注意: 此方法必须存在, 请勿修改
    Set m_BillInterface = Nothing

End Sub


Private Sub m_BillInterface_MenuBarInitialize(ByVal oMenuBar As K3ClassEvents.MenuBar)
    oMenuBar.BOSTools.Item("mnuFileSave").Caption = "正常通过"
    oMenuBar.BOSTools.Item("mnuFileSave").Description = "正常通过"
    oMenuBar.BOSTools.Item("mnuFileSave").ToolTipText = "正常通过"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").Caption = "正常通过"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").Description = "正常通过"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").ToolTipText = "正常通过"
End Sub


Private Sub m_BillInterface_AfterSave(bCancel As Boolean)
 
    'TODO: 请在此处添加代码响应事件
    Dim sourceID As Integer
    Dim sourceEntryID As Integer
    
    Dim sql As String
    Dim rs As ADODB.Recordset
    Dim checkStatus As String
    Dim checkBillID As Integer

    checkBillID = m_BillInterface.GetFieldValue("FID")
    sourceID = m_BillInterface.GetFieldValue("FID_SRC")
    sourceEntryID = m_BillInterface.GetFieldValue("FEntryID_SRC")
    checkStatus = m_BillInterface.GetFieldValue("FComboBox") '结算状态
    
    '更新销售订单结算检查信息
    sql = "update T_ATS_VehicleSaleOrderEntry " & _
          "set FCheckStatus ='" & checkStatus & "'," & _
          "FSettlementCheckID=" & checkBillID & _
          " where FID=" & sourceID & " and FEntryID=" & sourceEntryID
   m_BillInterface.K3Lib.UpdateData (sql)
   
   MsgBox "结算检查成功", vbInformation, "金蝶提示"
   m_BillInterface.BillCtl.BillStatus = Enu_BillStatusExt_View
   m_BillInterface.RefreshBill
   
   
   

End Sub




Private Sub m_BillInterface_MenuBarClick(ByVal BOSTool As K3ClassEvents.BOSTool, Cancel As Boolean)
    Dim sql As String
    Dim sourceID As Integer
    Dim sourceEntryID As Integer
    Dim checkBillID As Integer
    Dim rs As ADODB.Recordset
    Dim diffAmt As Double
    sourceID = Val(m_BillInterface.GetFieldValue("FID_SRC")) '销售订单ID
    sourceEntryID = Val(m_BillInterface.GetFieldValue("FEntryID_SRC")) '销售订单分录ID
    checkBillID = Val(m_BillInterface.GetFieldValue("FID")) '检查单ID
    diffAmt = Val(m_BillInterface.GetFieldValue("FAmount12")) '差额
    
    
    If BOSTool.ToolName = "mnuFileSave" Then '正常通过
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FCheckStatus<>'1' and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
            MsgBox "已结算检查通过，若需重新检查，请执行重新检查操作", vbInformation, "金蝶提示"
            Cancel = True
            Exit Sub
        End If
        If (diffAmt > 0) Then
           MsgBox "已收金额小于应收金额，有差额未收，不能正常通过！", vbInformation, "金蝶提示"
           Cancel = True
           Exit Sub
        End If
        
        
        If MsgBox("是否结算正常通过？", vbQuestion + vbYesNo, "金蝶提示") = vbNo Then
                Cancel = True
                Exit Sub
        End If
        m_BillInterface.SetFieldValue "FCombobox", "2"
    End If
    
    If BOSTool.ToolName = "mnuSpecialPass" Then '特批通过
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FCheckStatus<>'1' and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
            MsgBox "已结算检查通过，若需重新检查，请执行重新检查操作", vbInformation, "金蝶提示"
            Cancel = True
            Exit Sub
        End If
        Dim specialChecker As KFO.Dictionary
        Set specialChecker = m_BillInterface.GetDataFldbyKey("FBase2") '特批人
        
        If specialChecker("FFLD") = "" Then
            MsgBox "特批通过，特批人不能为空！", vbInformation, "金蝶提示"
            Cancel = True
            Exit Sub
        End If
        
        If MsgBox("是否结算检查特批通过？", vbQuestion + vbYesNo, "金蝶提示") = vbNo Then
                Cancel = True
                Exit Sub
        End If
        m_BillInterface.SetFieldValue "FCombobox", "3"
        m_BillInterface.SaveBill
        m_BillInterface.BillCtl.BillStatus = Enu_BillStatusExt_View
        m_BillInterface.RefreshBill
        MsgBox "结算检查特批通过成功", vbInformation, "金蝶提示"
    
    End If
    
    If BOSTool.ToolName = "mnuUnPass" Then '不通过
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FCheckStatus<>'1' and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
            MsgBox "已结算检查通过，若需重新检查，请执行重新检查操作", vbInformation, "金蝶提示"
            Cancel = True
            Exit Sub
        End If
        
        If MsgBox("是否结算检查不通过？", vbQuestion + vbYesNo, "金蝶提示") = vbNo Then
                Cancel = True
                Exit Sub
        End If
        m_BillInterface.SetFieldValue "FCombobox", "4"
        m_BillInterface.SaveBill
        m_BillInterface.BillCtl.BillStatus = Enu_BillStatusExt_View
        m_BillInterface.RefreshBill
        MsgBox "结算检查不通过成功", vbInformation, "金蝶提示"
    End If
    
    If BOSTool.ToolName = "mnuReCheck" Then '重新检查
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FCheckStatus='1' and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
            MsgBox "未结算检查，无需重新检查", vbInformation, "金蝶提示"
            Cancel = True
            Exit Sub
        End If
         If MsgBox("是否重新结算检查？", vbQuestion + vbYesNo, "金蝶提示") = vbNo Then
            Cancel = True
            Exit Sub
        End If
        
        '清除检查标记
        sql = "update T_ATS_VehicleSaleOrderEntry " & _
              "set FCheckStatus='1' " & _
              "where FID=" & sourceID & " and FEntryID=" & sourceEntryID
        '清除检查信息
        m_BillInterface.K3Lib.UpdateData (sql)
        sql = "update t_ats_SettlementCheck " & _
              "set FStatus = '1'," & _
              "FChecker=0,FDate=null,FSpecialChecker=0,FNOTE='' " & _
              "where FID=" & checkBillID
         m_BillInterface.K3Lib.UpdateData (sql)
         m_BillInterface.BillCtl.BillStatus = Enu_BillStatusExt_Modify
         m_BillInterface.RefreshBill
         MsgBox "重新结算检查成功", vbInformation, "金蝶提示"
         
        
    End If
    
    
    
End Sub

