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
                        <button type="submit" class="btn btn-primary">保存修改</button>
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
  				<a href="student.asp" class="list-group-item list-group-item-action">学生信息维护</a>
  				<a href="teacher.asp" class="list-group-item list-group-item-action">教师信息维护</a>
  				<a href="course.asp" class="list-group-item list-group-item-action">开课计划维护</a>
  				<a href="openCourse.asp" class="list-group-item list-group-item-action">开课数据维护</a>
                <div style="height:30px;"></div>
			</div>
        </div>
        <div class="col-xs-7">
        	<div class="col-xs-1" style="background-color: #f7f7f9;"></div>
            <div class="col-xs-11" style="background-color: #FFF;">
            
            <!--表单内容-->
            <div id="accordion" role="tablist" aria-multiselectable="true">
              <!--添加教师-->
              <div class="card">
                <div class="card-header" role="tab" id="headingOne">
                  <h5 class="mb-0">
                    <a data-toggle="collapse" data-parent="#accordion" href="#addTeacher" aria-expanded="true" aria-controls="collapseOne">
                      添加教师信息
                    </a>
                  </h5>
                </div>

                <div id="addTeacher" class="collapse in" role="tabpanel" aria-labelledby="headingOne">
                  <div class="card-block">
                    <form id="form_teacherAdd" action="teacherAdd.asp" method="post">
                    	  <div class="form-group">
                            <label for="InputName">姓名</label>
                            <input type="text" class="form-control" id="InputTeaName" name="InputTeaName" placeholder="姓名">
                          </div>  
                          <div class="form-group">
                            <label for="SelectDepart">系所</label>
                            <select class="form-control" id="SelectTeaDepart" name="SelectTeaDepart">
                                <%
								dim rs_tea_department
								set rs_tea_department=conn.execute("select * from department")
								do while not rs_tea_department.eof
								%>
                                	<option><%=rs_tea_department(1)%></option>
                                <%
									rs_tea_department.movenext
									loop
								%>
                            </select>
                          </div>
                          <div class="form-group">
                            <label for="SelectPositon">职位</label>
                            <select class="form-control" id="SelectTeaPositon" name="SelectTeaPosition">
                              <option>助教</option>
                              <option>讲师</option>
                              <option>副教授</option>
                              <option>教授</option>
                            </select>
                          </div>
                          <div class="form-group">
                              <label for="inputHire">入职日期</label>
                              <input class="form-control" type="date" id="InputTeaHire" name="InputTeaHire">
                          </div>

						  <div class="form-group">
                            <label for="inputTele">联系方式</label>
                            <input type="text" class="form-control" id="InputTeaTele" name="InputTeaTele">
                          </div>  
                          <div class="form-group">
                            <label for="inputAddr">住址</label>
                            <input type="text" class="form-control" id="InputTeaAddr" name="InputTeaAddr">
                          </div>                         
                          <div class="form-group">
                            <label for="InputPassword">密码</label>
                            <input type="password" class="form-control" id="InputTeaPassword" name="InputTeaPassword" placeholder="密码">
                          </div>
                          <div class="form-group">
                            <label for="Textarea">其他</label>
                            <textarea class="form-control" id="Textarea" rows="3"></textarea>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label">
                              <input type="checkbox" class="form-check-input">
                              确认
                            </label>
                          </div>
                          <button type="submit" class="btn btn-primary">提交</button>

                    </form>
                  </div>
                </div>
              </div>
              
              <!--修改教师-->
              <div class="card">
                <div class="card-header" role="tab" id="headingTwo">
                  <h5 class="mb-0">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#motifyTea" aria-expanded="false" aria-controls="collapseTwo">
                      修改教师信息
                    </a>
                  </h5>
                </div>
                <div id="motifyTea" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
                  <div class="card-block">
                  	 <form action="teacherMotify.asp" method="post">
                     	  <div class="form-group">
                            <label for="InputWno">教工号</label>
                            <input type="text" class="form-control" id="InputWno" name="InputWno">
                            <small id="fileHelp" class="form-text text-muted">教工号不可修改</small>
                          </div>
                    	  <div class="form-group">
                            <label for="InputName">姓名</label>
                            <input type="text" class="form-control" id="InputName" name="InputTeaName2">
                          </div>  
                          <div class="form-group">
                            <label for="SelectDepart">系所</label>
                            <select class="form-control" id="SelectDepart" name="SelectTeaDepart2">
                            	<option></option>
                              	<%
								dim rs_tea_department2
								set rs_tea_department2=conn.execute("select * from department")
								do while not rs_tea_department2.eof
								%>
                                	<option><%=rs_tea_department2(1)%></option>
                                <%
									rs_tea_department2.movenext
									loop
								%>
                            </select>
                          </div>
                          <div class="form-group">
                            <label for="SelectPositon">职位</label>
                            <select class="form-control" id="SelectPositon" name="SelectTeaPosition2">
                              <option></option>
                              <option>助教</option>
                              <option>讲师</option>
                              <option>副教授</option>
                              <option>教授</option>
                            </select>
                          </div>
                          <div class="form-group">
                              <label for="InputHire">入职日期</label>
                              <input class="form-control" type="date" id="InputHire" name="InputTeaHire2">
                          </div>

						  <div class="form-group">
                            <label for="InputTele">联系方式</label>
                            <input type="text" class="form-control" id="InputTele" name="InputTeaTele2">
                          </div>  
                          <div class="form-group">
                            <label for="InputAddr">住址</label>
                            <input type="text" class="form-control" id="InputAddr" name="InputTeaAddr2">
                          </div> 
                          <div class="form-group">
                            <label for="Textarea">其他</label>
                            <textarea class="form-control" id="Textarea" rows="3"></textarea>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label">
                              <input type="checkbox" class="form-check-input">
                              确认
                            </label>
                          </div>
                          <button type="submit" class="btn btn-primary">修改</button>

                    </form>
                  </div>
                </div>
              </div>
              
              <!--删除教师-->
              <div class="card">
                <div class="card-header" role="tab" id="headingThree">
                  <h5 class="mb-0">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#DeleteTea" aria-expanded="false" aria-controls="collapseThree">
                      删除教师信息
                    </a>
                  </h5>
                </div>
                <div id="DeleteTea" class="collapse" role="tabpanel" aria-labelledby="headingThree">
                  <div class="card-block">
                    <form action="teacherDelete.asp" method="post">
                     	<div class="form-group">
                          <label for="InputWno">请输入要删除的教师教工号</label>
                          <input type="text" class="form-control" id="InputWno" name="InputWno_delete">
                          <div class="form-check">
                            <label class="form-check-label">
                              <input type="checkbox" class="form-check-input">
                              确认
                            </label>
                          </div>
                          <button type="submit" class="btn btn-primary">删除</button>
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
