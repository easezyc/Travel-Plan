<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zyc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除管理员</title>
    
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <% ArrayList<Admin> commonadmin=(ArrayList<Admin>)request.getAttribute("commonadmin");
    ArrayList<Admin> supadmin=(ArrayList<Admin>)request.getAttribute("supadmin"); %>
    <style>
    	.table-container{
    	 min-height:600px;
    	}
    	.admin-title{
    	margin-top:80px;
    	margin-bottom:10px;
    	font-size:25px;
    	}
    </style>
  </head>
  
  <body>
    <div class="header"><jsp:include page="adminheader.jsp" flush="true"></jsp:include></div>
    <div class="container table-container">
    <div class="text-center admin-title">超级管理员</div>
    <table class="table table-striped table-hover">
    	<tr>
    		<td>管理员ID</td>
    	</tr>
    	<%
    		for(int i = 0;i < supadmin.size(); i ++){
    	 %>
    	<tr>
    		<td><% out.print(supadmin.get(i).getId()); %></td>
    	</tr>
    	
		<% } %>
	</table>
	<div class="text-center admin-title">普通管理员</div>
    <table class="table table-striped table-hover">
    	<tr>
    		<td>管理员ID</td>
    		<td>删除管理员</td>
    	</tr>
    	<%
    		for(int i = 0;i < commonadmin.size(); i ++){
    	 %>
    	<tr>
    		<td><% out.print(commonadmin.get(i).getId()); %></td>
    		<td><form action="/zyc/servlet/DeleteAdminServlet" method="post">
    		<input style="display:none" name="id" value="<%=commonadmin.get(i).getId() %>">
    		<button class="btn btn-default">删除管理员</button></form></td>
    	</tr>
    	
		<% } %>
	</table>
	</div>
    <div class="footer"><jsp:include page="../footer.jsp" flush="true"></jsp:include></div>
  </body>
</html>
