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
			mod_no=trim(request.Form("mod_no"))
			mod_name=trim(request.form("mod_name"))
			mod_pwd=trim(request.form("mod_pwd"))
		%>
		<%
			if mod_no="" then
				response.Write"<script language=javascript>alert('请输入教务员编号再进行修改');location.href='jwy.asp';</script>"
			else
				dim rs
				set rs=conn.execute("select * from eduManager where wno='"& mod_no &"'")
				if not rs.eof then
					if mod_name<>"" then
						sql="update eduManager set name='"& mod_name &"' where wno='"& mod_no &"'"
						conn.execute sql 
					end if
					if mod_pwd<>"" then
						sql3="update eduManager set pwd='"& mod_pwd &"' where wno='"& mod_no &"'"
						conn.execute sql3 
					end if
					response.Write"<script language=javascript>alert('信息修改成功');location.href='jwy.asp'</script>"
				else 
					response.Write"<script language=javascript>alert('该教务员编号不存在，请核对后再输入');location.href='jwy.asp';</script>"
				end if
			end if
			rs.close
			set rs=nothing
			conn.close
			set conn=nothing
		%>
        
        
</body>
</html>
