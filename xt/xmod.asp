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
			no=trim(request.Form("no"))
			new_name=trim(request.form("new_name"))		
			new_mgr=trim(request.form("new_mgr"))
		%>
		<%
			if no="" then
				response.Write"<script language=javascript>alert('请输入系所编号再进行修改');location.href='xs.asp';</script>"
			else
				dim rs
				set rs=conn.execute("select * from department where ID='"& no &"'")
				if not rs.eof then
					if new_name<>"" then
						sql="update department set name='"& new_name &"' where ID='"& no &"'"
						conn.execute sql 
                                        end if
					if new_mgr<>"" then
						sql2="update department set managerName='"& new_mgr &"' where ID='"& no &"'"
						conn.execute sql2 
					end if
					response.Write"<script language=javascript>alert('信息修改成功');location.href='xs.asp'</script>"
				else 
					response.Write"<script language=javascript>alert('该系所编号不存在，请核对后再输入');location.href='xs.asp';</script>"
				end if
			end if
			rs.close
			set rs=nothing
			conn.close
			set conn=nothing
		%>
        
</body>
</html>
