VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form F7QueryUI 
   Caption         =   "F7查询"
   ClientHeight    =   4425
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6225
   HasDC           =   0   'False
   KeyPreview      =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   4425
   ScaleWidth      =   6225
   StartUpPosition =   1  '所有者中心
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid gridMain 
      Height          =   3135
      Left            =   120
      TabIndex        =   5
      Top             =   720
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   5530
      _Version        =   393216
      SelectionMode   =   1
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin VB.ComboBox cmbSearchField 
      Height          =   300
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   855
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "取消"
      Height          =   375
      Left            =   4680
      TabIndex        =   3
      Top             =   3960
      Width           =   1215
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "确定"
      Height          =   375
      Left            =   3360
      TabIndex        =   2
      Top             =   3960
      Width           =   1215
   End
   Begin VB.CommandButton btnQuery 
      Caption         =   "查询"
      Height          =   375
      Left            =   4200
      TabIndex        =   1
      Top             =   120
      Width           =   1095
   End
   Begin VB.TextBox txtSearchValue 
      Height          =   375
      Left            =   1080
      TabIndex        =   0
      Text            =   "Text1adf"
      Top             =   120
      Width           =   2415
   End
End
Attribute VB_Name = "F7QueryUI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Private WithEvents m_BillInterface  As BillEvent
Attribute m_BillInterface.VB_VarHelpID = -1

Private m_searchField As KFO.Dictionary
Private m_returnField As KFO.Dictionary
Private m_sql As String


Private Sub btnCancel_Click()
    Unload Me
End Sub

Private Sub btnOK_Click()
    
    F7UIModule.isCancel = False
    Dim i As Integer
    Dim j As Integer
    Dim currentRow As Integer
    Dim titleName As String '表格标题名
    Dim titleIndex As String '表格标题标识
    currentRow = gridMain.Row
    If currentRow = 0 Then
        MsgBox "请选择数据行!"
        Exit Sub
    End If
    
    For i = 1 To m_returnField.Count
        For j = 0 To gridMain.Cols - 1
            gridMain.Row = 0
            gridMain.Col = j
            titleIndex = m_returnField.Name(i)
            titleName = m_returnField.GetValue(titleIndex)
            If gridMain.Text = titleName Then
               gridMain.Row = currentRow
               F7UIModule.returnValue(titleIndex) = gridMain.Text
               Exit For
            End If
        Next j
    Next i
    Unload Me
End Sub

Private Sub btnQuery_Click()
   Dim i As Integer
   Dim newSql As String
   newSql = m_sql
   Dim filterSql  As String
   Dim searchIndex As Integer
   searchIndex = cmbSearchField.ListIndex + 1
   
   filterSql = m_searchField.Name(searchIndex) & " like '%" & txtSearchValue.Text & "%'"
   
   newSql = Replace(newSql, "1=1", filterSql)
   
   Set gridMain.Recordset = m_BillInterface.K3Lib.GetData(newSql)
   
   gridMain.TextMatrix(0, 0) = "序号"
   For i = 1 To gridMain.Rows - 1
     gridMain.TextMatrix(i, 0) = i
   Next i
   For i = 0 To gridMain.Cols - 1
    gridMain.Row = 0
    gridMain.Col = i
    If InStr(gridMain.Text, "ID") > 0 Then
        gridMain.ColWidth(i) = 0
        Exit For
    
    End If

   Next i
    
    
End Sub

Private Sub Form_Load()
    SetWindowPos F7QueryUI.hwnd, -1, 0, 0, 0, 0, 3
End Sub


Public Function ShowForm(ByVal owner, billInterface As BillEvent, sql As String, searchField As KFO.Dictionary, returnField As KFO.Dictionary, defaultSearchField As String, defaultVaule As String) As String
    Dim i As Integer
    Set m_searchField = searchField
    Set m_returnField = returnField
    Dim defaultSearchIndex As Integer
    
    F7UIModule.isCancel = True
    F7UIModule.returnValue.RemoveAll
    m_sql = sql
    
    Set m_BillInterface = billInterface
    cmbSearchField.Clear
    For i = 1 To searchField.Count
        cmbSearchField.AddItem searchField.value(searchField.Name(i))
        If (searchField.Name(i) = defaultSearchField) Then
            defaultSearchIndex = i - 1
        End If
    Next i

    cmbSearchField.ListIndex = defaultSearchIndex
    txtSearchValue.Text = defaultVaule
    btnQuery_Click
    Me.Show vbModal
    ShowForm = txtSearchValue.Text
    Unload Me

End Function


Private Sub gridMain_DblClick()
    btnOK_Click
End Sub
