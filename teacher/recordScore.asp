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
                        <button type="button" class="btn btn-primary">保存修改</button>
                    </div>
                </form>
    		</div>
  		</div>
	</div>
    
	<div class="row">
   	  <div class="col-xs-1" style="background-color: #F7F7F9;"></div>
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
                        <a data-toggle="collapse" data-parent="#accordion" href="#addStu" aria-expanded="true" aria-controls="collapseOne">
                          学生成绩录入
                        </a>
                      </h5>
                    </div>
    
                    <div id="addStu" class="collapse in" role="tabpanel" aria-labelledby="headingOne">
                      <div class="card-block">
                          <form class="text-xs-center" action="recordScoreOk.asp" method="post">
                            <div class="form-group">
                              <label for="InputCno">请选择要录入的课程</label>
                              <select class="form-control" id="SelectDepart" name="SelectRecordCour">
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
                              
                              <button type="submit" class="btn btn-primary" style="margin-top:3rem">确定</button>
                            </div>
                          </form>
                      </div>
                    </div>
                  </div>
                  
                  <div class="card">
                    <div class="card-header" role="tab" id="headingOne">
                      <h5 class="mb-0">
                        <a data-toggle="collapse" data-parent="#accordion" href="#modifyScore" aria-expanded="true" aria-controls="collapseOne">
                          学生成绩修改
                        </a>
                      </h5>
                    </div>
    
                    <div id="modifyScore" class="collapse" role="tabpanel" aria-labelledby="headingOne">
                      <div class="card-block">
                          <form class="text-xs-center" action="recordScoreModify.asp" method="post">
                            <div class="form-group">
                              <div class="form-group row">
                                  <label class="col-sm-2 col-form-label" for="InputCno">课程</label>
                                  <div class="col-sm-10">
                                      <select class="form-control" id="SelectDepart" name="SelectRecordCour2">
                                            <option></option>
                                            <%dim rec2 
                                              set rec2=conn.execute("select * from openCourse where teacherName='"& username &"'")
                                              do while not rec2.eof
                                            %>
                                                <option ><%=rec2(2)%></option>
                                            <%
                                                rec2.movenext
                                                loop
                                            %>
                                      </select>
                                  </div>
                              </div>
                              
                              <div class="form-group row">
                                  <label for="InputsSno" class="col-sm-2 col-form-label">学号</label>
                                  <div class="col-sm-10">
                                    <input type="text" class="form-control" id="InputSno2" placeholder="学号" name="InputSno2">
                                  </div>
                              </div>
                              <div class="form-group row">
                                  <label for="InputCsn" class="col-sm-2 col-form-label">平时成绩</label>
                                  <div class="col-sm-10">
                                    <input type="text" class="form-control" id="InputOrdinary" placeholder="平时成绩" name="InputOrdinaryScore2">
                                  </div>
                              </div>
                              <div class="form-group row">
                                  <label for="InputCsn" class="col-sm-2 col-form-label">期末成绩</label>
                                  <div class="col-sm-10">
                                    <input type="text" class="form-control" id="InputTest" placeholder="期末成绩" name="InputTestScore2">
                                  </div>
                              </div>
                              <div class="form-group row">
                                  <label for="InputCsn" class="col-sm-2 col-form-label">总成绩</label>
                                  <div class="col-sm-10">
                                    <input type="text" class="form-control" id="InputAllScore" placeholder="总成绩" name="InputAllScore2">
                                  </div>
                              </div>
                              
                              <button type="submit" class="btn btn-primary" style="margin-top:3rem">确定</button>
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
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK" crossorigin="anonymous"></script>
</body>
</html>
