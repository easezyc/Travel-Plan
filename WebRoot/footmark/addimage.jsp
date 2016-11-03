<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% String id=(String)request.getAttribute("articleid"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>创建足迹</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zyc/uploadify/uploadify.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <script src="/zyc/uploadify/jquery.uploadify.js"></script>
    <script type="text/javascript">
    var backnews="fail";
        $(document).ready(function()
        {
            $('#uploadify').uploadify( {
            'swf' : '/zyc/uploadify/uploadify.swf',//上传按钮的图片，默认是这个flash文件
            'uploader' : '/zyc/servlet/AddImageServlet?id=<%=id %>',//上传所处理的服务器
            'folder' : '/zyc/images/users',//上传后，所保存文件的路径
            'queueID' : 'fileQueue',//上传显示进度条的那个div
            'buttonText' : '请选择文件',
            //'onUploadComplete': function(file){alert('The file'+file.name+'finished processing!')},//每个文件上传成功后的函数
            progressData : 'percentage',
            'auto' : true,
            'multi' : true,
            //'onSelect':function(file){
            //alert("文件"+file.name+"被选择了！");
            //}
            //'onQueueComplete' : function(queueData) {
            //    alert(queueData.filesQueued + 'files were successfully!')
            //},//当队列中的所有文件上传成功后，弹出共有多少个文件上传成功
            'onUploadSuccess' : function(file, data, response) {
                         
        				var obj = JSON.parse(data);
        				if(obj.backnews=="fail"){
        					alert("上传失败");
        				}
        				else if(obj.backnews=="suc"){
        					$(".img").removeClass("hide");
        					$("#cover").attr({ src: obj.path});
        					$("#input-img").val(obj.path);
        					$(".img-container").append("<div class=\"col-sm-4 col-xs-2 thumbnail\"><img src=\""+obj.path+"\" ></div>");
        					backnews="suc";	
        				}
                       
                    },
            'onDisable' : function() {
                alert('uploadify is disable');
            },//在调用disable方法时候触发
            //'onCancel':function(){alert('你取消了文件上传')}
            //'onUploadStart' : function(file) {//在调用上传前触发
            //alert('The file ' + file.name + ' is being uploaded.')}
            'onError' : function(errorType,errObj) {
                alert('The error was: ' + errObj.info)
            }
             

        });
        $('#uploadify').uploadifySettings('scriptData',{'name':'aaa'});
        });  
    </script>
    <style>
    	.upload-container{
    		margin-top:100px;
    	}
    	.input-container{
    		min-height:300px;
    	}
    	.thumbnail img{
    	height:200px;
    	}
    </style>
  </head>
  
  <body>
  
  	<div class="header"><%@ include  file="../header.jsp" %></div>	
  	<div class="container upload-container">
    	<div class="row input-container">
    		<div class="col-sm-6 col-sm-offset-4">
    		<span>上传您的照片</span>
    		<input type="file" name="uploadify" id="uploadify"/>   	
    		<p>
      		<div id="fileQueue"></div>
   			</p>
   			</div>
   		</div>
   		<div class="row img-container">
   			
   		</div>
   	</div>
    <div class="footer"><%@ include  file="../footer.jsp" %></div>
  </body>
</html>
