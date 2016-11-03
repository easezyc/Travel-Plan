function run(){
        interval = setInterval(judge,"1000");
    	}
    	$(document).ready(function(){
    		run();
    	});
    	function judge(){
    		if($("#page-input").val()>$("#maxpage").text()){
    			$("#page-ok").attr({disabled:true});
    		}
    		else{
    			$("#page-ok").attr({disabled:false});
    		}
    	}