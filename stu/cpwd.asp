<!--#include file="conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
username = Session("username")
if username="" then 
	response.Redirect("../login/login.asp")
end if
%>
<%
oldpwd=request.form("opwd")
newpwd=request.form("npwd")

if newpwd="" or oldpwd="" then
	Server.Execute("cj.asp")
	response.write("<div class=""alert alert-danger navbar-fixed-top"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button>密码不能为空！修改失败！</div>")
else
    sql="select pwd from student where name='"&username&"' and pwd='"&oldpwd&"'"
	set rs=Server.CreateObject("ADODB.RecordSet")
	rs.open sql,conn,1,3
	if rs.eof then
		Server.Execute("cj.asp")
		response.write("<div class=""alert alert-danger navbar-fixed-top"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button>原密码错误！修改失败！</div>")
	else
		sql="update student set pwd='"&newpwd&"' where name='"&username&"'"
		conn.execute(sql)
		response.Redirect("cj.asp")
	end if
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>