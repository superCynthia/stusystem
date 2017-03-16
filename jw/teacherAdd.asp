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
			tname=trim(request.form("InputTeaName"))
			tdepart=trim(request.form("SelectTeaDepart"))
			tposition=trim(request.form("SelectTeaPosition"))
			ttele=trim(request.form("InputTeaTele"))
			taddr=trim(request.form("InputTeaAddr"))
			tpwd=trim(request.form("InputTeaPassword"))
		%>
		<%
			if tname="" then
				response.Write"<script language=javascript>alert('信息输入不完整，请返回输入完整信息');location.href='teacher.asp';</script>"
			else
		%>
		<%
				set rs_departID=conn.execute("select * from department where name='"&tdepart&"'")
				sql="insert into teacher values('" & tname & "','" & rs_departID(0) & "','" & tdepart & "','" & tposition &"','" & ttele &"','"& tpwd & "')"
				conn.execute sql 
				set rec=conn.execute("select * from teacher where name='"& tname &"'")
				if not rec.eof then
					response.Write"<script language=javascript>alert('教师添加成功');location.href='teacher.asp';</script>"
				else
					response.Write"<script language=javascript>alert('教师添加失败，请返回重新添加');location.href='teacher.asp';</script>"
				end if
			end if
		%>
        <%
		conn.Close
		Set conn=nothing
		Set rec=nothing
		%>
</body>
</html>
