Attribute VB_Name = "DBUtils"
Public Conn As String

Private connet_num As Integer
Private cnn As ADODB.Connection
Private rs As ADODB.Recordset
Dim i As Long
'�������ݿ�
Public Sub connect()
On Error GoTo herror
    Set cnn = New ADODB.Connection
     cnn.ConnectionString = Conn


   If cnn.State = adStateOpen Then
     Exit Sub
   End If

    cnn.Open
   If cnn.State <> adStateOpen Then
    GoTo herror
   End If

   Exit Sub
herror:
   MsgBox "����������ʧ�ܣ������������ӣ�" & Conn, , "�����ʾ"
   'end
End Sub
Public Sub disconnect()
   If cnn.State = adStateOpen Then
   cnn.Close
   End If
End Sub

'ִ��SQL���
Public Sub sqlExt(ByVal tmpsqlstmt As String)
    Dim cmd As New ADODB.Command
    connect
    Set cmd.ActiveConnection = cnn
    cmd.CommandText = tmpsqlstmt
    cmd.CommandTimeout = 180
    cmd.Execute
    Set cmd = Nothing
    cnn.Close
End Sub

'��ȡ��¼��
Public Function queryExt(ByVal tmpsqlstmt As String) As ADODB.Recordset
On Error GoTo herror
    Dim rst As New ADODB.Recordset
    connect
    Set rst.ActiveConnection = cnn
    rst.CursorType = adOpenDynamic
    rst.LockType = adLockOptimistic
    rst.CursorLocation = adUseClient
    
    rst.Open tmpsqlstmt
'      rs.Open tmpsqlstmt, cnn, 1, 3, 1
    Set queryExt = rst
Exit Function
herror:
    MsgBox "����δ��ȷִ��,������ر��Ƿ���ȷ��װ", , "�����ʾ"
    'End
End Function
'K3���ݿ��������
Public Function DBquery(ByVal sql As String) As ADODB.Recordset
On Error GoTo herror
Dim rs As ADODB.Recordset
Dim OBJ As Object

    Set OBJ = CreateObject("K3Connection.AppConnection")
    Set rs = OBJ.ExecuteRaiseErr(sql)
    Set OBJ = Nothing
    Set DBquery = rs

'���ؼ�¼����ʽ
'Set rs = obj.Execute("select * from t_icitem")

Exit Function
herror:
    MsgBox "����δ��ȷִ��,������ر��Ƿ���ȷ��װ", , "�����ʾDBquery"

End Function
