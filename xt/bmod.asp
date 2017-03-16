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
			mod_ma=trim(request.form("mod_mar"))
			mod_year=trim(request.form("mod_year"))
			mod_number=trim(request.form("mod_number"))
		%>
		<%
			if mod_no="" then
				response.Write"<script language=javascript>alert('请输入教务员编号再进行修改');location.href='bj.asp';</script>"
			else
				dim rs
				set rs=conn.execute("select * from [class] where ID='"& mod_no &"'")
				if not rs.eof then
					if mod_name<>"" then
						sql="update [class] set name='"& mod_name &"' where ID='"& mod_no &"'"
						conn.execute sql 
                                        end if
					if mod_ma<>"" then
						sql2="update [class] set majorName='"& mod_ma &"' where ID='"& mod_no &"'"
						conn.execute sql2 
						dim r
						set r=conn.execute ("select * from major where name='"&mod_ma&"'")
						sqlstr="update [class] set majorID='"& r(0) &"' where ID='"& mod_no &"'"
						conn.execute sqlstr
                    end if
					if mod_number<>"" then
						sql3="update [class] set number='"& mod_number &"' where ID='"& mod_no &"'"
						conn.execute sql3
                                        end if 
					if mod_year<>"" then
						sql4="update [class] set enrollmentDate='"& mod_year &"' where ID='"& mod_no &"'"
						conn.execute sql4 
					end if
					response.Write"<script language=javascript>alert('信息修改成功');location.href='bj.asp'</script>"
				else 
					response.Write"<script language=javascript>alert('该教务员编号不存在，请核对后再输入');location.href='bj.asp';</script>"
				end if
			end if
			rs.close
			set rs=nothing
			conn.close
			set conn=nothing
		%>
        
        
</body>
</html>
