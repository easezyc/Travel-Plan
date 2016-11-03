<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zyc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Page pagehelp=(Page)request.getAttribute("pagehelp");
ArrayList<Footarticle> list=pagehelp.getList();
String search=(String)request.getAttribute("search");
if(search==null||search==""){
	search="";
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>旅行足迹</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
                $(".nav-travel").addClass("active");
                $(".create").click(function(){
                	<% User user=(User)session.getAttribute("user");
                	if(user!=null){ %>
                		window.location="/zyc/footmark/createfoot.jsp";
                	<% }else {%>
                		alert("请先登录");
                	<% } %>
                });
        });
    </script>
    <style>
    .search-title{
    	font-size:40px;
    	font-weight:bolder;
    	color:black;
    	margin-bottom:50px;
    }
        .carousel .item img{
            width:100%;
            height:auto;
            position:relative;
        }
        .search{
            position:absolute;
            width:60%;
            left:20%;
            bottom:20%;
        }
        .search img{
            width:60%;
            margin-left:20%;
        }
        .showlist{
            margin-top:30px;
        }
        .search-hide{
            width:100%;
            display:none;
        }
        @media screen and (max-width : 768px) {
            .search{
                display:none;
            }
            .search-hide{
                display:block;
            }
        }
        .create{
        	font-size:20px;
        	color:yellow;
        	border:2px solid yellow;
        	max-width:200px;
        	margin-top:20px;
        }
        .create:hover{
        	background-color: rgba(96,96,96,0.6);
        }
        .showlist img{
        	height:200px;
        	width:100%;
        }
    </style>
</head>
<body>
<div class="header"><jsp:include page="../header.jsp" flush="true"></jsp:include></div>
<div id="carousel-home" class="carousel slide" data-ride="carousel" data-pause="none" style="position:relative;">
    <!-- Indicators -->
    <ol class="carousel-indicators" style="bottom:0;">
        <li data-target="#carousel-home" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-home" data-slide-to="1"></li>
        <li data-target="#carousel-home" data-slide-to="2"></li>
        <li data-target="#carousel-home" data-slide-to="3"></li>
        <li data-target="#carousel-home" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="/zyc/images/carousel1.jpg" alt="">
            <div class="carousel-caption">
                <h3></h3>
            </div>
        </div>
        <div class="item">
            <img src="/zyc/images/carousel2.jpg" alt="">
            <div class="carousel-caption">
                <h3></h3>
            </div>
        </div>
        <div class="item">
            <img src="/zyc/images/carousel3.jpg" alt="">
            <div class="carousel-caption">
                <h3></h3>
            </div>
        </div>
        <div class="item">
            <img src="/zyc/images/carousel4.jpg" alt="">
            <div class="carousel-caption">
                <h3></h3>
            </div>
        </div>
        <div class="item">
            <img src="/zyc/images/carousel5.jpg" alt="">
            <div class="carousel-caption">
                <h3></h3>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-home" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-home" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
    <div class="search">
        <div class="search-title text-center">搜索城市</div>
        <form method="get" action="/zyc/servlet/ShowArticleListServlet">
            <div class="input-group">
                <input class="form-control input-lg" type="text" name="search" placeholder="搜索足迹">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default btn-lg" aria-label="search">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                </span>
            </div>
        </form>
        <div class="create text-center center-block">
        	创建自己的足迹
    	</div>
    </div>
</div>
<div class="search-hide">
    <div class="search-title text-center">搜索城市</div>
    <form method="get" action="/zyc/servlet/ShowArticleListServlet">
        <div class="input-group">
            <input class="form-control input-lg" type="text" name="search" placeholder="搜索足迹">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default btn-lg" aria-label="search">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                </span>
        </div>
    </form>
    <div class="create text-center center-block">
                             创建自己的足迹
    </div>
</div>
<div class="container showlist">
    <div class="row">
    	<%
    		for(int i = 0;i < list.size(); i ++){
    	 %>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail text-center">
                <img src="<%=list.get(i).getImg() %>" class="img-rounded" alt="...">
                <div class="caption">
                 	<h3><%=list.get(i).getTitle() %></h3>
                    <h4><%=list.get(i).getCity() %></h4>
                    <p>作者：<%=list.get(i).getCreatername() %></p>
                    <p><a href="/zyc/servlet/ShowArticleServlet?id=<%=list.get(i).getArticleid() %>" class="btn btn-default" role="button">查看</a></p>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
<%@ include  file="pagehelp.jsp" %>
<div class="footer"><jsp:include page="../footer.jsp" flush="true"></jsp:include></div>
</body>
</html>