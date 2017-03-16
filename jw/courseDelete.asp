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
			cno_delete=trim(request.Form("InputCno2"))	
		%>
        <%
			if cno_delete="" then
				response.Write"<script language=javascript>alert('请输入要删除的课程号');location.href='course.asp';</script>"
			else
		%>
		<%		
				dim rs_course
				set rs_course=conn.execute("select * from course where cno='"& cno_delete &"'")
				if not rs_course.eof then
					set rs_open=conn.execute("select * from openCourse where cno='"& cno_delete &"'")
					if not rs_open.eof then
						response.Write"<script language=javascript>alert('请先将该课程在开课数据中删除');location.href='course.asp';</script>"
					else
						sql="delete from course where cno='"& cno_delete &"'"
						conn.execute sql 
						set rec=conn.execute("select * from course where cno='"& cno_delete &"'")
						if rec.eof then
							response.Write"<script language=javascript>alert('课程删除成功');location.href='course.asp';</script>"
						else
							response.Write"<script language=javascript>alert('课程删除失败，请返回重新删除');location.href='course.asp';</script>"
						end if
					end if
				else 
					response.Write"<script language=javascript>alert('该课程不存在，请核对后再输入');location.href='course.asp';</script>"
				end if
			end if
		%>
        <%
		conn.Close
		Set conn=nothing
		%>
</body>
</html>
