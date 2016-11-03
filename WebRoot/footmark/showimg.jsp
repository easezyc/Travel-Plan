<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zyc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Page pagehelp=(Page)request.getAttribute("pagehelp");
ArrayList<Photos> list=pagehelp.getList();
String id=(String)request.getAttribute("id");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>旅行足迹</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>>
	<style>
		.thumbnail img{
			height:200px;
		}
	</style>
  </head>
  
  <body>
  	<div class="header"><jsp:include page="../header.jsp" flush="true"></jsp:include></div>
  	<div class="container" style="margin-top:100px;min-height:500px;">
  		<div class="row">
  		<%
    		for(int i = 0;i < list.size(); i ++){
    	 %>
  			<div class="col-sm-3 col-xs-2  thumbnail">
  				<img src="<%=list.get(i).getUrl() %>">
  			</div>
  		<%} %>
  		</div>
  	</div>
  	<%@ include  file="imgpagehelp.jsp" %>
    <div class="footer"><jsp:include page="../footer.jsp" flush="true"></jsp:include></div>
  </body>
</html>
