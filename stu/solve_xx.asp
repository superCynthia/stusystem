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
	set rs=conn.execute("exec WatchThisTermCour2 '"&no&"'")
	
	do while not rs.eof
		if i=rownum then
			cno=rs(0)
			csn=rs(1)
			cname=rs(2)
			credit=rs(4)
			num=rs(6)
			exit do
		end if
	rs.movenext
	i=i+1
	loop
	
	dim rec
	set rec=conn.execute("select cno from chooseCourse where cno='"&cno&"' and sno='"&no&"'")
	if not rec.eof then
		response.Write"<script language=javascript>alert('您已选修该课！请选其他课程！');location.href='xk.asp';</script>"
	else if num-1<0 then
		response.Write"<script language=javascript>alert('该课已达选课人数上限，选课失败！');location.href='xk.asp';</script>"
	else
		conn.execute("insert into chooseCourse(cno,csn,sno,stuName,courName,credit) values('"&cno&"','"&csn&"','"&no&"','"&username&"','"&cname&"','"&credit&"')")
		conn.execute("update openCourse set residueNum=residueNum-1 where cno='"&cno&"' and csn='"&csn&"'")
		response.Write"<script language=javascript>alert('选课成功！');location.href='xk.asp';</script>"
	end if
	end if
	
%>