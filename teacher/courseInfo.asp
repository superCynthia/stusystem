<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
	username = Session("username")
	if username="" then 
		response.Redirect("../login/login.asp")
	end if
%>
<!--#include file="conn.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-flex.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-reboot.css" />
<title>学生选课和成绩管理系统</title>
</head>

<body style="background-color: #f7f7f9;">
	<!--修改密码-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>
        			<h4 class="modal-title" id="myModalLabel">修改密码</h4>
      			</div>
                <form action="cpwd.asp" method="post">
      				<div class="modal-body">
                    	<div class="form-group row">
  							<label for="example-text-input" class="col-xs-2 col-form-label">原密码:</label>
 							 <div class="col-xs-10">
    							<input class="form-control" type="password" id="example-text-input" name="opwd">
  							</div>
						</div>
                        <div class="form-group row">
  							<label for="example-text-input" class="col-xs-2 col-form-label">新密码:</label>
 							 <div class="col-xs-10">
    							<input class="form-control" type="password" id="example-text-input" name="npwd">
  							</div>
						</div>
                    
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">保存修改</button>
                    </div>
                </form>
    		</div>
  		</div>
	</div>
    
	<div class="row">
   	  <div class="col-xs-1" style="background-color:#F7F7F9;"></div>
        <div class="col-xs-10">
        	<nav class="navbar navbar-light bg-faded" style="background-color: #FFF;">
  				<a class="navbar-brand">
    			<img src="../images/logo.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
    			&nbsp;&nbsp;&nbsp;系统管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				</a>
        		<div class="nav navbar-nav">
    				<a class="nav-item nav-link" href="http://www.wh.sdu.edu.cn/index.do" target="_blank">&nbsp;&nbsp;&nbsp;学校首页&nbsp;&nbsp;&nbsp;</a>
    				<a class="nav-item nav-link" href="http://www.jwc.wh.sdu.edu.cn/index_nologin.do" target="_blank">&nbsp;&nbsp;&nbsp;教务处&nbsp;&nbsp;&nbsp;</a>
    				<a class="nav-item nav-link" href="http://192.168.75.104:8080/selfservice/login.jsf" target="_blank">&nbsp;&nbsp;&nbsp;网络中心&nbsp;&nbsp;&nbsp;</a>
    				<a class="nav-item nav-link" href="http://www.lib.wh.sdu.edu.cn/cn/" target="_blank">&nbsp;&nbsp;&nbsp;图书馆&nbsp;&nbsp;&nbsp;</a>
  				</div>
        		<div>
        			<li class="nav-item dropdown float-xs-right">
      					<a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       					 <%=username%>
      					</a>
      					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
        					<a class="dropdown-item" data-toggle="modal" data-target="#myModal">修改密码</a>
        					<a class="dropdown-item" href="../login/login.asp">注销</a>
      					</div>
    				</li>
        		</div>
  			</nav>
      </div>
      <div class="col-xs-1" style="background-color: #F7F7F9;"></div>
    </div>
    <div class="row" style="height:50px;"></div>
	<div class="row">
    	<div class="col-xs-1"></div>
        <div class="col-xs-3 text-xs-center" style="background-color: #FFF;">
        	<div style="height:90px;"></div>
        	<img src="../images/logo.jpg" width="90" height="90">
            <br /><label><%=username%></label>
            <div style="height:30px;"></div>
    		<div class="list-group">
  				<a href="courseInfo.asp" class="list-group-item list-group-item-action">开课信息查看</a>
  				<a href="recordScore.asp" class="list-group-item list-group-item-action">学生成绩录入</a>
  				<a href="importScore.asp" class="list-group-item list-group-item-action">学生成绩导入</a>
                <div style="height:30px;"></div>
			</div>
        </div>
        <div class="col-xs-7">
        	<div class="col-xs-1" style="background-color: #f7f7f9;"></div>
            <div class="col-xs-11" style="background-color: #FFF;">
            
            <!--表单内容-->
            <div id="accordion" role="tablist" aria-multiselectable="true">
              <!--查看开课信息-->
              <div class="card">
                <div class="card-header" role="tab" id="headingOne">
                  <h5 class="mb-0">
                    <a data-toggle="collapse" data-parent="#accordion" href="#watchCourse" aria-expanded="true" aria-controls="collapseOne">
                      查看开课信息
                    </a>
                  </h5>
                </div>

                <div id="watchCourse" class="collapse" role="tabpanel" aria-labelledby="headingOne">
                  <div class="card-block">
                    <form class="text-xs-center">
                        <table class="table table-striped" id="course" >
  							<thead>
    							<tr>
      								<th>课程名</th>
                                    <th>教室</th>
                                    <th>时间</th>
                                    <th>课时</th>
                                    <th>班级</th>
                                    <th>开课人数</th>
                                    <th>当前人数</th>
                                    <th>查看名单</th>
    							</tr>
  							</thead>
  							<tbody>
                            	<%
									dim n
									n=0
									set rs=conn.execute("exec WatchCourse '"&username&"'")
									do while not rs.eof
										response.write("<tr>")
										for i=0 to rs.fields.count+1
											if i<=rs.fields.count-1 then
												response.write("<td>"&rs(i)&"</td>")
											end if									
										next
										n=n+1
								%>
										<td><button name="">查看名单</button></td>
								<%  	response.write("</tr>")
										rs.movenext
									loop
								%>
  							</tbody>
						</table>
                        <div class="text-xs-center">
                                <span id="spanFirst">第一页</span> &nbsp;&nbsp;&nbsp;&nbsp;
                                <span id="spanPre">上一页</span> &nbsp;&nbsp;&nbsp;&nbsp;
                                <span id="spanNext">下一页</span> &nbsp;&nbsp;&nbsp;&nbsp;
                                <span id="spanLast">最后一页</span> &nbsp;&nbsp;&nbsp;&nbsp;
                                第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
      					</div>
                     </form>
                  </div>
                </div>
              </div>
              
              <div class="card">
                <div class="card-header" role="tab" id="headingOne">
                  <h5 class="mb-0">
                    <a data-toggle="collapse" data-parent="#accordion" href="#WatchStu" aria-expanded="true" aria-controls="collapseOne">
                      查看学生名单
                    </a>
                  </h5>
                </div>

                <div id="WatchStu" class="collapse in" role="tabpanel" aria-labelledby="headingOne">
                  <div class="card-block">
                    <form class="text-xs-center" action="courseInfo.asp" method="post">
                    	<div class="form-group">
                          <label for="InputCno">请选择要查看的课程</label>
                          <select class="form-control" id="SelectDepart" name="SelectCour">
                          		<option></option>
                                <%dim rec 
								  set rec=conn.execute("select * from openCourse where teacherName='"& username &"'")
								  do while not rec.eof
								%>
                               	 	<option ><%=rec(2)%></option>
                                <%
									rec.movenext
									loop
								%>
                          </select>
                          
                          <button type="submit" class="btn btn-primary" style="margin-top:3rem">查看</button>
                        </div>
                        <table class="table table-striped" id="student">
                            <thead>
                                <tr>
                                    <th>学号</th>
                                    <th>姓名</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%       
								cname=trim(request.form("SelectCour"))                 
                                set rs=conn.execute("exec WatchStudent '"&username&"','"&cname&"'")
                                do while not rs.eof
                                    response.write("<tr>")
                                    for i=0 to rs.fields.count+1
                                        if i<=rs.fields.count-1 then
                                            response.write("<td>"&rs(i)&"</td>")
                                        end if 
                                    next
                                    response.write("</tr>")
                                    rs.movenext
                                    loop
                                %>             	
                            </tbody>
                        </table>
                        
                        <div class="text-xs-center">
                                <span id="spanFirst">第一页</span> &nbsp;&nbsp;&nbsp;&nbsp;
                                <span id="spanPre">上一页</span> &nbsp;&nbsp;&nbsp;&nbsp;
                                <span id="spanNext">下一页</span> &nbsp;&nbsp;&nbsp;&nbsp;
                                <span id="spanLast">最后一页</span> &nbsp;&nbsp;&nbsp;&nbsp;
                                第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
      					</div>
                     </form>
                  </div>
                </div>
              </div>
              
		</div>
            
        </div>
        </div>
        <div class="col-xs-1"></div>
    </div>
    
<script language="javascript" type="text/javascript">
     var theTable = document.getElementById("course");
     var totalPage = document.getElementById("spanTotalPage");
     var pageNum = document.getElementById("spanPageNum");


     var spanPre = document.getElementById("spanPre");
     var spanNext = document.getElementById("spanNext");
     var spanFirst = document.getElementById("spanFirst");
     var spanLast = document.getElementById("spanLast");


     var numberRowsInTable = theTable.rows.length;
     var pageSize = 3;
     var page = 1;


     //下一页
     function next() {


         hideTable();


         currentRow = pageSize * page;
         maxRow = currentRow + pageSize;
         if (maxRow > numberRowsInTable) maxRow = numberRowsInTable;
         for (var i = currentRow; i < maxRow; i++) {
             theTable.rows[i].style.display = '';
         }
         page++;


         if (maxRow == numberRowsInTable) { nextText(); lastText(); }
         showPage();
         preLink();
         firstLink();
     }


     //上一页
     function pre() {


         hideTable();


         page--;


         currentRow = pageSize * page;
         maxRow = currentRow - pageSize;
         if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
         for (var i = maxRow; i < currentRow; i++) {
             theTable.rows[i].style.display = '';
         }




         if (maxRow == 0) { preText(); firstText(); }
         showPage();
         nextLink();
         lastLink();
     }


     //第一页
     function first() {
         hideTable();
         page = 1;
         for (var i = 0; i < pageSize; i++) {
             theTable.rows[i].style.display = '';
         }
         showPage();


         preText();
         nextLink();
         lastLink();
     }


     //最后一页
     function last() {
         hideTable();
         page = pageCount();
         currentRow = pageSize * (page - 1);
         for (var i = currentRow; i < numberRowsInTable; i++) {
             theTable.rows[i].style.display = '';
         }
         showPage();


         preLink();
         nextText();
         firstLink();
     }


     function hideTable() {
         for (var i = 0; i < numberRowsInTable; i++) {
             theTable.rows[i].style.display = 'none';
         }
     }


     function showPage() {
         pageNum.innerHTML = page;
     }


     //总共页数
     function pageCount() {
         var count = 0;
         if (numberRowsInTable % pageSize != 0) count = 1;
         return parseInt(numberRowsInTable / pageSize) + count;
     }


     //显示链接
     function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>上一页</a>"; }
     function preText() { spanPre.innerHTML = "上一页"; }


     function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>下一页</a>"; }
     function nextText() { spanNext.innerHTML = "下一页"; }


     function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>第一页</a>"; }
     function firstText() { spanFirst.innerHTML = "第一页"; }


     function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>最后一页</a>"; }
     function lastText() { spanLast.innerHTML = "最后一页"; }


     //隐藏表格
     function hide() {
         for (var i = pageSize; i < numberRowsInTable; i++) {
             theTable.rows[i].style.display = 'none';
         }


         totalPage.innerHTML = pageCount();
         pageNum.innerHTML = '1';


         nextLink();
         lastLink();
     }
     hide();
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK" crossorigin="anonymous"></script>
</body>
</html>
