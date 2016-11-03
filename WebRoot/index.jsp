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
    <title>主页</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zyc/css/index.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <script src="/zyc/js/vue.min.js"></script>
    <script src="/zyc/js/index.js"></script>

</head>
<body>
<div class="header"><jsp:include page="header.jsp" flush="true"></jsp:include></div>
<div id="carousel-home" class="carousel slide" data-interval="2000" data-pause="none" data-ride="carousel" style="position:relative;">
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
    <div class="container picshow">
        <div class="row">
            <div class="col-sm-4">
                <div class="img-container center-block">
                    <a href="#">
                        <img class="img-rounded" src="/zyc/images/index_href1.jpg" alt="">
                        <div class="img-cover">
                        </div>
                        <div class="text-cover">
                            <div class="title">旅行足迹</div>
                            <div class="introduction">查看旅行足迹</div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="img-container center-block">
                    <a href="#">
                        <img class="img-rounded" src="/zyc/images/index_href2.jpg" alt="">
                        <div class="img-cover">
                        </div>
                        <div class="text-cover">
                            <div class="title">计划</div>
                            <div class="introduction">查看旅行计划</div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="img-container center-block">
                    <a href="#">
                        <img class="img-rounded" src="/zyc/images/index_href3.jpg" alt="">
                        <div class="img-cover">
                        </div>
                        <div class="text-cover">
                            <div class="title">标记</div>
                            <div class="introduction">标记你想去的地方</div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container picno">
    <div class="row">
        <div class="col-sm-4 text-center">
            <div class="img-container center-block">
                <a href="#">
                    <img class="img-rounded" src="/zyc/images/index_href1.jpg" alt="">
                    <div class="img-cover">
                    </div>
                    <div class="text-cover">
                        <div class="title">xizang</div>
                        <div class="introduction">dasdqw</div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-sm-4 text-center">
            <div class="img-container center-block">
                <a href="#">
                    <img class="img-rounded" src="/zyc/images/index_href2.jpg" alt="">
                    <div class="img-cover">
                    </div>
                    <div class="text-cover">
                        <div class="title">xizang</div>
                        <div class="introduction">dasdqw</div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-sm-4 text-center">
            <div class="img-container center-block">
                <a href="#">
                    <img class="img-rounded" src="/zyc/images/index_href3.jpg" alt="">
                    <div class="img-cover">
                    </div>
                    <div class="text-cover">
                        <div class="title">xizang</div>
                        <div class="introduction">dasdqw</div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="footer"><jsp:include page="footer.jsp" flush="true"></jsp:include></div>

</body>    
</html>

