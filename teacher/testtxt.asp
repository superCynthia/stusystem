<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!--#include file="SundyUpload2.asp"-->
<!--#include file="conn.asp"-->

<%
	Function getemail(filepath)
		Set MyTextFile=MyFileObject.OpenTextFile(filepath)
		While not MyTextFile.AtEndOfStream
			txt=Trim(MyTextFile.ReadLine)
			result=split(txt,",")
			sql="insert into test(id,name) values('"&result(0)&"','"&result(1)&"')"
			conn.execute sql
			i=i+1
		Wend
		MyTextFile.Close
	End Function
%>

<%
'此例子文档编码都是UTF-8,如果是其他编码的系统，请将编码转换为相应的编码，不然表单获取数据可能会乱码
Dim objUpload,opt
Dim xmlPath
Dim fileFormName,objFile,counter
opt = request.QueryString("opt")
If opt = "Upload" Then
  	xmlPath = Server.MapPath(request.QueryString("xmlPath"))'将虚拟路径转换为实际路径
    Set objUpload=new SundyUpload '建立上传对象
    objUpload.UploadInit xmlPath,"GB2312"
    counter = 1
    For Each fileFormName In objUpload.objFile
      Set objFile=objUpload.objFile(fileFormName)
        fileSize = objFile.FileSize
	  strTemp= objFile.FilePath
	  'Response.Write strTemp
	  fileName = mid(strTemp,InStrRev(strTemp, "\")+1)
	  
	  set FSObject=Server.CreateObject("Scripting.FileSystemObject")
	  path=Server.MapPath(".") & "\upload\" & fileName
	  If fileSize > 0 Then
			response.write("<div class=""alert alert-info navbar-fixed-top"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button>上传成功！</div>")
            objFile.SaveAs Server.MapPath(".") & "\upload\" & fileName
		   
			Server.ScriptTimeOut = 9999
			 i=0
			'创建一个FileSystemObject对象的事例
			Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
			ctime=Timer
			response.Write path
			Call getEmail(path)
			'response.write "已经生成"&i&"条记录,用时"&(Timer-ctime)&"秒"
			 
			response.write("<div class=""alert alert-info navbar-fixed-top"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button>导入成功！</div>")
		  
	  end if
	  counter = counter + 1
    Next
    
End If
'为上载进度条数据文件（XML文件指定虚拟路径）
'最好是随机的，因为可能多个人同时上载，需要不同的进度数据
'这个路径需要在提交的时候传入上载组件中，以便在上载过程中更改进度数据
'客户端使用Javascript来读取此XML文件，显示进度
xmlPath = "upload/" & Timer & ".xml"
%>

<%
	username = Session("username")
	if username="" then 
		response.Redirect("../login/login.asp")
	end if
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-flex.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-reboot.css" />
<title>学生选课和成绩管理系统</title>
<script language="javascript">
function chkFrm(){
  var objFrm = document.frmUpload;
    if (objFrm.file1.value=="" && objFrm.file2.value==""){
      alert("请选择一个文件");
        objFrm.file1.focus();
        return false;
    }
    objFrm.action = "testtxt.asp?opt=Upload&xmlPath=<%=xmlPath%>";
    startProgress('<%=xmlPath%>');//启动进度条
    return true;
}
</script>
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
    							<input class="form-control" type="password" id="example-text-input">
  							</div>
						</div>
                        <div class="form-group row">
  							<label for="example-text-input" class="col-xs-2 col-form-label">新密码:</label>
 							 <div class="col-xs-10">
    							<input class="form-control" type="password" id="example-text-input">
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
                      学生成绩导入
                    </a>
                  </h5>
                </div>

                <div id="addStu" class="collapse in" role="tabpanel" aria-labelledby="headingOne">
                  <div class="card-block">
                   <!-- <form name="frmUpload" method="post" action="importScore.asp" enctype="multipart/form-data" onSubmit="return chkFrm()">
                    	<div class="form-group">
                            <label for="InputFile">选择文件</label>
                            <input type="file" class="form-control-file" id="InputFile" aria-describedby="fileHelp" name="file1">
                            <small id="fileHelp" class="form-text text-muted">请选择要导入的成绩文件</small>
                        </div>
                        
                        <button type="submit" class="btn btn-primary" style="margin-top:3rem" name="btnSubmit">上传</button>
                    </form>
                    <form name="frmUpload" method="post" action="importScore.asp" enctype="multipart/form-data" onSubmit="return chkFrm()">
                    	<button type="submit" class="btn btn-primary" style="margin-top:3rem" name="btnImport">导入</button>
                    </form>-->
                    
                    <form name="frmUpload" method="post" action="testtxt.asp" enctype="multipart/form-data" onSubmit="return chkFrm()">
                    	<div class="form-group">
                        	<label for="InputFile">选择文件</label></br></br>
                        	<input type="file" name="file1" size="40"></br>
                        	<small id="fileHelp" class="form-text text-muted">请选择要导入的成绩文件</small>
                        </div>
                        <input class="btn btn-primary" type="submit" name="btnSubmit" value="上传"/>
                    </form>
                    
                    <form name="frmImport" method="post" action="importScoreExcel.asp" enctype="multipart/form-data" onSubmit="return chkFrm()">
                        <input class="btn btn-primary" type="submit" name="btnImport" style="margin-top:2rem" value="导入"/>
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

