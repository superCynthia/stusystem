<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
no=session("no")
username = Session("username")
if username="" then 
	response.Redirect("../login/login.asp")
end if
%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-flex.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-reboot.css" />
<script type="text/javascript" src="../css/bootstrap.js"></script>
<title>学生选课和成绩管理系统</title>
</head>

<body style="background-color: #f7f7f9;">
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
    							<input class="form-control" type="password" id="opwd" name="opwd">
  							</div>
						</div>
                        <div class="form-group row">
  							<label for="example-text-input" class="col-xs-2 col-form-label">新密码:</label>
 							 <div class="col-xs-10">
    							<input class="form-control" type="password" id="npwd" name="npwd">
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
   	  <div class="col-xs-1"></div>
        <div class="col-xs-10">
        	<nav class="navbar navbar-light bg-faded" style="background-color: #FFF;">
  				<a class="navbar-brand">
    			<img src="../images/logo.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
    			&nbsp;&nbsp;&nbsp;学生综合系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				</a>
        		<div class="nav navbar-nav">
    				<a class="nav-item nav-link" target="_blank" href="http://www.wh.sdu.edu.cn/index.do">&nbsp;&nbsp;&nbsp;学校首页&nbsp;&nbsp;&nbsp;</a>
    				<a class="nav-item nav-link" target="_blank" href="http://www.jwc.wh.sdu.edu.cn/index_nologin.do">&nbsp;&nbsp;&nbsp;教务处&nbsp;&nbsp;&nbsp;</a>
    				<a class="nav-item nav-link" target="_blank" href="http://192.168.75.104:8080/selfservice/login.jsf">&nbsp;&nbsp;&nbsp;网络中心&nbsp;&nbsp;&nbsp;</a>
    				<a class="nav-item nav-link" target="_blank" href="http://www.lib.wh.sdu.edu.cn/cn/">&nbsp;&nbsp;&nbsp;图书馆&nbsp;&nbsp;&nbsp;</a>
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
      <div class="col-xs-1"></div>
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
  				<a href="gr.asp" class="list-group-item list-group-item-action">个人信息查看</a>
  				<a href="xk.asp" class="list-group-item list-group-item-action">选课中心</a>
  				<a href="cj.asp" class="list-group-item list-group-item-action">成绩查询</a>
                <div style="height:30px;"></div>
			</div>
        </div>
        <div class="col-xs-7">
        	<div class="col-xs-1" style="background-color: #f7f7f9;"></div>
            <div class="col-xs-11" style="background-color: #FFF;">
            	<div id="accordion" role="tablist" aria-multiselectable="true" style="margin-top: 1.5rem;">
  					<div class="card">
    					<div class="card-header" role="tab" id="headingOne">
      						<h6 class="mb-0">
        					<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
         					 本学期已选课程
        					</a>
      						</h6>
    					</div>

    				<div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne">
      					<div class="card-block">
        					<form class="text-xs-center">
                            	<table class="table table-striped text-xs-center">
  									<thead>
    									<tr>
      										<th>课程号</th>
      										<th>课程名称</th>
      										<th>学分</th>
                                            <th>课时</th>
      										<th>地点</th>
                                            <th>任课教师</th>
    									</tr>
  									</thead>
  									<tbody>
                                        <%
											dim rec1 
								  			set rec1=conn.execute("exec WatchThisTermCour1 '"&no&"'")
								 			do while not rec1.eof
										%>
                                        <tr>
      										<td><%=rec1(0)%></td>
      										<td><%=rec1(1)%></td>
     										<td><%=rec1(2)%></td>
                                            <td><%=rec1(3)%></td>
     										<td><%=rec1(4)%></td>
                                            <td><%=rec1(5)%></td>
                                        </tr>
                                        <%
											rec1.movenext
											loop
										%>
  									</tbody>
								</table>
                            </form>
      					</div>
    				</div>
  				</div>
  				<div class="card">
    				<div class="card-header" role="tab" id="headingTwo">
      					<h6 class="mb-0">
        				<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          				限选课选课
        				</a>
      					</h6>
    				</div>
    				<div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
      					<div class="card-block">
        					
                            	<table name="mytable" id="mytable" class="table table-striped text-xs-center">
  									<thead>
    									<tr>
      										<th>课程号</th>
      										<th>课序号</th>
      										<th>课程名称</th>
                                            <th>学时</th>
      										<th>学分</th>
      										<th>任课教师</th>
                                            <th>课余量</th>
                                            <th>状态</th>
                        				</tr>
     						 		</thead>
  									<tbody>
                                        <%
											dim rec2,i
											i=0
											set rec2=Server.CreateObject("ADODB.RecordSet")
											sqlstr="exec WatchThisTermCour2 '"&no&"'"
								  			'set rec2=conn.execute("exec WatchThisTermCour2 '"&no&"'")
											rec2.open sqlstr,conn,1,1
											
								 			do while not rec2.eof
										%>
                                        <tr>
      										<td><%=rec2(0)%></td>
      										<td><%=rec2(1)%></td>
      										<td><%=rec2(2)%></td>
                                            <td><%=rec2(3)%></td>
      										<td><%=rec2(4)%></td>
      										<td><%=rec2(5)%></td>
                                            <td><%=rec2(6)%></td>
                                            <td><button name="<%=i%>" type="button" OnClick="btnclick(this);" class="btn btn-info">选课</button></td>
                                        </tr>
                                        <%
											rec2.movenext
											i=i+1
											loop
											'If rec2.EOF Then Exit For
											'next
											'end if
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
                        </div>
    				</div>
  				</div>
                <div class="card">
    				<div class="card-header" role="tab" id="headingThree">
      					<h6 class="mb-0">
        				<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          				通选课选课
        				</a>
      					</h6>
    				</div>
    				<div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
      					<div class="card-block">
        					<form class="text-xs-center">
                            	<table class="table table-striped">
  									<thead>
    									<tr>
      										<th>课程号</th>
      										<th>课序号</th>
      										<th>课程名称</th>
                                            <th>学时</th>
      										<th>学分</th>
                                            <th>时间</th>
      										<th>任课教师</th>
                                            <th>课余量</th>
                                            <th>状态</th>
                        				</tr>
     						 		</thead>
  									<tbody>
    									<%
											dim rec3,j
											j=0
								  			set rec3=conn.execute("exec WatchThisTermCour3 '"&no&"'")
								 			do while not rec3.eof
										%>
                                        <tr>
      										<td><%=rec3(0)%></td>
      										<td><%=rec3(1)%></td>
      										<td><%=rec3(2)%></td>
                                            <td><%=rec3(3)%></td>
      										<td><%=rec3(4)%></td>
      										<td><%=rec3(5)%></td>
                                            <td><%=rec3(6)%></td>
                                            <td><%=rec3(7)%></td>
                                            <td><button name="<%=j%>" type="button" OnClick="btnclick1(this);" class="btn btn-info">选课</button></td>
                                        <tr>
                                        <%
											rec3.movenext
											j=j+1
											loop
										%>
    									</tr>
  									</tbody>
								</table>
                            </form>
      					</div>
    				</div>
  				</div>
                <div class="card">
    				<div class="card-header" role="tab" id="headingFour">
      					<h6 class="mb-0">
        				<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
          				退课
        				</a>
      					</h6>
    				</div>
    				<div id="collapseFour" class="collapse" role="tabpanel" aria-labelledby="headingFour">
      					<div class="card-block">
        					<form class="text-xs-center">
                            	<table class="table table-striped">
  									<thead>
    									<tr>
      										<th>课程号</th>
      										<th>课程名称</th>
      										<th>学分</th>
                                            <th>课时</th>
                                            <th>地点</th>
      										<th>任课教师</th>
                                            <th>状态</th>
                        				</tr>
     						 		</thead>
  									<tbody>
                                    	<%
											dim rec4,k
											k=0
								  			set rec4=conn.execute("exec WatchThisTermCour4 '"&no&"'")
								 			do while not rec4.eof
												if rec4(6)="必修课" then
										%>
    									<tr>
                                        	<td><%=rec4(0)%></td>
      										<td><%=rec4(1)%></td>
                                            <td><%=rec4(2)%></td>
      										<td><%=rec4(3)%></td>
      										<td><%=rec4(4)%></td>
                                            <td><%=rec4(5)%></td>
                                            <td>必修课不能退课</td>
    									</tr>
                                        <%
												else
                                        %>
                                        <tr>
      										<td><%=rec4(0)%></td>
                                            <td><%=rec4(1)%></td>
      										<td><%=rec4(2)%></td>
      										<td><%=rec4(3)%></td>
                                            <td><%=rec4(4)%></td>
                                            <td><%=rec4(5)%></td>
                                            <td><button name="<%=k%>" type="button" OnClick="btnclick2(this);" class="btn btn-info">退课</button></td>
    									</tr>
                                        <%
												end if
											rec4.movenext
											k=k+1
											loop
										%>
  									</tbody>
								</table>
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
    	function btnclick(t){
			location.href="solve_xx.asp?row="+t.name
			}
    </script>
    <script language="javascript" type="text/javascript">
    	function btnclick1(s){
			location.href="solve_ts.asp?row="+s.name
			}
    </script>
    <script language="javascript" type="text/javascript">
    	function btnclick2(m){
			location.href="solve_tk.asp?row="+m.name
			}
    </script>
    <script language="javascript" type="text/javascript">
     var theTable = document.getElementById("mytable");
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
