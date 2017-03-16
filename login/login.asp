<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生选课和成绩管理系统</title>
<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="../css/login.css" type="text/css">
</head>

<body background="../images/bg_main.jpg">
	<div id="mid">
		<form method="post" action="solve_login.asp">
			<div>
        		<h3 align="center" style="color:#006">登录</h3>
        		<hr width="100%" noshade="noshade">
     		</div>
     		<div id="mid2">
         		<div class="form-group" id="mid_user">
            		<label for="formGroupExampleInput">账号</label>
            		<input type="text" class="form-control" id="input_user" name="input_user" placeholder="账号">
         		</div>
         		<div class="form-group" id="mid_pwd">
            		<label for="formGroupExampleInput2">密码</label>
            		<input type="password" class="form-control" id="input_pwd" name="input_pwd" placeholder="密码">
         		</div>
         		<div class="form-group" id="mid_shenfen">
          			<label for="disabledSelect">登录身份</label>
          			<select id="disabledSelect" name="disabledSelect" class="form-control">
            			<option>系统管理员</option>
            			<option>教务管理员</option>
            			<option>教师</option>
            			<option>学生</option>
          			</select>
         		</div>
                <div class="form-group" style="margin:10px">
         			<label>验证码</label>
					<img src="checkcode.asp" alt="验证码,看不清楚?请点击刷新验证码" height="10" style="cursor : pointer;" onClick="this.src='checkcode.asp?t='+(new Date().getTime());" style="margin-left:500px"> 
           			<input id="yzm" name="yzm" type="text" class="form-control">
         		</div>
         		<br />
        		<button type="submit" class="btn btn-primary" id="btn_login">登录</button>
        		<a href="javascript:getmail()" id="btn_forgetPwd">忘记密码</a>
     		</div>
		</form>
	</div>
    
  </div>
</div>
<script language="javascript" type="text/javascript">
	function getmail(){
			var userid=document.getElementById("input_user").value;
			if(userid.length>0){
					window.location.href="mail.asp?userid="+userid; 
				}
			else{
					alert("请先输入账号！");
				}
		}
</script>

</body>
</html>
