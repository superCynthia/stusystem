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
			sname=trim(request.form("InputName"))
			ssex=trim(request.form("RadioSex"))
			smajor=trim(request.form("SelectMajor"))
			sclass=trim(request.form("SelectClass"))
			senrolldate=trim(request.form("InputDate"))
			sbirth=trim(request.form("InputBirth"))
			saddr=trim(request.form("InputAddr"))
			spwd=trim(request.form("InputPassword"))
		%>
		<%
			if sname="" or smajor="" or sclass="" then
				response.Write"<script language=javascript>alert('信息输入不完整，请返回输入完整信息');location.href='student.asp';</script>"
			else
		%>
		<%
				set rs_majorID=conn.execute("select * from major where name='"&smajor&"'")
				sql="insert into student values('" & sname & "','" & ssex &  "','" & rs_majorID(0) &  "','" & smajor &"','" & sclass &"','"& senrolldate& "','"& sbirth &"','"& saddr &"','"& spwd &"','952289985@qq.com')"
				conn.execute sql 
				set rec=conn.execute("select * from student where name='"&sname&"' and majorName='"&smajor&"' and class='"&sclass&"'" )
				if not rec.eof then
					response.Write"<script language=javascript>alert('学生添加成功');location.href='student.asp';</script>"
				else
					response.Write"<script language=javascript>alert('添加失败，请返回重新添加');location.href='student.asp';</script>"
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
