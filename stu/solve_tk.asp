<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
no=session("no")
username = Session("username")
if username="" then 
	response.Redirect("../login/login.asp")
end if
%>
<!--#include file="conn.asp"-->
<%
	dim row,arr,rownum
    row=Request.QueryString
	arr=Split(row,"=")
	rownum=cint(arr(1))
    dim rs,i
	i=0
	set rs=conn.execute("exec WatchThisTermCour4 '"&no&"'")
	
	do while not rs.eof
		if i=rownum then
			cno=rs(0)
			csn=rs(7)
			exit do
		end if
	rs.movenext
	i=i+1
	loop
	
	conn.execute("delete from chooseCourse where cno='"&cno&"' and sno='"&no&"'")
	conn.execute("update openCourse set residueNum=residueNum+1 where cno='"&cno&"' and csn='"&csn&"'")
	response.Write"<script language=javascript>alert('退课成功！');location.href='xk.asp';</script>"
	
%>