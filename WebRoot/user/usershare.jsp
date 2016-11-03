<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zyc.entity.*" %>
<% User user=(User)session.getAttribute("user"); %>
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
    <title>个人资料</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zyc/css/personal.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <script src="/zyc/js/personal.js"></script>
  </head>
  
  <body>
    <div class="header"><jsp:include page="../header.jsp" flush="true"></jsp:include></div>
	<div class="container content-container">
    	<div class="row user">
        	<div class="col-md-2 col-sm-3 col-xs-4">
            	<img class="img-thumbnail img-responsive" src="<%=user.getImage() %>" />
        	</div>
        	<div class="col-sm-10 col-sm-9 col-xs-8 clearfix">
            	<div class="pull-left"><%=user.getName() %></div>
        	</div>
    	</div>
    <br>
    	<div class="row">
       	 	<div class="col-md-3 col-sm-4 col-xs-12 nav-left text-center">
            	<div class="col-sm-12 col-xs-4 user-title" id="information">个人资料</div>
            	<div class="col-sm-12 col-xs-4 user-title active" id="share">个人分享</div>
            	<div class="col-sm-12 col-xs-4 user-title" id="plan">个人计划</div>
        	</div>
        	<br>
        	<div class="col-md-9 col-sm-8 col-xs-12">
        		<div class="user_share">
        			这是用户分享
        		</div>
        	</div>
        </div>
     </div>
<div class="footer"><jsp:include page="../footer.jsp" flush="true"></jsp:include></div>
  </body>
</html>
