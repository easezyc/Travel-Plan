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
    <meta chaset="UTF-8">
    <title>删除用户</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <script src="/zyc/js/pagehelp.js"></script>
    <% Page pagehelp=(Page)request.getAttribute("userlist");
    ArrayList<User> array=pagehelp.getList(); %>
    <style>
    	.table-container{
    	 min-height:600px;
    	 margin-top:80px;
    	}
    </style>
    <script src="/zyc/js/pagehelp.js"></script>
  </head>
  
  <body>
    <div class="header"><jsp:include page="adminheader.jsp" flush="true"></jsp:include></div>
    <div class="container table-container">
    <div class="row">
    	<div class="col-sm-6 col-sm-offset-6">
    		<form class="form-inline" method="post" action="/zyc/servlet/DeleteUserServlet">
    			<input type="hidden" name="op" value="query">
    			<input type="hidden" name="currentpage" value="<%=pagehelp.getCurrentpage() %>">
  				<div class="form-group">
    				<p class="form-control-static">搜索用户ID或者手机号</p>
  				</div>
  				<div class="form-group">
    				<input type="text" class="form-control" name="id">
  				</div>
  				<button type="submit" class="btn btn-default">确认</button>
			</form>
    	</div>
    </div>
    <table class="table table-striped table-hover">
    	<tr>
    		<td>用户头像</td>
    		<td>用户ID</td>
    		<td>用户名</td>
    		<td>手机号</td>
    		<td>删除</td>
    	</tr>
    	<%
    		for(int i = 0;i < array.size(); i ++){
    	 %>
    	<tr>
    		<td><img src="<%=array.get(i).getImage() %>" style="height:auto;width:40px;"/></td>
    		<td><% out.print(array.get(i).getId()); %></td>
    		<td><% out.print(array.get(i).getName()); %></td>
    		<td><% out.print(array.get(i).getPhone()); %></td>
    		<td><form action="/zyc/servlet/DeleteUserServlet" method="post">
    		<input type="hidden" name="op" value="delete">
    		<input type="hidden" name="id" value="<%=array.get(i).getId() %>">
    		<input type="hidden" name="currentpage" value="<%=pagehelp.getCurrentpage() %>">
    		<button class="btn btn-default">删除用户</button></form></td>
    	</tr>
    	
		<% } %>
	</table>
	</div>
	<%@ include  file="pagehelp.jsp" %>
    <div class="footer"><jsp:include page="../footer.jsp" flush="true"></jsp:include></div>
  </body>
</html>
