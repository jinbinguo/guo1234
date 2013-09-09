VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 1  'vbSimpleBound
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Model_BillEvent"
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
 
End Sub

Private Sub Class_Terminate()
 
    '�ͷŽӿڶ���
    'ע��: �˷����������, �����޸�
    Set m_BillInterface = Nothing

End Sub




Private Sub m_BillInterface_BillHeadKeyDown(ByVal Index As Integer, ByVal KeyCode As Integer, ByVal Shift As Integer, ByVal sKey As String, bCancel As Boolean)
           
'   If m_BillInterface.BillStatus = Enu_BillStatusExt_View Then
'     Exit Sub
'   End If
'
'   Dim dct As KFO.Dictionary
'   Dim f7ui As F7QueryUI
'   Set f7ui = New F7QueryUI
'   Dim sql As String
'   Dim searchField As New KFO.Dictionary
'   Dim returnFormat As New KFO.Dictionary
'
'   m_BillInterface.GetActiveField dct, 0, 0
'   If dct("FKey") = "FText5" Then
'        Dim oldValue As String
'        oldValue = m_BillInterface.GetFieldValue("FText5")
'        If Shift = 2 And KeyCode = vbKeyV Then
'            MsgBox "F7�ؼ�����ʹ��ճ�����밴F7��ѯ"
'            m_BillInterface.SetFieldValue "FText5", oldValue
'            Exit Sub
'        End If
'        If KeyCode = vbKeyControl Or Shift > 0 Then
'            Exit Sub
'        End If
'
'        sql = "select a.FID ����ID,a.fnumber ����,a.FName ��ϵ����,b.FName Ʒ��,b.FNumber Ʒ�ƴ��� from T_ATS_Series a " & _
'                   "left join t_ats_brand b on b.fid=a.FBrandID where 1=1"
'
'        searchField("a.fnumber") = "����"
'        searchField("a.fname") = "����"
'        searchField("b.fname") = "Ʒ��"
'
'
'        returnFormat("FInteger") = "����ID"
'        returnFormat("FText5") = "��ϵ����"
'        returnFormat("FBase8") = "Ʒ�ƴ���"
'        If KeyCode = vbKeyF7 Then
'
'
'          f7ui.ShowForm Me, m_BillInterface, sql, searchField, returnFormat, "a.fname", m_BillInterface.GetActiveCtl.Text
'
'          If Not F7UIModule.isCancel Then
'            '������ֵ����¼�и�ֵ
'               For i = 1 To returnFormat.Count
'                  m_BillInterface.SetFieldValue returnFormat.Name(i), F7UIModule.returnValue.Value(returnFormat.Name(i))
'               Next i
'          End If
'        m_BillInterface.SetActiveCell "FText5"
'
'        ElseIf KeyCode = vbKeyDelete Or KeyCode = vbKeyBack Then
'            For i = 1 To returnFormat.Count
'                m_BillInterface.SetFieldValue returnFormat.Name(i), ""
'            Next i
'            With m_BillInterface
'                .SetFieldValue "FBase", ""
'                .SetFieldValue "FBase1", ""
'                .SetFieldValue "FBase2", ""
'                .SetFieldValue "FBase3", ""
'                .SetFieldValue "FBase4", ""
'                .SetFieldValue "FText8", ""
'
'            End With
'        Else
'            MsgBox "F7�ؼ�����ʹ���ֹ��޸ģ��밴F7��ѯ"
'            m_BillInterface.SetFieldValue "FText5", oldValue
'        End If
'
'
'   End If
    
End Sub


Private Sub m_BillInterface_Change(ByVal dct As KFO.IDictionary, ByVal dctFld As KFO.IDictionary, ByVal Col As Long, ByVal row As Long, Cancel As Boolean)
     'MsgBox "bbb", vbOKOnly, "�����ʾ"
     If (dct("FKey") = "FBase10") Then
        If dctFld("FFLD") = "" Then
           With m_BillInterface
              .SetFieldValue "FBaseProperty", ""
              .SetFieldValue "FBase", ""
              .SetFieldValue "FBase1", ""
              .SetFieldValue "FBase2", ""
              .SetFieldValue "FBase3", ""
              .SetFieldValue "FBase4", ""
              .SetFieldValue "FBase5", ""
              .SetFieldValue "FBase6", ""
              .SetFieldValue "FBase7", ""
           
           End With
        
        End If
        
     End If
     

End Sub

Private Sub m_BillInterface_MenuBarClick(ByVal BOSTool As K3ClassEvents.BOSTool, Cancel As Boolean)
    Dim dctStatus As KFO.Dictionary
    Dim dctICItem As KFO.Dictionary
    Dim dctICItemClass As KFO.Dictionary
    
    If (BOSTool.ToolName = "mnuCancel") Then '����
        
        Set dctStatus = m_BillInterface.GetDataFldbyKey("FCombobox")
        
        If (dctStatus("FFLD") = "3") Then
            MsgBox "�ѽ���״̬�������ٽ��ã�", vbError + vbOKOnly, "�����ʾ"
            Cancel = True
            Exit Sub
        End If
        m_BillInterface.SetFieldValue "FCombobox", 3 '����״̬
        m_BillInterface.SaveBill
        MsgBox "���óɹ���", vbOKOnly + vbInformation, "�����ʾ"
        
    End If
    If (BOSTool.ToolName = "mnuCancelCancel") Then '����ʱ����δ�����ϣ����Զ�����һ����
    
        
        Set dctICItem = m_BillInterface.GetDataFldbyKey("FBase5") '��Ӧ����
        
        Set dctICItemClass = m_BillInterface.GetDataFldbyKey("FBase9") '���Ϸ���
        If (dctICItemClass("FFLD") = "") Then
            MsgBox "���Ϸ��಻��Ϊ��", vbError + vbOKOnly, "�����ʾ"
            Cancel = True
            Exit Sub
        End If

        Set dctStatus = m_BillInterface.GetDataFldbyKey("FCombobox")
        
        If (dctStatus("FFLD") = "2") Then
            MsgBox "������״̬�����������ã�", vbError + vbOKOnly, "�����ʾ"
            Cancel = True
            Exit Sub
        End If
        If (dctICItem("FFLD") = "") Then
            If MsgBox("���ú󣬽��Զ����ɶ�Ӧ���ϣ��Ƿ������", vbQuestion + vbYesNo, "�����ʾ") = vbYes Then
                Dim procName As String
                Dim procSQL As String
                Dim modelId As Integer
                Dim rs As ADODB.Recordset
                Dim icitemNum As String
                Dim unitNum As String
                Dim userID As Integer
                procName = "proc_createICItemForAuto"
                userID = m_BillInterface.K3Lib.User.userID
                procSQL = "exec " & procName & " " & CStr(m_BillInterface.Data("FID")) & ", " & CStr(userID)
                Set rs = m_BillInterface.K3Lib.GetData(procSQL)
                If Not rs.EOF Then
                    icitemNum = rs(0)
                    unitNum = rs(1)
                End If
                m_BillInterface.SetFieldValue "FBase5", icitemNum '����
                m_BillInterface.SetFieldValue "FBase6", unitNum '������λ
            Else
                Cancel = True
                Exit Sub
            End If
        End If
        m_BillInterface.SetFieldValue "FCombobox", 2 '����״̬
        m_BillInterface.SaveBill
        MsgBox "���óɹ���", vbOKOnly + vbInformation, "�����ʾ"
    
    End If
    
End Sub