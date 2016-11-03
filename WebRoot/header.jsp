<%@ page import="com.zyc.entity.*" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<% User user=(User)session.getAttribute("user"); %>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/zyc/index.jsp">
                <img class="mini-logo" style="width:32px;height:32px;float:left;margin-top:-6px;" src="/zyc/images/logo.png">
                足迹
            </a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="nav-home"><a href="/zyc/index.jsp">主页</a></li>
                <li class="nav-travel"><a href="/zyc/servlet/ShowArticleListServlet">旅行足迹</a></li>
                <li class="nav-plan"><a href="/zyc//map/map.jsp">计划</a></li>
            </ul>
            <%if(user==null){ %>
            <ul class="nav-login nav navbar-nav navbar-right">
                <li><a href="/zyc/servlet/UserLoginServlet">登陆</a></li>
                <li><a href="/zyc/user/register.jsp">注册</a></li>
            </ul>
            <% }else{ %> 
            <ul class="nav-user nav navbar-nav navbar-right">
            	<li role="presentation" class="dropdown">
    				<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
     				<span id="user-name"><%= user.getName() %></span><span class="caret"></span>
    				</a>
    				<ul class="dropdown-menu">
    				<li><a href="/zyc/user/showinformation.jsp"><span id="user-information">个人中心</span></a></li>
    				<li><a href="/zyc/servlet/UserExitServlet"><span id="user-exit">注销</span></a></li>
    				</ul>
  				</li>
            </ul>
            <%} %>
        </div><!--/.nav-collapse -->
    </div>
</nav>

