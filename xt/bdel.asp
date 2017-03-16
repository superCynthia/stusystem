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
			del_no=trim(request.form("del_no"))
		%>
        <%
			if del_no="" then
				response.Write"<script language=javascript>alert('请输入要删除的编号');location.href='bj.asp';</script>"
			else
		%>
		<%
				sql="delete from [class] where ID='"& del_no &"'"
				conn.execute sql 
				set rec=conn.execute("select * from [class] where ID='"& del_no &"'")
				if rec.eof then
					response.Write"<script language=javascript>alert('删除成功');location.href='bj.asp';</script>"
				else
					response.Write"<script language=javascript>alert('删除失败，请返回重新删除');location.href='bj.asp';</script>"
				end if

			end if
		%>
        <%
		conn.Close
		Set conn=nothing
		%>
</body>
</html>
