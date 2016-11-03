<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<!-- 百度编辑器js -->  
<script type="text/javascript" charset="utf-8" src="editor/ueditor.config.js"></script>  
<script type="text/javascript" charset="utf-8" src="editor/ueditor.all.min.js"> </script>  
<script type="text/javascript" charset="utf-8" src="editor/lang/zh-cn/zh-cn.js"></script>  
<style type="text/css">  
    div{  
        width:100%;  
    }  
</style>  
  
<title>百度编辑器</title>  
  
<script type="text/javascript">   
    //实例化编辑器  
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例  
    <strong>var ue = UE.getEditor('myEditor');</strong>  
</script>  
</head>  
<body>  
<!-- 加载编辑器的容器 -->
    <script id="container" name="content" type="text/plain">
    </script>
    <script type="text/javascript">
        var ue = UE.getEditor('container');
    </script>
</body>  
</html>  