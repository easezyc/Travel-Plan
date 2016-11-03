<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zyc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员登录</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zyc/css/login.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <script src="/zyc/js/adminlogin.js"></script>
    <% Admin admin=(Admin)session.getAttribute("admin"); %>
    
    <script>
    	$(document).ready(function(){
    		<%if(admin!=null){ %>
    		window.location="/zyc/admin/adminindex.jsp";<% } %>
    	});
    </script>
    
</head>
<body>
<div class="header"><jsp:include page="../header.jsp" flush="true"></jsp:include></div>
<div class="background-container">
    <img id="background" src="/zyc/images/adminbackground.jpg" />
    <div class="container login-container">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="login-windows">
                    <form method="post" action="/zyc/servlet/AdminLoginServlet">
                    	<div class="text-center" style="font-size:20px;font-weight:bold;">管理员登录</div>
                        	<div class="form-group">
                        	<div class="row">
                                <div class="col-xs-10 col-xs-offset-2">
                                    <input class="form-control" id="op" name="op" value="login" type="text" style="display:none"/>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-2 col-xs-12"><label for="userid">账号</label></div>
                                <div class="col-sm-10 col-xs-12">
                                    <input class="form-control" id="adminid" name="adminid" placeholder="账号" type="text"/>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-2 col-xs-12"><label for="pwd">密码</label></div>
                                <div class="col-sm-10 col-xs-12">
                                    <input class="form-control" id="pwd" name="pwd" placeholder="密码" type="password"/>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-default btn-login">登录</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer"><jsp:include page="../footer.jsp" flush="true"></jsp:include></div>

</body>
</html>
