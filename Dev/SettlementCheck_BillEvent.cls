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
 
'���� BillEvent �ӿ�. ������е�����, �Դ�������¼�
Private WithEvents m_BillInterface  As BillEvent
Attribute m_BillInterface.VB_VarHelpID = -1
 
Public Sub Show(ByVal oBillInterface As Object)
 
    'BillEvent �ӿ�ʵ��
    'ע��: �˷����������, �����޸�
    Set m_BillInterface = oBillInterface
    
    Dim dct As Object
    
    Set dct = m_BillInterface.GetDataFldbyKey("FBase")

    If (Not (dct Is Nothing) And m_BillInterface.BillStatus = Enu_BillStatusExt_New) Then '��� �����Զ�������������ֵ
        m_BillInterface.SetFieldValue "FBase", dct("FFND")
    End If
    
 
End Sub

Private Sub Class_Terminate()
 
    '�ͷŽӿڶ���
    'ע��: �˷����������, �����޸�
    Set m_BillInterface = Nothing

End Sub


Private Sub m_BillInterface_MenuBarInitialize(ByVal oMenuBar As K3ClassEvents.MenuBar)
    oMenuBar.BOSTools.Item("mnuFileSave").Caption = "����ͨ��"
    oMenuBar.BOSTools.Item("mnuFileSave").Description = "����ͨ��"
    oMenuBar.BOSTools.Item("mnuFileSave").ToolTipText = "����ͨ��"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").Caption = "����ͨ��"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").Description = "����ͨ��"
    oMenuBar.BOSBands("BandToolBar").BOSTools.Item("mnuFileSave").ToolTipText = "����ͨ��"
End Sub


Private Sub m_BillInterface_AfterSave(bCancel As Boolean)
 
    'TODO: ���ڴ˴����Ӵ�����Ӧ�¼�
    Dim sourceID As Integer
    Dim sourceEntryID As Integer
    
    Dim sql As String
    Dim rs As ADODB.Recordset
    Dim checkStatus As String
    Dim checkBillID As Integer

    checkBillID = m_BillInterface.GetFieldValue("FID")
    sourceID = m_BillInterface.GetFieldValue("FID_SRC")
    sourceEntryID = m_BillInterface.GetFieldValue("FEntryID_SRC")
    checkStatus = m_BillInterface.GetFieldValue("FComboBox") '����״̬
    
    '�������۶�����������Ϣ
    sql = "update T_ATS_VehicleSaleOrderEntry " & _
          "set FCheckStatus ='" & checkStatus & "'," & _
          "FSettlementCheckID=" & checkBillID & _
          " where FID=" & sourceID & " and FEntryID=" & sourceEntryID
   m_BillInterface.K3Lib.UpdateData (sql)
   
   MsgBox "������ɹ�", vbInformation, "�����ʾ"
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
    sourceID = Val(m_BillInterface.GetFieldValue("FID_SRC")) '���۶���ID
    sourceEntryID = Val(m_BillInterface.GetFieldValue("FEntryID_SRC")) '���۶�����¼ID
    checkBillID = Val(m_BillInterface.GetFieldValue("FID")) '��鵥ID
    diffAmt = Val(m_BillInterface.GetFieldValue("FAmount12")) '���
    
    
    If BOSTool.ToolName = "mnuFileSave" Then '����ͨ��
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FCheckStatus<>'1' and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
            MsgBox "�ѽ�����ͨ�����������¼�飬��ִ�����¼�����", vbInformation, "�����ʾ"
            Cancel = True
            Exit Sub
        End If
        If (diffAmt > 0) Then
           MsgBox "���ս��С��Ӧ�ս��в��δ�գ���������ͨ����", vbInformation, "�����ʾ"
           Cancel = True
           Exit Sub
        End If
        
        
        If MsgBox("�Ƿ��������ͨ����", vbQuestion + vbYesNo, "�����ʾ") = vbNo Then
                Cancel = True
                Exit Sub
        End If
        m_BillInterface.SetFieldValue "FCombobox", "2"
    End If
    
    If BOSTool.ToolName = "mnuSpecialPass" Then '����ͨ��
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FCheckStatus<>'1' and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
            MsgBox "�ѽ�����ͨ�����������¼�飬��ִ�����¼�����", vbInformation, "�����ʾ"
            Cancel = True
            Exit Sub
        End If
        Dim specialChecker As KFO.Dictionary
        Set specialChecker = m_BillInterface.GetDataFldbyKey("FBase2") '������
        
        If specialChecker("FFLD") = "" Then
            MsgBox "����ͨ���������˲���Ϊ�գ�", vbInformation, "�����ʾ"
            Cancel = True
            Exit Sub
        End If
        
        If MsgBox("�Ƿ����������ͨ����", vbQuestion + vbYesNo, "�����ʾ") = vbNo Then
                Cancel = True
                Exit Sub
        End If
        m_BillInterface.SetFieldValue "FCombobox", "3"
        m_BillInterface.SaveBill
        m_BillInterface.BillCtl.BillStatus = Enu_BillStatusExt_View
        m_BillInterface.RefreshBill
        MsgBox "����������ͨ���ɹ�", vbInformation, "�����ʾ"
    
    End If
    
    If BOSTool.ToolName = "mnuUnPass" Then '��ͨ��
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FCheckStatus<>'1' and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
            MsgBox "�ѽ�����ͨ�����������¼�飬��ִ�����¼�����", vbInformation, "�����ʾ"
            Cancel = True
            Exit Sub
        End If
        
        If MsgBox("�Ƿ�����鲻ͨ����", vbQuestion + vbYesNo, "�����ʾ") = vbNo Then
                Cancel = True
                Exit Sub
        End If
        m_BillInterface.SetFieldValue "FCombobox", "4"
        m_BillInterface.SaveBill
        m_BillInterface.BillCtl.BillStatus = Enu_BillStatusExt_View
        m_BillInterface.RefreshBill
        MsgBox "�����鲻ͨ���ɹ�", vbInformation, "�����ʾ"
    End If
    
    If BOSTool.ToolName = "mnuReCheck" Then '���¼��
        sql = "select 1 from T_ATS_VehicleSaleOrderEntry where FCheckStatus='1' and FID=" & sourceID & " and FEntryID=" & sourceEntryID
        Set rs = m_BillInterface.K3Lib.GetData(sql)
        If (Not rs.EOF) Then
            MsgBox "δ�����飬�������¼��", vbInformation, "�����ʾ"
            Cancel = True
            Exit Sub
        End If
         If MsgBox("�Ƿ����½����飿", vbQuestion + vbYesNo, "�����ʾ") = vbNo Then
            Cancel = True
            Exit Sub
        End If
        
        '��������
        sql = "update T_ATS_VehicleSaleOrderEntry " & _
              "set FCheckStatus='1' " & _
              "where FID=" & sourceID & " and FEntryID=" & sourceEntryID
        '��������Ϣ
        m_BillInterface.K3Lib.UpdateData (sql)
        sql = "update t_ats_SettlementCheck " & _
              "set FStatus = '1'," & _
              "FChecker=0,FDate=null,FSpecialChecker=0,FNOTE='' " & _
              "where FID=" & checkBillID
         m_BillInterface.K3Lib.UpdateData (sql)
         m_BillInterface.BillCtl.BillStatus = Enu_BillStatusExt_Modify
         m_BillInterface.RefreshBill
         MsgBox "���½�����ɹ�", vbInformation, "�����ʾ"
         
        
    End If
    
    
    
End Sub
