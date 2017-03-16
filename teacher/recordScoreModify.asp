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
			cname=trim(request.form("SelectRecordCour2"))
			sno=trim(request.Form("InputSno2"))
			sordiScore=trim(request.form("InputOrdinaryScore2"))		
			stestScore=trim(request.form("InputTestScore2"))
			sallScore=trim(request.form("InputAllScore2"))			
		%>
		<%
			if sno="" or cname="" then
				response.Write"<script language=javascript>alert('请选择课程和输入学号再进行修改');location.href='recordScore.asp';</script>"
			else
				dim rs_stu
				set rs_stu=conn.execute("select * from chooseCourse where sno='"& sno &"' and courName='"& cname &"'")
				if not rs_stu.eof then
					if sordiScore<>"" then
						sql="update chooseCourse set ordinaryScore='"& sordiScore &"' where sno='"& sno &"'and courName='"& cname &"'"
						conn.execute sql 
					end if
					if stestScore<>"" then
						sql2="update chooseCourse set testScore='"& stestScore &"' where sno='"& sno &"'and courName='"& cname &"'"
						conn.execute sql2 
					end if
					if sallScore<>"" then
						sql3="update chooseCourse set allScore='"& sallScore &"' where sno='"& sno &"'and courName='"& cname &"'"
						conn.execute sql3 
					end if
					response.Write"<script language=javascript>alert('学生成绩修改成功');location.href='recordScore.asp'</script>"
				else 
					response.Write"<script language=javascript>alert('该课程不存在此学生，请核对后再输入');location.href='recordScore.asp';</script>"
				end if
			end if
		%>
        
        
</body>
</html>
