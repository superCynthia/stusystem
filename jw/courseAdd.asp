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
			cname=trim(request.form("InputCourName"))
			ctype=trim(request.form("SelectCourCatelog"))
			cdepart=trim(request.form("SelectCourDepart"))
			ctime=trim(request.form("InputCourTime"))
			ccredit=trim(request.form("InputCourCredit"))
			cgrade=trim(request.form("SelectCourGrade"))
		%>
		<%
			if cname="" or ctype="" then
				response.Write"<script language=javascript>alert('信息输入不完整，请返回输入完整信息');location.href='course.asp';</script>"
			else
		%>
		<%
				set rs_departID=conn.execute("select * from department where name='"&cdepart&"'")
				set rec=conn.execute("select * from course where name='"& cname &"' and catogery='"& ctype &"'")
				if not rec.eof then
					response.Write"<script language=javascript>alert('该课程已经存在，请核对后添加');location.href='course.asp';</script>"
				else
					sql="insert into course values('" & cname & "','" & ctype &  "','" & rs_departID(0)&"','" & cdepart &"','" & ctime &"','"& ccredit & "','"& cgrade &"','1')"
					conn.execute sql 				
					response.Write"<script language=javascript>alert('课程添加成功');location.href='course.asp';</script>"	
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
