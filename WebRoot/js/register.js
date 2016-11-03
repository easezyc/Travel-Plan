
    /**
 * Created by zhuyongchun on 2016/7/16.
 */
$(document).ready(function () {
    
    var interval;
	run();
	var b1=0,b2=0,b3=0,b4=0;
	$("#userid").focusout(function(){
		b1=1;
	});
	$("#pwd").focusout(function(){
		b2=1;
	});
	$("#pwdcheck").focusout(function(){
		b3=1;
	});
	$("#phone").focusout(function(){
		b4=1;
	});
	$(".btn").click(function(){
		if($("#userid").val()==""||$("#pwd").val()==""||$("#pwdcheck").val==""||$("#phone").val()==""||$("#username").val()=="")
		{
			alert("信息还未填完");
			return false;
		}
	});
    function run(){
        interval = setInterval(judge,"1000");
    }
    function judge(){
    	var warning=0;
    	var a1=0,a2=0,a3=0,a4=0;
    	if(b2==1){
    		if($("#pwd").val().length<8){
            $(".pwd-warning").text("密码过短");
            a1=1;
        }
        else{
        	$(".pwd-warning").text("");
        	a1=0;
        }
    	}
        if(b3==1){
        	if($("#pwd").val()!=$("#pwdcheck").val()){
            	$(".pwdcheck-warning").text("两次密码不同");
            	a2=1;
        	}
        	else{
        		$(".pwdcheck-warning").text("");
        		a2=0;
        	}
        }
       	
        $.ajax({
            url:"/zyc/servlet/UserRegisterServlet",
            data:{userid:$("#userid").val(),phone:$("#phone").val()},
            dataType:"json",
            type:"GET",
            success:function(data){
            	if(b1==1){
            		if(data.namewarning==1){
            		$(".userid-warning").text("账号已被注册");
            		a3=1;
            		}
                	else{
                	$(".userid-warning").text("");
                	a3=0;
                	}
            	}
            	if(b4==1){
                	if($("#phone").val().length!=11){
                		$(".phone-warning").text("手机号格式不对");
                		a4=1;
                	}
                	else if(data.phonewarning==1){
                		$(".phone-warning").text("该手机号已有用户");
                		a4=1;
                	}
                	else{
                		$(".phone-warning").text("");
                		a4=0;
                	}
            	}
                
                if(a1==0&&a2==0&&a3==0&&a4==0){
                	warning=0;
                }
                else warning=1;
                if(warning==1){
                	$(".btn").attr({disabled:true});
                }
                else{
                	$(".btn").attr({disabled:false});
                }
                
            },
            error:function(){
                alert("请求失败");
                
            }
        });
        
    }
});