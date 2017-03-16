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
			ocno=trim(request.form("InputOpenCno"))
			ocsn=trim(request.form("InputOpenCsn"))
			ocname=trim(request.form("InputOpenCourName"))
			oteaname=trim(request.form("InputOpenCourTeaName"))
			oroom=trim(request.form("SelectOpenCourRoom"))
			oroomno=trim(request.form("SelectOpenCourRoomNo"))
			oweekday=trim(request.form("SelectOpenCourWeekday"))
			otime=trim(request.form("SelectOpenCourTime"))
			
			omajor=trim(request.form("SelectOpenCourMajor"))
			oclass=trim(request.form("SelectOpenCourClass"))
			omajor2=trim(request.form("SelectOpenCourMajor2"))
			oclass2=trim(request.form("SelectOpenCourClass2"))
			omajor3=trim(request.form("SelectOpenCourMajor3"))
			oclass3=trim(request.form("SelectOpenCourClass3"))
			
			onumber=trim(request.form("InputOpenCourseNumber"))
		%>
		<%
			dim allclass
			if omajor<>"" and oclass<>"" and omajor2<>"" and oclass2<>"" and omajor3<>"" and oclass3<>"" then
				allclass=omajor & oclass & ";" & omajor2 & oclass2 & ";" & omajor3 & oclass3
			else if omajor<>"" and oclass<>"" and omajor2<>"" and oclass2<>"" then
				allclass=omajor & oclass & ";" & omajor2 & oclass2
			else
				allclass=omajor & oclass
			end if
			end if
			
			if ocno="" or ocsn="" then
				response.Write"<script language=javascript>alert('信息输入不完整，请返回输入完整信息');location.href='openCourse.asp';</script>"
			else
		%>
		<% 
				set rec_course=conn.execute("select * from course where cno='"&ocno&"'")
				if rec_course.eof then
					 response.Write"<script language=javascript>alert('所开课程不存在于开课计划，请核对后添加');location.href='openCourse.asp';</script>"
				else
					set rec=conn.execute("select * from openCourse where cno='"& ocno &"' and csn='"& ocsn &"'")
					if not rec.eof then
						response.Write"<script language=javascript>alert('所开课程已经存在，请核对后添加');location.href='openCourse.asp';</script>"
					else
						set classConflict=conn.execute("select distinct * from openCourse,course where openCourse.cno=course.cno and openCourse.cno='"&ocno&"' and (majorClass like '"&omajor & oclass&"' or majorClass like '"&omajor2 & oclass2&"' or majorClass like '"&omajor3 & oclass3&"')")
						if not classConflict.eof then
							response.Write"<script language=javascript>alert('开课班已开设相同课程，请核对后添加');location.href='openCourse.asp';</script>"
						else
							set timeConflict=conn.execute("select distinct * from openCourse,course where openCourse.cno=course.cno and schooltime='"&oweekday & otime&"' and (majorClass like '"&omajor & oclass&"' or majorClass like '"&omajor2 & oclass2&"' or majorClass like '"&omajor3 & oclass3&"') and (catogery='必修课' or catogery='专业限选课')")
							if not timeConflict.eof then
							response.Write"<script language=javascript>alert('所开课程与开课班级其他课程时间冲突，请核对后添加');location.href='openCourse.asp';</script>"
							else
								sql="insert into openCourse values('" & ocno & "','" & ocsn &  "','" & ocname &"','" & oteaname &"','"& oroom & oroomno & "','"& oweekday & otime &"','"& allclass &"','"& onumber &"','"& onumber &"')"
								conn.execute sql 				
								response.Write"<script language=javascript>alert('开课课程添加成功');location.href='openCourse.asp';</script>"	
							end if
						end if
					end if
				end if
			end if
		%>
        <%
		conn.Close
		Set conn=nothing
		Set rec=nothing
		%>
</body>
</html>
