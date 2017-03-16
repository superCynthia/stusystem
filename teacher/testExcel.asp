<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<%
'定义打开Excel表格的函数
Function OpenExcel(path)
  dim excel,rs,strsql
  On Error Resume Next
  Set rs = Server.CreateObject("ADODB.RecordSet")
  Set excel = Server.CreateObject("ADODB.Connection")
  excel.Open "Driver={Microsoft Excel Driver (*.xls)};DBQ=" & Server.MapPath("‪Book1.xls")
  If Err.number<> 0 Then
    Response.Write "请检查上传的Excel文件内部格式，文件无法打开，导入失败！"
    Response.End
  End If
  strsql = "SELECT * FROM [Sheet1$]" '在这里指定工作薄名称,默认是Sheet1$
  Set rs = excel.Execute(strsql)
  Set OpenExcel = rs
End Function

'读取文件中的内容
Dim rsInfo
Set rsInfo = Server.CreateObject("ADODB.RecordSet")
Set rsInfo = OpenExcel(Server.MapPath("‪Book1.xls")) '这里的文件路径请用Server.Path来获取

'检查读取结果
If rsInfo.State<> 1 Then
  Response.Write "请检查Excel文件中的工作表命名是否为Sheet1，导入失败！"
  Response.End
End If

If rsInfo.EOF And rsInfo.BOF Then
  Response.Write "没有找到Excel表中的数据，导入失败！"
  Response.End
End If

If IsNull(rsInfo.Fields(0)) or Trim(rsInfo.Fields(0))="" Then
  Response.Write "没有找到Excel表中的数据，导入失败！"
  Response.End
End If

'这里指定导入数据的列数,列数少了退出
If rsInfo.Fields.Count< 7 Then
  Response.Write "Excel表中的数据列数不正确，导入失败！"
  Response.End
End If

'创建数据库连接
dim dbrs,conn,sql
Set conn = Server.CreateObject("ADODB.Connection")
Set dbrs = Server.CreateObject("ADODB.Recordset")
'注: G_DB_ConnectString是连接数据库的字符串,自己定义
conn.ConnectionString ="provider=sqloledb;data source=localhost;uid=sa;pwd=l753159t;database=教务管理系统"
conn.Open '打开数据库连接

'创建临时表
sql = "IF EXISTS (SELECT * FROM sysobjects WHERE xtype='U' and name='tmp_PartRes') "
sql = sql & "BEGIN Drop table tmp_PartRes END "
sql = sql & "Create table tmp_PartRes([ID] int identity(1,1),"
sql = sql & "PartID varchar(100),Brand varchar(100),[Package] varchar(100),"
sql = sql & "BatchNo varchar(100),[Price] varchar(100),[Stock] varchar(100) default('0'),"
sql = sql & "Brief varchar(100),StockFlag int default(1),"
sql = sql & "SuperFlag int default(1),SaleFlag int default(1))"
conn.execute sql

'取表结构 注意: 只取表的结构, 不要数据, 因为我这个是刚创建的临时表, 没有数据,
'如果表中存在数据, 要注意加上条件句, 防止取到数据 如: where ID = -1
sql = "SELECT * FROM tmp_PartRes"
dbrs.CursorLocation = 3 '这一定要设置为3
dbrs.Open sql,conn, 3, 4 '这里的参数必须是3和4

'取到表结构后, 必须要把活动连接及数据库连接关闭,这个很重要, 否则导入速度特慢.
Set dbrs.ActiveConnection = Nothing
conn.close

'提取Excel中的数据, 将excel中的数据放入到数据库表中.
While Not rsInfo.EOF
  If Trim(rsInfo.Fields(0))<> "" Then
    dbrs.AddNew
    dbrs("PartID") = Ucase(Trim(rsInfo.Fields(0)))
    dbrs("Brand") = Trim(rsInfo.Fields(1))
    dbrs("Package") = Trim(rsInfo.Fields(2))
    dbrs("BatchNo") = Trim(rsInfo.Fields(3))
    dbrs("Price") = Trim(rsInfo.Fields(4))
    If Trim(rsInfo.Fields(5))<>"" Then
        dbrs("Stock") = Trim(rsInfo.Fields(5))
     Else
         dbrs("Stock") = "0"
     End If
    dbrs("Brief") = Trim(rsInfo.Fields(6))
  End If
  rsInfo.MoveNext
Wend

'更新记录集到数据库临时表
conn.Open '打开连接
dbrs.ActiveConnection = conn
dbrs.UpdateBatch '批量更新函数

'更新完成后, 关闭连接
dbrs.Close
Set dbrs = Nothing
rsInfo.Close
Set rsInfo = Nothing

%>
</body>
</html>
