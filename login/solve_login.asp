<!--#include file="conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
tyzm=session("pSN")
user=request.form("input_user")
pwd=request.form("input_pwd")
cndt=request.form("disabledSelect")
yzm=request.form("yzm")

if user="" or pwd="" or yzm="" then
response.write"<p align=""center"">出错提示：用户名、密码、验证码不能为空！</p>"
response.write"<p align=""center""><a href=""login.asp"">点击这里重新登录！</a></p>"
end if

if yzm<>tyzm then
	response.write"<p align=""center"">出错提示验证码不正确！</p>"
	response.write"<p align=""center""><a href=""login.asp"">点击这里重新登录！</a></p>"
else

select case cndt
    case "系统管理员"
	    t="systemManager"
            sql="select name,pwd from "&t&" where wno='"&user&"' and pwd='"&pwd&"'"
	case "教务管理员"
	    t="eduManager"
		sql="select name,pwd from "&t&" where wno='"&user&"' and pwd='"&pwd&"'"
	case "教师"
		t="teacher"
		sql="select name,pwd from "&t&" where wno='"&user&"' and pwd='"&pwd&"'"
	case "学生"
		t="student"
		sql="select name,pwd from "&t&" where sno='"&user&"' and pwd='"&pwd&"'"
end select
set rs=Server.CreateObject("ADODB.RecordSet")
rs.open sql,conn,1,3
if rs.eof then
response.write"<p align=""center"">出错提示：用户名不存在或者用户名、密码不正确！</p>"
response.write"<p align8=""center""><a href=""login.asp"">点击这里重新登录！</a></p>"
else
Session.Contents("no") = user
Session.Contents("username") = rs(0)
select case t
	case "systemManager"
		response.Redirect("../xt/jwy.asp")
	case "eduManager"
		response.Redirect("../jw/teacher.asp")
	case "teacher"
	    response.Redirect("../teacher/courseInfo.asp")
	case "student"
		response.Redirect("../stu/cj.asp")
end select
end if
rs.close
set rs=nothing

end if
%>