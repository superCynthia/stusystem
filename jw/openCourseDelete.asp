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
			cno_delete=trim(request.Form("InputOpenCno_delete"))	
			csn_delete=trim(request.Form("InputOpenCsn_delete"))	
		%>
        <%
			if cno_delete="" or csn_delete="" then
				response.Write"<script language=javascript>alert('请输入要删除的课程号和课序号');location.href='openCourse.asp';</script>"
			else
		%>
		<%		
				dim rs_opencourse
				set rs_opencourse=conn.execute("select * from openCourse where cno='"& cno_delete &"' and csn='"& csn_delete &"'")
				if not rs_opencourse.eof then
					dim rs_choosecourse
					set rs_choosecourse=conn.execute("select * from chooseCourse where cno='"& cno_delete &"' and csn='"& csn_delete &"'")
					if not rs_choosecourse.eof then
						response.Write"<script language=javascript>alert('该课程尚存在于选课表');location.href='openCourse.asp';</script>"
					else
						sql="delete from openCourse where cno='"& cno_delete &"' and csn='"& csn_delete &"'"
						conn.execute sql 
						set rec=conn.execute("select * from openCourse where cno='"& cno_delete &"' and csn='"& csn_delete &"'")
						if rec.eof then
							response.Write"<script language=javascript>alert('课程删除成功');location.href='openCourse.asp';</script>"
						else
							response.Write"<script language=javascript>alert('课程删除失败，请返回重新删除');location.href='openCourse.asp';</script>"
						end if
					end if
				else 
					response.Write"<script language=javascript>alert('该课程不存在于开课数据，请核对后再输入');location.href='openCourse.asp';</script>"
				end if
			end if
		%>
        <%
		conn.Close
		Set conn=nothing
		%>
</body>
</html>
