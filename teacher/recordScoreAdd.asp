<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
	username = Session("username")
	if username="" then 
		response.Redirect("../login/login.asp")
	end if
%>
<!--#include file="conn.asp"-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<%
	dim sno
	dim ord
	dim testscore
	dim all
	dim i
	i=i+1
%>
<%          
	recordScoreCourName=session("recordScoreCourName")
	'所有需要添加成绩的结果集
	set rs=conn.execute("exec WatchStudent '"&username&"','"&recordScoreCourName&"'")
    do while not rs.eof
		sno=rs(0)
		ord=trim(request.form("ord"&i))
		testscore=trim(request.form("test"&i))
		all=trim(request.form("all"&i))
		if ord<>"" and testscore<>"" and all<>"" then
			sql="update chooseCourse set ordinaryScore="&ord&",testScore="&testscore&",allScore="&all&" where sno='"&sno&"' and courName='"&recordScoreCourName&"'"
			conn.execute sql
		else 
			response.Write"<script language=javascript>alert('请录入全部成绩项');location.href='recordScore.asp';</script>"
		end if
%>
		<h4><%=sno%>,<%=ord%>,<%=testscore%>,<%=all%></h4>
<%
    rs.movenext
	i=i+1
    loop
	session.Contents("recordScoreCourName")=""
	response.Write"<script language=javascript>alert('成绩录入成功');location.href='recordScore.asp';</script>"
%>     
</body>
</html>
