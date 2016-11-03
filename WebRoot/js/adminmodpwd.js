$(document).ready(function(){
			$(".mod").addClass("hide");
			$(".btn-check").click(function(){
				$.ajax({
    			url:"/zyc/servlet/ChangePwdServlet",
    			data:{op:"check",pwd:$("#old-pwd").val()},
    			type:"POST",
    			dataType:"json",
    			success:function(data){
        			if(data.backnews=="T"){
        				$(".check").addClass("hide");
        				$(".mod").removeClass("hide");
        				$(".mod").addClass("show");
        			}
        			else if(data.backnews=="F"){
        				alert("密码错误");
        			}
    			},
    			error:function(){
        			alert("请求失败");
    			}
			});
			return false;
			});
			$(".btn-mod").click(function(){
				$.ajax({
    			url:"/zyc/servlet/ChangePwdServlet",
    			data:{op:"mod",pwd:$("#new-pwd").val()},
    			type:"POST",
    			dataType:"json",
    			success:function(data){
        			if(data.backnews=="修改成功"){
        				alert(data.backnews);
        				window.location="/zyc/admin/adminindex.jsp";
        			}
        			else{
        				alert(data.backnews);
        			}
    			},
    			error:function(){
        			alert("请求失败");
    			}
    			
			});
			return false;
			});
		});