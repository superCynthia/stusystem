<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
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
    			&nbsp;&nbsp;&nbsp;系统管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
  				<a href="jwy.asp" class="list-group-item list-group-item-action">教务管理员维护</a>
  				<a href="xs.asp" class="list-group-item list-group-item-action">系信息维护</a>
  				<a href="zy.asp" class="list-group-item list-group-item-action">专业信息维护</a>
  				<a href="bj.asp" class="list-group-item list-group-item-action">班级信息维护</a>
  				<a href="kc.asp" class="list-group-item list-group-item-action">课程类别信息维护</a>
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
         					 添加班级
        					</a>
      						</h6>
    					</div>

    				<div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne">
      					<div class="card-block">
        					<form action="badd.asp" method="post">
                            	<div class="form-group row">
  									<label for="example-text-input" class="col-xs-2 col-form-label">班级名称:</label>
 							 		<div class="col-xs-10">
    									<input class="form-control" type="text" id="bname" name="bname" placeholder="班级名称">
  									</div>
								</div>
                                <div class="form-group row">
  									<label for="example-xs-input" class="col-xs-2 col-form-label">所属专业:</label>
  									<select class="form-control" id="bma" name="bma">
                                    	<%
											dim rec 
								  			set rec=conn.execute("select * from major")
								 			do while not rec.eof
										%>
                               	 		<option ><%=rec(1)%></option>
                                		<%
											rec.movenext
											loop
										%>
    								</select>
								</div>
                                <div class="form-group row">
  									<label for="example-text-input" class="col-xs-2 col-form-label">入学年份:</label>
 							 		<div class="col-xs-10">
    									<input class="form-control" type="month" id="byear" name="byear" placeholder="入学年份">
  									</div>
								</div>
                                <div class="form-group row">
  									<label for="example-text-input" class="col-xs-2 col-form-label">班级人数:</label>
 							 		<div class="col-xs-10">
    									<input class="form-control" type="text" id="bnumber" name="bnumber" placeholder="班级人数">
  									</div>
								</div>
                                <button type="submit" class="btn btn-success">添加</button>
                            </form>
      					</div>
    				</div>
  				</div>
  				<div class="card">
    				<div class="card-header" role="tab" id="headingTwo">
      					<h6 class="mb-0">
        				<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          				删除班级
        				</a>
      					</h6>
    				</div>
    				<div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
      					<div class="card-block">
        					<form action="bdel.asp" method="post">
                            	<div class="form-group row">
                            		<label for="exampleSelect2">班级编号:</label>
    								<div class="col-xs-10">
    									<input class="form-control" type="text" id="del_no" name="del_no">
  									</div>
                                </div>
                                <button type="submit" class="btn btn-danger">删除</button>
                            </form>
      					</div>
    				</div>
  				</div>
  				<div class="card">
   					<div class="card-header" role="tab" id="headingThree">
      					<h6 class="mb-0">
        				<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          				修改班级信息
        				</a>
      					</h6>
    				</div>
    				<div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
      					<div class="card-block">
        					<form action="bmod.asp" method="post">
                            	<div class="form-group row">
                            		<label for="exampleSelect2">班级编号:</label>
    								<div class="col-xs-10">
    									<input class="form-control" type="text" id="mod_no" name="mod_no">
  									</div>
                                </div>
                                <div class="form-group row">
                            		<label for="exampleSelect2">班级名称:</label>
    								<div class="col-xs-10">
    									<input class="form-control" type="text" id="mod_name" name="mod_name">
  									</div>
                                </div>
                                <div class="form-group row">
  									<label for="example-xx-input" class="col-xs-2 col-form-label">所属专业:</label>
  									<select class="form-control" id="mod_mar" name="mod_mar">
                                    	<%
											dim rec1 
								  			set rec1=conn.execute("select * from major")
								 			do while not rec1.eof
										%>
                               	 		<option ><%=rec1(1)%></option>
                                		<%
											rec1.movenext
											loop
										%>
    								</select>
								</div>
                                <div class="form-group row">
  									<label for="example-month-input" class="col-xs-2 col-form-label">入学年份:</label>
  									<div class="col-xs-10">
    									<input class="form-control" type="month" id="mod_year" name="mod_year">
  									</div>
								</div>
                                <div class="form-group row">
  									<label for="example-xx-input" class="col-xs-2 col-form-label">班级人数:</label>
  									<div class="col-xs-10">
    									<input class="form-control" type="text" id="mod_number" name="mod_number">
  									</div>
								</div>
                                <button type="submit" class="btn btn-info">修改</button>
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
