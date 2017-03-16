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
              <!--添加开课课程-->
              <div class="card">
                <div class="card-header" role="tab" id="headingOne">
                  <h5 class="mb-0">
                    <a data-toggle="collapse" data-parent="#accordion" href="#addOpenCourse" aria-expanded="true" aria-controls="addOpenCourse">
                      添加开课课程信息
                    </a>
                  </h5>
                </div>

                <div id="addOpenCourse" class="collapse in" role="tabpanel" aria-labelledby="headingOne">
                  <div class="card-block">
                    <form method="post" action="openCourseAdd.asp">
                        <div class="form-group row">
                          <label for="InputCno" class="col-sm-2 col-form-label">课程号</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="InputCno" placeholder="课程号" name="InputOpenCno">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="InputCsn" class="col-sm-2 col-form-label">课序号</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="InputCsn" placeholder="课序号" name="InputOpenCsn">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="InputName" class="col-sm-2 col-form-label">课程名</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="InputName" placeholder="课程名" name="InputOpenCourName">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="InputTeaName" class="col-sm-2 col-form-label">教师姓名</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="InputTeaName" placeholder="教师姓名" name="InputOpenCourTeaName">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          	 <div class="col-xs-2">
                              <label for="SelectRoom">上课教室</label>
                             </div>
                             <div class="col-xs-10">
                                   <div class="col-xs-6">
                                    <select class="form-control" id="SelectRoom" name="SelectOpenCourRoom">
                                      <option>商学院</option>
                                      <option>海洋学院</option>
                                      <option>电子楼</option>
                                      <option>文学楼</option>
                                      <option>网络楼</option>
                                      <option>图东教学楼</option>
                                      <option>图西教学楼</option>
                                    </select>
                               		</div>
                                    <div class="col-xs-6">
                                    <input type="text" class="form-control" id="InputRoomNo" placeholder="101" name="SelectOpenCourRoomNo">
                                 	</div>
                              </div>
                          </div>
                        <div class="form-group row">
                          	 <div class="col-xs-2">
                              <label for="SelectTime">上课时间</label>
                             </div>
                             <div class="col-xs-10">
                                 <div class="col-xs-6">
                                    <select class="form-control" id="SelectTime" name="SelectOpenCourWeekday">
                                      <option>星期一</option>
                                      <option>星期二</option>
                                      <option>星期三</option>
                                      <option>星期四</option>
                                      <option>星期五</option>
                                      <option>星期六</option>
                                   	</select>
                                 </div>
                                 <div class="col-xs-6">
                                    <select class="form-control" id="SelectTime" name="SelectOpenCourTime">
                                      <option>1-2节</option>
                                      <option>3-4节</option>
                                      <option>5-6节</option>
                                      <option>7-8节</option>
                                      <option>9-10节</option>
                                    </select>
                                 </div>
                              </div>
                          </div>
						<div class="form-group row">
                          	<div class="col-xs-2">
                                <label for="InputClass">开课班级</label>
                            </div>
                            <div class="col-xs-10">
                                 <div class="col-xs-6">
                                    <select class="form-control" id="SelectMajor" name="SelectOpenCourMajor">
                                      <%dim rec 
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
                                 <div class="col-xs-6">
                                    <select class="form-control" id="SelectTime" name="SelectOpenCourClass">
                                      <option>一班</option>
                                      <option>二班</option>
                                      <option>三班</option>
                                    </select>
                                 </div>
                              </div>
                          </div>  
                        <div class="form-group">
                          	<label>是否合班</label>
       					  </div>
                        <button type="button" class="btn btn-primary btn-lg btn-block" name="btn_heban" id="btn_heban">合班</button>
						<button type="button" class="btn btn-secondary btn-lg btn-block" name="btn_buheban" id="btn_buheban">不合班</button>
                          <!--合班-->
                          <label style="margin-left:3rem; margin-top:1rem">如果合班请填写:</label>
                          <small style="margin-left:3rem" class="form-text text-muted">最多可合并三个班</small>
                          <div class="card" style="margin-left:3rem; margin-top:1rem">
                               <div class="form-group row"  style="margin-left:1rem; margin-top:1rem">
                                        <div class="col-xs-2">
                                            <label for="InputClass">开课班级</label>
                                        </div>
                                        <div class="col-xs-10">
                                             <div class="col-xs-6">
                                                <select class="form-control" id="SelectTime" name="SelectOpenCourMajor2">
                                                  <option></option>
                                                  <%dim rec2 
													set rec2=conn.execute("select * from major")
													do while not rec2.eof
												  %>
														<option ><%=rec2(1)%></option>
												  <%
													rec2.movenext
													loop
												  %>
                                                </select>
                                             </div>
                                             <div class="col-xs-6">
                                                <select class="form-control" id="SelectTime" name="SelectOpenCourClass2">
                                                  <option></option>
                                                  <option>一班</option>
                                                  <option>二班</option>
                                                  <option>三班</option>
                                                </select>
                                             </div>
                                         </div>
                             		 </div>  
                               <div class="form-group row"  style="margin-left:1rem; margin-top:1rem">
                                        <div class="col-xs-2">
                                            <label for="InputClass">开课班级</label>
                                        </div>
                                        <div class="col-xs-10">
                                             <div class="col-xs-6">
                                                <select class="form-control" id="SelectTime" name="SelectOpenCourMajor3">
                                                  <option></option>
                                                  <%dim rec3 
													set rec3=conn.execute("select * from major")
													do while not rec3.eof
												  %>
														<option ><%=rec3(1)%></option>
												  <%
													rec3.movenext
													loop
												  %>
                                                </select>
                                             </div>
                                             <div class="col-xs-6">
                                                <select class="form-control" id="SelectTime" name="SelectOpenCourClass3">
                                                  <option></option>
                                                  <option>一班</option>
                                                  <option>二班</option>
                                                  <option>三班</option>
                                                </select>
                                             </div>
                                         </div>
                             		 </div>  
                          </div>    
                          
                          <div class="form-group row">
                              <label for="example-number-input" class="col-xs-2 col-form-label">开课容量</label>
                              <div class="col-xs-10">
                                <input class="form-control" type="number" value="100" id="inputNum" name="InputOpenCourseNumber">
                              </div>
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
              
              <!--修改课程-->
              <div class="card">
                <div class="card-header" role="tab" id="headingTwo">
                  <h5 class="mb-0">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#motifyOpenCour" aria-expanded="false" aria-controls="motifyOpenCour">
                      修改开课课程信息
                    </a>
                  </h5>
                </div>
                <div id="motifyOpenCour" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
                  <div class="card-block">
                  	 <form action="openCourseMotify.asp" method="post">
                        <div class="form-group row">
                          <label for="InputCno" class="col-sm-2 col-form-label">课程号</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="InputCno" placeholder="课程号" name="InputOpenCno2">
                            <small id="fileHelp" class="form-text text-muted">课程号不可修改</small>
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="InputCsn" class="col-sm-2 col-form-label">课序号</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="InputCsn" placeholder="课序号" name="InputOpenCsn2">
                            <small id="fileHelp" class="form-text text-muted">课序号不可修改</small>
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="InputName" class="col-sm-2 col-form-label">课程名</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="InputName" placeholder="课程名" name="InputOpenCourName2">
                            <small id="fileHelp" class="form-text text-muted">课程名不可修改</small>
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="InputTeaName" class="col-sm-2 col-form-label">教师姓名</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="InputTeaName" placeholder="教师姓名" name="InputOpenCourTeaName2">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          	 <div class="col-xs-2">
                              <label for="SelectTime">上课教室</label>
                             </div>
                             <div class="col-xs-10">
                                   <div class="col-xs-6">
                                    <select class="form-control" id="SelectRoom" name="SelectOpenCourRoom2">
                                      <option></option>
                                      <option>商学院</option>
                                      <option>海洋学院</option>
                                      <option>电子楼</option>
                                      <option>文学楼</option>
                                      <option>网络楼</option>
                                      <option>图东教学楼</option>
                                      <option>图西教学楼</option>
                                    </select>
                               		</div>
                                    <div class="col-xs-6">
                                    <input type="text" class="form-control" id="InputRoomNo" placeholder="101" name="SelectOpenCourRoomNo2">
                                 </div>
                              </div>
                          </div>
                         <div class="form-group row">
                          	 <div class="col-xs-2">
                              <label for="SelectTime">上课时间</label>
                             </div>
                             <div class="col-xs-10">
                                 <div class="col-xs-6">
                                    <select class="form-control" id="SelectTime" name="SelectOpenCourWeekday2">
                                      <option></option>
                                      <option>星期一</option>
                                      <option>星期二</option>
                                      <option>星期三</option>
                                      <option>星期四</option>
                                      <option>星期五</option>
                                      <option>星期六</option>
                                   	</select>
                                 </div>
                                 <div class="col-xs-6">
                                    <select class="form-control" id="SelectTime" name="SelectOpenCourTime2">
                                      <option></option>
                                      <option>1-2节</option>
                                      <option>3-4节</option>
                                      <option>5-6节</option>
                                      <option>7-8节</option>
                                      <option>9-10节</option>
                                    </select>
                                 </div>
                              </div>
                          </div>
						  <div class="form-group row">
                          	<div class="col-xs-2">
                                <label for="InputClass">开课班级</label>
                            </div>
                            <div class="col-xs-10">
                                 <div class="col-xs-6">
                                    <select class="form-control" id="SelectTime" name="SelectOpenCourMajor4">
                                      <option></option>
                                      <%dim rec4 
										set rec4=conn.execute("select * from major")
										do while not rec4.eof
									  %>
											<option ><%=rec4(1)%></option>
									  <%
										rec4.movenext
										loop
									  %>
                                   	</select>
                                 </div>
                                 <div class="col-xs-6">
                                    <select class="form-control" id="SelectTime" name="SelectOpenCourClass4">
                                      <option></option>
                                      <option>一班</option>
                                      <option>二班</option>
                                      <option>三班</option>
                                    </select>
                                 </div>
                              </div>
                          </div>  
                          <div class="form-group">
                          	<label>是否合班</label>
       					  </div>
                          <button type="button" class="btn btn-primary btn-lg btn-block" name="btn_heban" id="btn_heban">合班</button>
<button type="button" class="btn btn-secondary btn-lg btn-block" name="btn_buheban" id="btn_buheban">不合班</button>
                          <!--合班-->
                          <label style="margin-left:3rem; margin-top:1rem">如果合班请填写:</label>
                          <small style="margin-left:3rem" class="form-text text-muted">最多可合并三个班</small>
                          <div class="card" style="margin-left:3rem; margin-top:1rem">
                              <div class="form-group row"  style="margin-left:1rem; margin-top:1rem">
                                        <div class="col-xs-2">
                                            <label for="InputClass">开课班级</label>
                                        </div>
                                        <div class="col-xs-10">
                                             <div class="col-xs-6">
                                                <select class="form-control" id="SelectTime" name="SelectOpenCourMajor5">
                                                  <option></option>
                                                  <%dim rec5
													set rec5=conn.execute("select * from major")
													do while not rec5.eof
												  %>
														<option ><%=rec5(1)%></option>
												  <%
													rec5.movenext
													loop
												  %>
                                                </select>
                                             </div>
                                             <div class="col-xs-6">
                                                <select class="form-control" id="SelectTime" name="SelectOpenCourClass5">
                                                  <option></option>
                                                  <option>一班</option>
                                                  <option>二班</option>
                                                  <option>三班</option>
                                                </select>
                                             </div>
                                         </div>
                             		 </div>  
                                     <div class="form-group row"  style="margin-left:1rem; margin-top:1rem">
                                        <div class="col-xs-2">
                                            <label for="InputClass">开课班级</label>
                                        </div>
                                        <div class="col-xs-10">
                                             <div class="col-xs-6">
                                                <select class="form-control" id="SelectTime" name="SelectOpenCourMajor6">
                                                  <option></option>
                                                  <%dim rec6
													set rec6=conn.execute("select * from major")
													do while not rec6.eof
												  %>
														<option ><%=rec6(1)%></option>
												  <%
													rec6.movenext
													loop
												  %>
                                                </select>
                                             </div>
                                             <div class="col-xs-6">
                                                <select class="form-control" id="SelectTime" name="SelectOpenCourClass6">
                                                  <option></option>
                                                  <option>一班</option>
                                                  <option>二班</option>
                                                  <option>三班</option>
                                                </select>
                                             </div>
                                         </div>
                             		 </div>  
                          </div>    
                          
                          <div class="form-group row">
                              <label for="example-number-input" class="col-xs-2 col-form-label">开课容量</label>
                              <div class="col-xs-10">
                                <input class="form-control" type="number" value="100" id="inputNum" name="SelectOpenCourseNumber2">
                              </div>
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
              
              <!--删除课程-->
              <div class="card">
                <div class="card-header" role="tab" id="headingThree">
                  <h5 class="mb-0">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#DeleteOpenCourse" aria-expanded="false" aria-controls="DeleteOpenCourse">
                      删除开课课程信息
                    </a>
                  </h5>
                </div>
                <div id="DeleteOpenCourse" class="collapse" role="tabpanel" aria-labelledby="headingThree">
                  <div class="card-block">
                    <form action="openCourseDelete.asp" method="post">
                     	<div class="form-group">
                          <label for="InputCno">请输入要删除的课程号</label>
                          <input type="text" class="form-control" id="InputCno" name="InputOpenCno_delete">
                          
                          <label for="InputCno">请输入要删除的课序号</label>
                          <input type="text" class="form-control" id="InputCno" name="InputOpenCsn_delete">
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
