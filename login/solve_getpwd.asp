<!--#include file="conn.asp"-->
<%
	pwd1=request.Form("newpwd")
	pwd2=request.Form("renewpwd")
	ucheckwd=request.Form("checkwd")
	checkwd=session("gpwd_checkwd")
	userid=session("gpwd_userid")
	int_ucheckwd=cint(ucheckwd)
	
	if pwd1="" or pwd2="" then
		Server.Execute("login.asp")
		response.Write "<script language=javascript>alert('密码为空，操作失败！');</script>"
	else if pwd1<>pwd2 then
		Server.Execute("login.asp")
		response.Write "<script language=javascript>alert('两次输入密码不同，操作失败！');</script>"
	else if ucheckwd="" or int_ucheckwd<>checkwd then
		Server.Execute("login.asp")
		response.Write "<script language=javascript>alert('验证码错误，操作失败！');</script>"
	else
		set rec=conn.execute("update student set pwd='"&pwd1&"' where sno='"&userid&"'")
		Server.Execute("login.asp")
		response.Write "<script language=javascript>alert('操作成功，请用新密码登录！');</script>"
	end if
	end if
	end if
%>