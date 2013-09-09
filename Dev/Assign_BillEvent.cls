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
 
'���� BillEvent �ӿ�. ������е�����, �Դ�������¼�
Private WithEvents m_BillInterface  As BillEvent
Attribute m_BillInterface.VB_VarHelpID = -1
 
Public Sub Show(ByVal oBillInterface As Object)
 
    'BillEvent �ӿ�ʵ��
    'ע��: �˷����������, �����޸�
    Set m_BillInterface = oBillInterface
    
    Dim dct As Object
    
    Set dct = m_BillInterface.GetDataFldbyKey("FBase2")

    If (Not (dct Is Nothing) And m_BillInterface.BillStatus = Enu_BillStatusExt_New) Then '��� �����Զ�������������ֵ
        m_BillInterface.SetFieldValue "FBase2", dct("FFND")
    End If
    
 
End Sub

Private Sub Class_Terminate()
 
    '�ͷŽӿڶ���
    'ע��: �˷����������, �����޸�
    Set m_BillInterface = Nothing

End Sub

Private Sub m_BillInterface_AfterSave(bCancel As Boolean)
 
    'TODO: ���ڴ˴����Ӵ�����Ӧ�¼�
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
    '�������۶����䳵��Ϣ
    sql = "update T_ATS_VehicleSaleOrderEntry " & _
          "set FIsAssign = 1," & _
          "FAssignDate = '" & FormatDateTime(assignDate) & "'," & _
          "FVehicleID = " & vehicleId & ", " & _
          "FAssignBillID=" & assignID & "," & _
          "FAssignBillNo='" & assignNum & "'," & _
          "FVin='" & vin & "' " & _
          "where FID=" & sourceID & " and FEntryID=" & sourceEntryID
   m_BillInterface.K3Lib.UpdateData (sql)
   '���³���״̬Ϊ"���䳵"
   sql = "update t_ats_vehicle set FVehicleStatus=2 where fid=" & vehicleId
   m_BillInterface.K3Lib.UpdateData (sql)
   MsgBox "�䳵�ɹ�", vbInformation, "�����ʾ"
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
    
    If BOSTool.ToolName = "mnuFileSave" Then '�䳵
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where fisassign=1 and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
            MsgBox "���䳵�����������䳵������ȡ���䳵", vbInformation, "�����ʾ"
            Cancel = True
            Exit Sub
        End If
        If MsgBox("�Ƿ�����䳵��", vbQuestion + vbYesNo, "�����ʾ") = vbNo Then
                Cancel = True
                Exit Sub
            End If
    End If
    
    If BOSTool.ToolName = "unAssign" Then 'ȡ���䳵
        Dim vehicle As KFO.Dictionary
        Set vehicle = m_BillInterface.GetDataFldbyKey("FBase1") '����
        
        '�Ƿ��ѽ�����
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FCheckStatus<>'1' and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
             MsgBox "�ѽ����飬���������䳵������ȡ��������", vbInformation, "�����ʾ"
            Cancle = True
            Exit Sub
        End If
        
        
        If vehicle("FFLD") <> "" Then
            If MsgBox("�Ƿ�ȡ���䳵��", vbQuestion + vbYesNo, "�����ʾ") = vbNo Then
                Cancel = True
                Exit Sub
            End If
            
            '���³���״̬Ϊ"������"
            sql = "update t_ats_vehicle set FVehicleStatus=1 where fid=" & vehicle("FFLD")
            m_BillInterface.K3Lib.UpdateData (sql)
            
            '������۶������䳵���
            sql = "update T_ATS_VehicleSaleOrderEntry " & _
                  "set FIsAssign = 0," & _
                  "FAssignDate = null," & _
                  "FVehicleID = 0, " & _
                  "FVIN='' " & _
                  "where FID=" & sourceID & " and FEntryID=" & sourceEntryID
            m_BillInterface.K3Lib.UpdateData (sql)
            
            '����䳵�����䳵��Ϣ
            sql = "update T_ATS_Assign " & _
                  "set FVehicleID=0,FDate=null,FPersonID = 0 " & _
                  "where FID= " & Val(m_BillInterface.Data("FID"))
            m_BillInterface.K3Lib.UpdateData (sql)
            MsgBox "ȡ���䳵�ɹ�", vbInformation, "�����ʾ"
            m_BillInterface.BillCtl.BillStatus = Enu_BillStatusExt_Modify
            m_BillInterface.RefreshBill
            
        Else
            MsgBox "δ�䳵,����ȡ���䳵", vbInformation, "�����ʾ"
        End If
    
    End If
    
    
End Sub

Private Sub m_BillInterface_MenuBarInitialize(ByVal oMenuBar As K3ClassEvents.MenuBar)
    oMenuBar.BOSTools.Item("mnuFileSave").Caption = "�䳵"
    oMenuBar.BOSTools.Item("mnuFileSave").Description = "�䳵"
    oMenuBar.BOSTools.Item("mnuFileSave").ToolTipText = "�䳵"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").Caption = "�䳵"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").Description = "�䳵"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").ToolTipText = "�䳵"
End Sub