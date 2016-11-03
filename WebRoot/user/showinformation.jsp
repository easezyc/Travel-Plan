<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zyc.entity.*" %>
<% User user=(User)session.getAttribute("user"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人资料</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zyc/css/personal.css" rel="stylesheet">
    <link href="/zyc/css/showinformation.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <script src="/zyc/js/personal.js"></script>
    <script src="/zyc/js/showinformation.js"></script>
    <script>
    	$(document).ready(function(){   
            $("#btn-other").click(function(){
            	if($("#phone").val()==<%=user.getPhone() %>){
            		$(".user-phone").removeClass("show");
            		$(".user-phone").addClass("hide");
            		$(".user-information").addClass("show");
            	}
            	else{
            		alert("手机号输入错误");
            	}
            });
            $("#btn-pwd").click(function(){
            	if($("#phone").val()==<%=user.getPhone() %>){
            		$(".user-pwd").addClass("show");
            		$(".user-phone").removeClass("show");
            		$(".user-phone").addClass("hide");
            	}
            	else{
            		alert("手机号输入错误");
            	}
            });
            $("#btn-img").click(function(){
            	if($("#phone").val()==<%=user.getPhone() %>){
            		$(".user-image").addClass("show");
            		$(".user-phone").removeClass("show");
            		$(".user-phone").addClass("hide");
            	}
            	else{
            		alert("手机号输入错误");
            	}
            });
            
        });
    </script>
</head>
<body>

<div class="container content-container">
<div class="header"><jsp:include page="../header.jsp" flush="true"></jsp:include></div>
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
            <div class="col-sm-12 col-xs-4 user-title active" id="information">个人资料</div>
            <div class="col-sm-12 col-xs-4 user-title" id="share">个人分享</div>
            <div class="col-sm-12 col-xs-4 user-title" id="plan">个人计划</div>
        </div>
        <br>
        <div class="col-md-9 col-sm-8 col-xs-12">
            <div class="user_information">
                <div class="user-show row">
                    <div class="userid">账号:<span id="userid"><%=user.getId() %></span></div>
                    <br>
                    <div class="username">昵称:<span id="username"><%=user.getName() %></span></div>
                    <br>
                    <div class="col-sm-3 col-xs-4">
                        <button class="btn btn-default center-block mod-information">修改资料</button>
                    </div>
                    <div class="col-sm-3 col-xs-4">
                        <button class="btn btn-default center-block mod-pwd">修改密码</button>
                    </div>
                    <div class="col-sm-3 col-xs-4">
                        <button class="btn btn-default center-block mod-image">修改头像</button>
                    </div>
                </div>
                <div class="user-phone hide">
                    <div class="mod-user">
                        <div class="row">
                            <div class="col-md-1 col-sm-2 col-xs-3">手机号</div>
                            <div class="col-sm-6 col-md-4 col-xs-9">
                                <input type="text" class="form-control" id="phone" />
                            </div>
                        </div>
                        <br>
                    </div>
                    <div class="row btn-ok">
                        <div class="col-sm-6 col-xs-12">
                            <button class="btn btn-default center-block" id="btn-pwd">确认</button>
                        </div>
                    </div>
                    <div class="row btn-ok">
                        <div class="col-sm-6 col-xs-12">
                            <button class="btn btn-default center-block" id="btn-other">确认</button>
                        </div>
                    </div>
                    <br>
                    <div class="row btn-ok">
                        <div class="col-sm-6 col-xs-12">
                            <button class="btn btn-default center-block" id="btn-img">确认</button>
                        </div>
                    </div>
                </div>
                <div class="user-pwd hide">
                    <div class="row">
                        <div class="col-md-2 col-sm-4 col-xs-3">密码</div>
                        <div class="col-sm-6 col-md-4 col-xs-7">
                            <input type="password" class="form-control" id="pwd" />
                        </div>
                        <div class="col-md-3 col-xs-2 " id="pwd-warning"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-2 col-sm-4 col-xs-3">再次输入密码</div>
                        <div class="col-sm-6 col-md-4 col-xs-9">
                            <input type="password" class="form-control" id="pwdcheck" />
                        </div>
                        <div class="col-md-3 col-xs-2 " id="pwdcheck-warning"></div>
                    </div>
                    <br>
                    <div class="row btn-ok">
                        <div class="col-sm-6 col-xs-12">
                            <button class="btn btn-default center-block" id="pwd-ok">确认</button>
                        </div>
                    </div>
                </div>
                <div class="user-information hide">
                    <div class="row">
                        <div class="col-md-2 col-sm-4 col-xs-3">输入昵称</div>
                        <div class="col-sm-6 col-md-4 col-xs-9">
                            <input type="password" class="form-control" id="newname" />
                        </div>
                        <div class="col-md-3 col-xs-2 " id="newname-warning"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-2 col-sm-4 col-xs-3">输入新的手机号</div>
                        <div class="col-sm-6 col-md-4 col-xs-9">
                            <input type="password" class="form-control" id="newphone" />
                        </div>
                        <div class="col-md-3 col-xs-2 " id="newphone-warning"></div>
                    </div>
                    <br>
                    <div class="row btn-ok">
                        <div class="col-sm-6 col-xs-12">
                            <button class="btn btn-default center-block" id="information-ok">确认</button>
                        </div>
                    </div>
                </div>
                <div class="user-image hide">
                    <form name="form" method="post" enctype="multipart/form-data" action="/zyc/servlet/UserModServlet">
        				<div class="row">
                        	<div class="col-md-2 col-sm-4 col-xs-3">选择图片</div>
                        	<div class="col-sm-6 col-md-4 col-xs-9">
                            	<input type="file" name="file1" id="file"/>
                        	</div>
                        <div class="col-md-3 col-xs-2 " id="newimage-warning"></div>
                    	</div>
                    	<br>
        				<div class="row btn-ok">
                        	<div class="col-sm-6 col-xs-12">
                            <button class="btn btn-default center-block" id="img-ok">确认</button>
                        	</div>
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
