<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!--#include file="conn.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
		<%
			xname=trim(request.form("xname"))
			xmgr=trim(request.form("xmgr"))
		%>
		<%
			if xname="" or xmgr="" then
				response.Write"<script language=javascript>alert('信息输入不完整，请返回输入完整信息');location.href='xs.asp';</script>"
			else
		%>
		<%
				sql="insert into department(name,managerName) values('" & xname & "','" & xmgr & "')"
				conn.execute sql 
				set rec=conn.execute("select * from department where name='"& xname &"'")
				if not rec.eof then
					response.Write"<script language=javascript>alert('添加成功');location.href='xs.asp';</script>"
				else
					response.Write"<script language=javascript>alert('添加失败，请返回重新添加');location.href='xs.asp';</script>"
				end if

			end if
		%>
        <%
		conn.Close
		Set conn=nothing
		%>
</body>
</html>
