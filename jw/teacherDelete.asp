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
			tno_delete=trim(request.Form("InputWno_delete"))	
		%>
        <%
			if tno_delete="" then
				response.Write"<script language=javascript>alert('请输入要删除的教工号');location.href='teacher.asp';</script>"
			else
		%>
		<%
				dim rs_tea
				set rs_tea=conn.execute("select * from teacher where wno='"& tno_delete &"'")
				if not rs_tea.eof then
					sql="delete from teacher where wno='"& tno_delete &"'"
					conn.execute sql 
					set rec=conn.execute("select * from teacher where wno='"& tno_delete &"'")
					if rec.eof then
						response.Write"<script language=javascript>alert('教师删除成功');location.href='teacher.asp';</script>"
					else
						response.Write"<script language=javascript>alert('教师删除失败，请返回重新删除');location.href='teacher.asp';</script>"
					end if
				else 
					response.Write"<script language=javascript>alert('该教工号不存在，请核对后再输入');location.href='teacher.asp';</script>"
				end if
			end if
		%>
        <%
		conn.Close
		Set conn=nothing
		%>
</body>
</html>
