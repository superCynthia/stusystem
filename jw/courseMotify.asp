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
			cno=trim(request.form("InputCourNo"))
			cname=trim(request.form("InputCourName2"))
			ctype=trim(request.form("SelectCourCatelog2"))
			cdepart=trim(request.form("SelectCourDepart2"))
			ctime=trim(request.form("InputCourTime2"))
			ccredit=trim(request.form("InputCourCredit2"))
			cgrade=trim(request.form("SelectCourGrade2"))
		%>
		<%
			if cno="" then
				response.Write"<script language=javascript>alert('请输入课程号再进行修改');location.href='course.asp';</script>"
			else
				dim rs_course
				set rs_course=conn.execute("select * from course where cno='"& cno &"'")
				if not rs_course.eof then
					if cname<>"" then
						sql="update course set name='"& cname &"' where cno='"& cno &"'"
						conn.execute sql 
					end if
					if ctype<>"" then
						sql2="update course set catogery='"& ctype &"' where cno='"& cno &"'"
						conn.execute sql2 
					end if
					if cdepart<>"" then
						sql3="update course set departmentName='"& cdepart &"' where cno='"& cno &"'"
						conn.execute sql3 
					end if
					if ctime<>"" then
						sql4="update course set period='"& ctime &"' where cno='"& cno &"'"
						conn.execute sql4
					end if
					if ccredit<>"" then
						sql5="update course set credit='"& ccredit &"' where cno='"& cno &"'"
						conn.execute sql5
					end if
					if cgrade<>"" then
						sql6="update course set grade='"& cgrade &"' where cno='"& cno &"'"
						conn.execute sql6
					end if
					response.Write"<script language=javascript>alert('课程信息修改成功');location.href='course.asp'</script>"
				else 
					response.Write"<script language=javascript>alert('该课程不存在，请核对后再输入');location.href='course.asp';</script>"
				end if
			end if
		%>
        
        
</body>
</html>
