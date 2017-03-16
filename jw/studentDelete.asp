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
			sno_delete=trim(request.Form("InputSno5"))	
		%>
        <%
			if sno_delete="" then
				response.Write"<script language=javascript>alert('请输入要删除的学号');location.href='student.asp';</script>"
			else
		%>
		<%	
				dim rs_stu
				set rs_stu=conn.execute("select * from student where sno='"& sno_delete &"'")
				if not rs_stu.eof then
					sql="delete from student where sno='"& sno_delete &"'"
					conn.execute sql 
					set rec=conn.execute("select * from student where sno='"& sno_delete &"'")
					if rec.eof then
						response.Write"<script language=javascript>alert('学生删除成功');location.href='student.asp';</script>"
					else
						response.Write"<script language=javascript>alert('学生删除失败，请返回重新删除');location.href='student.asp';</script>"
					end if
				else 
					response.Write"<script language=javascript>alert('该学号不存在，请核对后再输入');location.href='student.asp';</script>"
				end if
			end if
		%>
        <%
		conn.Close
		Set conn=nothing
		%>
</body>
</html>
