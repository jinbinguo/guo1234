VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Vehicle_BillEvent"
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
'
' If m_BillInterface.BillStatus = Enu_BillStatusExt_View Then
'     Exit Sub
'   End If
'
'   Dim dct As KFO.Dictionary
'   Dim f7ui As F7QueryUI
'   Set f7ui = New F7QueryUI
'   Dim sql As String
'   Dim searchField As New KFO.Dictionary
'   Dim returnFormat As New KFO.Dictionary
'   Dim rs As New ADODB.Recordset
'   Dim i As Integer
'   Dim oldValue As String
'
'   m_BillInterface.GetActiveField dct, 0, 0
'   If dct("FKey") = "FText" Then
'
'        oldValue = m_BillInterface.GetFieldValue("FText")
'         If Shift = 2 And KeyCode = vbKeyV Then
'            MsgBox "F7�ؼ�����ʹ��ճ�����밴F7��ѯ"
'            m_BillInterface.SetFieldValue "FText5", oldValue
'            Exit Sub
'        End If
'        If KeyCode = vbKeyControl Or Shift > 0 Then
'            Exit Sub
'        End If
'
'        sql = "select FID ����ID,FNumber ���ʹ���,FName ��������,FDesc ����˵�� from T_ATS_Model where 1=1"
'
'        searchField("FNumber") = "����"
'        searchField("FName") = "����"
'        searchField("FDesc") = "˵��"
'
'        returnFormat("FInteger") = "����ID"
'        returnFormat("FText") = "��������"
'
'        Dim vecReturn As New KFO.Vector
'        With vecReturn
'            .Add "FBase"
'            .Add "FText2"
'            .Add "FBase1"
'            .Add "Fbase2"
'            .Add "Fbase3"
'            .Add "Fbase4"
'            .Add "Fbase5"
'            .Add "Fbase6"
'        End With
'
'
'        If KeyCode = vbKeyF7 Then
'          f7ui.ShowForm Me, m_BillInterface, sql, searchField, returnFormat, "FName", m_BillInterface.GetActiveCtl.Text
'
'          If Not F7UIModule.isCancel Then
'           '������ֵ����¼�и�ֵ
'            For i = 1 To returnFormat.Count
'                m_BillInterface.SetFieldValue F7UIModule.returnValue.Name(i), F7UIModule.returnValue.Value(F7UIModule.returnValue.Name(i)), lRow
'            Next i
'
'            sql = "select b.FNumber Ʒ��, a.FCfgDesc ����˵��,c.FNumber ������Դ,d.FNumber ����,e.FNumber ������," & _
'                    "f.Fnumber �Ͱ�,g.FNumber ������ʽ,h.FNumber ������ʽ " & _
'                    "from T_ATS_Model a " & _
'                    "left join T_ATS_Brand b on b.FID=a.fbrandid " & _
'                    "left join T_ATS_CarSource c on c.FID=a.FCarSourceID " & _
'                    "left join T_ATS_Displacement d on d.FID=a.FDisplacementID " & _
'                    "left join T_ATS_Gearbox e on e.FID=a.FGearboxID " & _
'                    "left join t_ats_Stereotype f on f.fid=a.FStereotypeID " & _
'                    "left join T_ATS_PowerForm g on g.FID=a.FPowerFormID " & _
'                    "left join T_ATS_DriverForm h on h.FID=a.FDriverFormID " & _
'                    "where a.FID = " & CStr(F7UIModule.returnValue.GetValue("FInteger"))
'            Set rs = m_BillInterface.K3Lib.GetData(sql)
'
'            If rs.RecordCount > 0 Then
'                For i = 1 To vecReturn.Size
'                    If Not IsNull(rs(i - 1)) Then
'                        m_BillInterface.SetFieldValue vecReturn.Item(i), rs(i - 1)
'                    End If
'
'                Next i
'
'            End If
'
'
'          End If
'          m_BillInterface.SetActiveCell "FText"
'
'        ElseIf KeyCode = vbKeyDelete Or KeyCode = vbKeyBack Then
'
'            '���F7����ֵ
'            For i = 1 To returnFormat.Count
'                m_BillInterface.SetFieldValue returnFormat.Name(i), ""
'            Next i
'            For i = 1 To vecReturn.Size
'                m_BillInterface.SetFieldValue vecReturn.Item(i), ""
'            Next i
'        Else
'            MsgBox "F7�ؼ�����ʹ���ֹ��޸ģ��밴F7��ѯ"
'            m_BillInterface.SetFieldValue "FText", oldValue
'        End If
'
'   End If
End Sub