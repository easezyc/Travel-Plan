<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zyc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% Admin admin=(Admin)session.getAttribute("admin"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台主页</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <style>
    	a{
    		text-decoration:none;
    		color:black;
    	}
    </style>
  </head>
  
  <body>
    <div class="header"><jsp:include page="adminheader.jsp" flush="true"></jsp:include></div>
    <div class="container" style="margin-top:100px;">
    	<div class="row">
    		<div class="col-md-4 col-sm-6 col-xs-12">
    			<a href="#"><button type="submit" class="btn btn-default">删除用户</button></a>
    		</div>
    		<%if(admin.getSup()==1){ %><div class="col-md-4 col-sm-6 col-xs-12">
    			<a href="/zyc/admin/addadmin.jsp"><button type="submit" class="btn btn-default">添加管理员</button></a>
    		</div>
    		<div class="col-md-4 col-sm-6 col-xs-12">
    			<a href="#"><button type="submit" class="btn btn-default">修改管理员权限</button></a>
    		</div><%} %>
    	</div>
    </div>
  </body>
</html>
