/**
 * Created by zhuyongchun on 2016/7/13.
 */
$(document).ready(function () {
	$(".nav-home").addClass("active");
    $(".img-container").hover(function () {
            $(this).find(".introduction").slideDown("normal");
            $(this).find(".introduction").css({"border-left":"solid yellow"});
            $(this).find(".img-cover").css({"background-color":"rgba(0,0,0,0.2"});
        },
        function () {
            $(this).find(".introduction").slideUp("normal");
            $(this).find(".img-cover").css({"background-color":"rgba(0,0,0,0"});
        })
});