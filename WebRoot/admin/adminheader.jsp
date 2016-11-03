<%@ page import="com.zyc.entity.*" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<% Admin admin=(Admin)session.getAttribute("admin"); %>
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
            	<li class="nav-home"><a href="/zyc/index.jsp">返回前台</a></li>
                <li class="nav-home"><a href="/zyc/admin/adminindex.jsp">后台主页</a></li>
                <li class="nav-travel"><a href="/zyc/servlet/DeleteUserServlet">删除用户</a></li>
                <%if(admin.getSup()==1){ %>
                <li role="presentation" class="dropdown">
    				<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
     				<span id="user-name">管理员管理</span><span class="caret"></span>
    				</a>			
    				<ul class="dropdown-menu">
    				<li class="nav-plan"><a href="/zyc/admin/addadmin.jsp">添加管理员</a></li>
                	<li class="nav-plan"><a href="/zyc/servlet/ChangeAdminServlet">添加超级管理员</a></li>
                	<li class="nav-plan"><a href="/zyc/servlet/DeleteAdminServlet">删除管理员</a></li>
                	<li class="nav-plan"><a href="/zyc/admin/modpwd.jsp">修改密码</a></li>
    				</ul>
  				</li>
  				<%} %>
            </ul>
            <ul class="nav-user nav navbar-nav navbar-right">
            	<li role="presentation" class="dropdown">
    				<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
     				<span id="user-name"><%= admin.getId() %></span><span class="caret"></span>
    				</a>			
    				<ul class="dropdown-menu">
    				<li><a href="/zyc/servlet/UserExitServlet"><span id="user-exit">注销</span></a></li>
    				</ul>
  				</li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

