<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>登录</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zyc/css/register.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>

</head>
<body>
<div class="header"><jsp:include page="../header.jsp" flush="true"></jsp:include></div>
<div class="background-container">
    <img id="background" src="/zyc/images/userbackground.jpg" />
    <div class="container register-container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="register-windows">
                    <form method="post" action="/zyc/servlet/UserRegisterServlet">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-10 col-xs-offset-2">
                                    <input class="form-control" id="op" name="op" value="register" type="text" style="display:none"/>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-2 col-xs-12 clear-fix"><label class="pull-left">账号</label><span class="userid-warning smallwarning pull-right"></span></div>
                                <div class="col-sm-8 col-xs-12">
                                    <input class="form-control" id="userid" name="userid" placeholder="账号" type="text"/>
                                </div>
                                <div class="col-sm-2 userid-warning bigwarning"></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-2 col-xs-12 clear-fix"><label class="pull-left">用户名</label><span class="username-warning smallwarning pull-right"></span></div>
                                <div class="col-sm-8 col-xs-12">
                                    <input class="form-control" id="username" name="username" placeholder="昵称" type="text"/>
                                </div>
                                <div class="col-sm-2 username-warning bigwarning"></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-2 col-xs-12 clear-fix"><label class="pull-left">密码</label><span class="pull-right pwd-warning smallwarning"></span></div>
                                <div class="col-sm-8 col-xs-12">
                                    <input class="form-control" id="pwd" name="pwd" placeholder="密码" type="password"/>
                                </div>
                                <div class="col-sm-2 pwd-warning bigwarning"></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-2 col-xs-12 clear-fix"><label class="pull-left">再次输入密码</label><span class="pull-right pwdcheck-warning smallwarning"></span></div>
                                <div class="col-sm-8 col-xs-12">
                                    <input class="form-control" id="pwdcheck" name="pwdcheck" placeholder="再次输入密码" type="password"/>
                                </div>
                                <div class="col-sm-2 pwdcheck-warning bigwarning"></div>
                            </div>
                            <br>
                            <div class="row">
                            <div class="col-sm-2 col-xs-12 clear-fix"><label class="pull-left">手机号</label><span class="pull-right phone-warning smallwarning"></span></div>
                            <div class="col-sm-8 col-xs-12">
                                <input class="form-control" id="phone" name="phone" placeholder="输入手机号" type="text"/>
                            </div>
                            <div class="col-sm-2 phone-warning bigwarning"></div>
                            </div>
                            <br>
                        </div>
                        <div class="text-center">
                            <button type="submit"	 class="btn btn-default">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer"><jsp:include page="../footer.jsp" flush="true"></jsp:include></div>
<script src="/zyc/js/register.js"></script>
</body>
</html>
