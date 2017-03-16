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
			sno=trim(request.Form("InputSno2"))
			sname=trim(request.form("InputName2"))		
			smajor=trim(request.form("SelectMajor2"))
			sclass=trim(request.form("SelectClass2"))			
			saddr=trim(request.form("InputAddr2"))
		%>
		<%
			if sno="" then
				response.Write"<script language=javascript>alert('请输入学号再进行修改');location.href='student.asp';</script>"
			else
				dim rs_stu
				set rs_stu=conn.execute("select * from student where sno='"& sno &"'")
				if not rs_stu.eof then
					if sname<>"" then
						sql="update student set name='"& sname &"' where sno='"& sno &"'"
						conn.execute sql 
					end if
					if smajor<>"" then
						sql2="update student set majorName='"& smajor &"' where sno='"& sno &"'"
						conn.execute sql2 
					end if
					if sclass<>"" then
						sql3="update student set class='"& sclass &"' where sno='"& sno &"'"
						conn.execute sql3 
					end if
					if sddr<>"" then
						sql4="update student set addr='"& sddr &"' where sno='"& sno &"'"
						conn.execute sql4
					end if
					response.Write"<script language=javascript>alert('学生信息修改成功');location.href='student.asp'</script>"
				else 
					response.Write"<script language=javascript>alert('该学号不存在，请核对后再输入');location.href='student.asp';</script>"
				end if
			end if
		%>
        
        
</body>
</html>
