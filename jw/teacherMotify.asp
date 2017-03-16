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
			tno=trim(request.Form("InputWno"))
			tname=trim(request.form("InputTeaName2"))
			tdepart=trim(request.form("SelectTeaDepart2"))
			tposition=trim(request.form("SelectTeaPosition2"))
			ttele=trim(request.form("InputTeaTele2"))
		%>
		<%
			if tno="" then
				response.Write"<script language=javascript>alert('请输入教工号再进行修改');location.href='teacher.asp';</script>"
			else
				dim rs_tea
				set rs_tea=conn.execute("select * from teacher where wno='"& tno &"'")
				if not rs_tea.eof then
					if tname<>"" then
						sql="update teacher set name='"& tname &"' where wno='"& tno &"'"
						conn.execute sql 
					end if
					if tdepart<>"" then
						sql2="update teacher set departmentName='"& tdepart &"' where wno='"& tno &"'"
						conn.execute sql2 
					end if
					
					if tposition<>"" then
						sql3="update teacher set position='"& tposition &"' where wno='"& tno &"'"
						conn.execute sql3 
					end if
					
					if ttele<>"" then
						sql4="update teacher set telephone='"& ttele &"' where wno='"& tno &"'"
						conn.execute sql4 
					end if

					response.Write"<script language=javascript>alert('教师信息修改成功');location.href='teacher.asp'</script>"
				else 
					response.Write"<script language=javascript>alert('该教工号不存在，请核对后再输入');location.href='teacher.asp';</script>"
				end if
			end if
		%>
        
        
</body>
</html>
