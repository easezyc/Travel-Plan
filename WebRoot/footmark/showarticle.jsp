<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zyc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Footarticle article=(Footarticle)request.getAttribute("article");
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
    <script src="/zyc/js/bootstrap.min.js"></script>
	<style>
		.article-container{
			margin-top:100px;
			min-height:500px;
		}
		.article-title{
			font-size:30px;
			font-weight:bold;
		}
		.remark div{
			font-size:20px;
		}
		.remark a{
			font-size:15px;
		}
		.content{
			font-size:15px;
		}
		.articleid{
			display:inline;
		}
	</style>
  </head>
  
  <body>
  <div class="header"><jsp:include page="../header.jsp" flush="true"></jsp:include></div>
    <div class="container article-container">
    	<div class="row text-center article-title">
    		<p><%=article.getTitle() %></p>
    	</div>
    	<div class="row text-center remark">
    		<div class="creater">创建者：<%=article.getCreatername() %></div>
    		<div><div class="articleid">文章ID：<%=article.getArticleid() %></div><a href="/zyc/servlet/ShowArticleImgServlet?id=<%=article.getArticleid() %>">查看文章相册</a></div>    		
    		<div class="city">城市：<%=article.getCity() %></div>
    	</div>
    	<div class="row">
    		<div class="content"><%=article.getContent() %></div>
    	</div>
    </div>
    <div class="footer"><jsp:include page="../footer.jsp" flush="true"></jsp:include></div>
  </body>
</html>
