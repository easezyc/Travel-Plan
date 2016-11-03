<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改密码</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zyc/css/adminmodpwd.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <script src="/zyc/js/adminmodpwd.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <div class="header"><jsp:include page="adminheader.jsp" flush="true"></jsp:include></div>
    <div class="container modpwd-container">
    	<div class="row check">
    	<div class="col-sm-8 col-sm-offset-2">
    		<div class="form-inline">
  				<div class="form-group">
    				<p class="form-control-static">输入当前密码</p>
  				</div>
  				<div class="form-group">
    				<input type="password" class="form-control" name="pwd" id="old-pwd">
  				</div>
  				<button type="submit" class="btn btn-default btn-check">确认</button>
			</div>
    	</div>
    	</div>
    	<div class="row mod">
    	<div class="col-sm-8 col-sm-offset-2">
    		<div class="form-inline">
  				<div class="form-group">
    				<p class="form-control-static">输入新密码</p>
  				</div>
  				<div class="form-group">
    				<input type="password" class="form-control" name="pwd" id="new-pwd">
  				</div>
  				<button type="submit" class="btn btn-default btn-mod">确认</button>
			</div>
    	</div>
    	</div>
    </div>
    <div class="footer"><jsp:include page="../footer.jsp" flush="true"></jsp:include></div>
  </body>
</html>
