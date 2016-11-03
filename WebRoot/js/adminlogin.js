        /**
 * Created by zhuyongchun on 2016/7/16.
 */
$("ducument").ready(function(){
    $(".btn-login").click(function(){
        $.ajax({
            url:"/zyc/servlet/AdminLoginServlet",
            data:{op:$("#op").val(),adminid:$("#adminid").val(),pwd:$("#pwd").val()},
            type:"POST",
            dataType:"json",
            success:function(data){
                if(data.backnews=="wrong")alert("账号密码错误");
                else if(data.backnews=="suc")window.location="/zyc/admin/adminindex.jsp";
            },
            error:function(){
                alert("请求失败");
            }
        });
        return false;
    });
});