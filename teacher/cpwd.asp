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
	oldpwd=request.form("opwd")
	newpwd=request.form("npwd")
	
	if newpwd="" or oldpwd="" then
		Server.Execute("courseInfo.asp")
		response.write("<div class=""alert alert-info navbar-fixed-top"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button>密码不能为空！修改失败！</div>")
	else
		sql="select pwd from teacher where name='"&username&"' and pwd='"&oldpwd&"'"
		set rs=Server.CreateObject("ADODB.RecordSet")
		rs.open sql,conn,1,3
		if rs.eof then
			Server.Execute("courseInfo.asp")
			response.write("<div class=""alert alert-info navbar-fixed-top"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button>原密码错误！修改失败！</div>")
		else
			sql="update teacher set pwd='"&newpwd&"' where name='"&username&"'"
			conn.execute(sql)
			response.Redirect("courseInfo.asp")
		end if
	end if
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>
</body>
</html>
