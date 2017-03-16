<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生选课和成绩管理系统</title>
<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="../css/login.css" type="text/css">
</head>

<% 
dim row,arr,rownum
row=Request.QueryString
arr=Split(row,"=")
user=arr(1)

set rec=conn.execute("select email from student where sno="&user)
if rec.eof then
	response.Write"<script language=javascript>location.href='login.asp';alert('无此用户！！');</script>"
else
randomize
ranNum=int((9999-1000)*rnd+1000)
session.Contents("gpwd_checkwd")=ranNum
session.Contents("gpwd_userid")=user
Set jmail = Server.CreateObject("JMAIL.Message")  '建立发送邮件的对象   
jmail.silent = true  '屏蔽例外错误，返回FALSE跟TRUE两值j   
jmail.logging = true  '启用邮件日志   
jmail.Charset = "gb2312"  '邮件的文字编码为国标 
jmail.ContentType = "text/html"  '邮件的格式为HTML格式   
jmail.AddRecipient rec(0)  '邮件收件人的地址   
jmail.From = "17862707352@163.com" '发件人的E-MAIL地址   
jmail.MailServerUserName = "17862707352@163.com" '登录邮件服务器所需的用户名   
jmail.MailServerPassword = "haorong3250" '登录邮件服务器所需的密码   
jmail.Subject = "Get_My_Password_For_stuSystem" '邮件的标题   
jmail.Body = "您好"&user&"：这是一封来自综合教务系统的密码找回邮件，如您本人未申请请自动忽略。这是您的验证码："&ranNum&"。" '邮件的内容   
jmail.Send("smtp.163.com") '执行邮件发送（通过邮件服务器地址）   
jmail.Close() '关闭对象
%>

<body background="../images/bg_main.jpg">
	<div id="mid">
		<form method="post" action="solve_getpwd.asp">
			<div>
        		<h3 align="center" style="color:#006">找回密码</h3>
        		<hr width="100%" noshade="noshade">
     		</div>
     		<div id="mid2">
         		<div class="form-group" id="mid_user">
            		<label for="formGroupExampleInput">设置新密码</label>
            		<input type="password" class="form-control" id="newpwd" name="newpwd">
         		</div>
         		<div class="form-group" id="mid_pwd">
            		<label for="formGroupExampleInput2">确认密码</label>
            		<input type="password" class="form-control" id="renewpwd" name="renewpwd">
         		</div>
                <div class="form-group" id="mid_user">
            		<label for="formGroupExampleInput">验证码</label>
            		<input type="text" class="form-control" id="checkwd" name="checkwd">
         		</div>
         		<br />
        		<button type="submit" class="btn btn-primary" id="btn_login">确认</button>
        		<a href="login.asp" id="btn_forgetPwd">返回</a>
     		</div>
		</form>
	</div>
    
  </div>
</div>
</body>

<%
end if
%>

</html>