<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>创建足迹</title>
    <link href="/zyc/css/bootstrap.min.css" rel="stylesheet">
    <link href="/zyc/uploadify/uploadify.css" rel="stylesheet">
    <script src="/zyc/js/jquery.min.js"></script>
    <script src="/zyc/js/bootstrap.min.js"></script>
    <script src="/zyc/uploadify/jquery.uploadify.js"></script>
	<script type="text/javascript" charset="utf-8" src="/zyc/editor/ueditor.config.js"></script>  
	<script type="text/javascript" charset="utf-8" src="/zyc/editor/ueditor.all.min.js"> </script>  
	<script type="text/javascript" charset="utf-8" src="/zyc/editor/lang/zh-cn/zh-cn.js"></script>  
    <script type="text/javascript">
    var backnews="fail";
        $(document).ready(function()
        {
        	var editor = UE.getEditor('container');
        	$(".img").addClass("hide");
        	$(".btn").click(function(){	
        		if($("#city").val().trim()==""){
        			alert("城市不能输入为空");
        			return false;
        		}
        		if($("#foot-title").val().trim()==""){
        			alert("标题不能输入为空");
        			return false;
        		}
        		
        		if(editor.body.innerHTML=="<p><br></p>"){
        			alert("正文不能输入为空");
        			return false;
        		}
        		if(backnews=="fail"){
        			alert("请上传封面");
        			return false;
        		}
        	});
            $('#uploadify').uploadify( {
            'swf' : '/zyc/uploadify/uploadify.swf',//上传按钮的图片，默认是这个flash文件
            'uploader' : '/zyc/servlet/UserCreateFootServlet',//上传所处理的服务器
            'folder' : '/zyc/images/users',//上传后，所保存文件的路径
            'queueID' : 'fileQueue',//上传显示进度条的那个div
            'buttonText' : '请选择文件',
            //'onUploadComplete': function(file){alert('The file'+file.name+'finished processing!')},//每个文件上传成功后的函数
            progressData : 'percentage',
            'auto' : false,
            'multi' : false,
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
        });  
    </script>
    <style>
    	.edit-container{
    		margin-top:100px;
    		margin-bottom:50px;
    	}
    	.title{
    		font-size:30px;
    		margin-bottom:20px;
    	}
    	.hide{
    		display:none;
    	}
    	.img-container{
    		min-height:200px;
    		position:relative;
    	}
    </style>
  </head>
  
  <body>
  	<div class="header"><%@ include  file="../header.jsp" %></div>
  	<div class="container edit-container">
    <div class="title text-center">创建你的结伴游</div>
    <div class="row img-container">
    	<div class="col-sm-3 col-sm-offset-3 col-xs-12">	
    	<input type="file" name="uploadify" id="uploadify"/>    	
    	<p>
      	<a href="javascript:$('#uploadify').uploadify('upload')">开始上传</a>   
      	<a href="javascript:$('#uploadify').uplaodify('cancel','*')">取消上传</a> 
      	<div id="fileQueue"></div>
   		</p>
   		</div>
  			<div class="col-xs-6 col-sm-3 img">
    			<div class="thumbnail">
      			<img id="cover" src="" alt="封面">
    			</div>
  			</div>
		</div>
    <form class="form-horizontal" method="get"  enctype="multipart/form-data" action="/zyc/servlet/UserCreateFootServlet">
    	<div class="form-group">
    		<label for="creater" class="col-sm-2 control-label text-right">创建者</label>
    		<div class="col-sm-4">
    		<input type="hidden" id="input-img" name="img" value="">
    		<input type="hidden" name="creater-id" value="<%=user.getId() %>">
    		<input type="hidden" name="creater-name" value="<%=user.getName() %>">
      		<input type="text" class="form-control" id="creater" disabled="disabled" value="<%=user.getName() %>">
    		</div>
    	</div>
    	<div class="form-group">
    		<label for="city" class="col-sm-2 control-label text-right">城市</label>
    		<div class="col-sm-4">
      		<input type="text" class="form-control" name="city" id="city">
    		</div>
    	</div>
    	<div class="form-group">
    		<label for="foot-title" class="col-sm-2 control-label text-right">标题</label>
    		<div class="col-sm-4">
      		<input type="text" class="form-control" name="foot-title" id="foot-title">
    		</div>
    	</div>
    	<div class="col-sm-10 col-sm-offset-1">
    	 <!-- 加载编辑器的容器 -->
        <div id="container" name="content" style="height:500px;" type="text/plain"></div>
        </div>
  		<div class="form-group">
    	<div class="col-sm-offset-2 col-sm-10">
      	<button type="submit" class="btn btn-default">提交</button>
    	</div>
    	</div>
    </form>
    </div>
    <div class="footer"><%@ include  file="../footer.jsp" %></div>
  </body>
</html>
