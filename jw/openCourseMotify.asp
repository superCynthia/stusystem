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
			ocno=trim(request.form("InputOpenCno2"))
			ocsn=trim(request.form("InputOpenCsn2"))
			ocname=trim(request.form("InputOpenCourName2"))
			oteaname=trim(request.form("InputOpenCourTeaName2"))
			oroom=trim(request.form("SelectOpenCourRoom2"))
			oroomno=trim(request.form("SelectOpenCourRoomNo2"))
			oweekday=trim(request.form("SelectOpenCourWeekday2"))
			otime=trim(request.form("SelectOpenCourTime2"))
			
			omajor1=trim(request.form("SelectOpenCourMajor4"))
			oclass1=trim(request.form("SelectOpenCourClass4"))
			omajor2=trim(request.form("SelectOpenCourMajor5"))
			oclass2=trim(request.form("SelectOpenCourClass5"))
			omajor3=trim(request.form("SelectOpenCourMajor6"))
			oclass3=trim(request.form("SelectOpenCourClass6"))
			
			onumber=trim(request.form("InputOpenCourseNumber2"))
		%>
		<%
			dim allclass
			
			if ocno="" or ocsn="" then
				response.Write"<script language=javascript>alert('请输入课程号和课序号再进行修改');location.href='openCourse.asp';</script>"
			else
				dim rs_opencourse
				set rs_opencourse=conn.execute("select * from openCourse where cno='"& ocno &"' and csn='"& ocsn &"'")
				if not rs_opencourse.eof then
					if ocname<>"" then
						sql="update openCourse set name='"& ocname &"' where cno='"& ocno &"' and csn='"& ocsn &"'"
						conn.execute sql
					end if 
					if oteaname<>"" then
						sql2="update openCourse set teacherName='"& oteaname &"' where cno='"& ocno &"' and csn='"& ocsn &"'"
						conn.execute sql2
				    end if
					if oroom<>"" and oroomno<>"" then
						sql3="update openCourse set classroom='"& oroom & oroomno &"' where cno='"& ocno &"' and csn='"& ocsn &"'"
						conn.execute sql3 
					end if
					if oweekday<>"" and otime<>"" then
						sql4="update openCourse set schooltime='"& oweekday & otime &"' where cno='"& ocno &"' and csn='"& ocsn &"'"
						conn.execute sql4
					end if
					if onumber<>"" then
						sql5="update openCourse set number='"& onumber &"' where cno='"& ocno &"' and csn='"& ocsn &"'"
						conn.execute sql5
					end if
					
					if omajor1<>"" and oclass1<>"" and omajor2<>"" and oclass2<>"" and omajor3<>"" and oclass3<>"" then
						allclass=omajor1 & oclass1 & ";" & omajor2 & oclass2 & ";" & omajor3 & oclass3
						sql6="update openCourse set majorClass='"& allclass &"' where cno='"& ocno &"' and csn='"& ocsn &"'"
						conn.execute sql6
					else if omajor<>"" and oclass<>"" and omajor2<>"" and oclass2<>"" then
						allclass=omajor1 & oclass1 & ";" & omajor2 & oclass2
						sql7="update openCourse set majorClass='"& allclass &"' where cno='"& ocno &"' and csn='"& ocsn &"'"
						conn.execute sql7
					else
						allclass=omajor1 & oclass1
						sql8="update openCourse set majorClass='"& allclass &"' where cno='"& ocno &"' and csn='"& ocsn &"'"
						conn.execute sql8
					end if
					end if
					
					response.Write"<script language=javascript>alert('开课课程信息修改成功');location.href='openCourse.asp'</script>"
				else 
					response.Write"<script language=javascript>alert('该课程不存在于开课数据，请核对后再输入');location.href='openCourse.asp';</script>"
				end if
			end if
		%>
        
        
</body>
</html>
