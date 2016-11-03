<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%		
  		int pageallcount=pagehelp.getMaxpage();
  		int showpage=pagehelp.getCurrentpage(); %> 
  <br>
  <div class="row">
  <div class="col-sm-8 col-sm-offset-2">
  <div style="color:black;">总页数：<span id="maxpage"><%=pageallcount %></span>页</div>
  <ul class="pagination">
  <%if(showpage>1&&showpage<pageallcount){ %>
    <li>
      <a href="/zyc/servlet/DeleteUserServlet?currentpage=<%=(showpage-1)%>" aria-label="Previous">
        <span aria-hidden="true">上一页</span>
      </a>
    </li>
    <%}
    int j=(showpage+3<pageallcount)?showpage+3:pageallcount;
    for(int i=(showpage-3>1)?showpage-3:1;i<=j;i++){
    if(i==showpage){%>
    <li class="active"><a href="/zyc/servlet/DeleteUserServlet?currentpage=<%=showpage%>"><%=i %></a></li>
    <%} 
    else{%>
    <li><a href="/zyc/servlet/DeleteUserServlet?currentpage=<%=i%>"><%=i %></a></li>
    <%} %>
    <%} %>
    <%if(showpage<pageallcount){ %>
    <li>
      <a href="/zyc/servlet/DeleteUserServlet?currentpage=<%=(showpage+1)%>" aria-label="Next">
        <span aria-hidden="true">下一页</span>
      </a>
    </li>
    <%} %>
	<form class="bs-example bs-example-form" action="/zyc/servlet/DeleteUserServlet" method="get" role="form">
    			<div class="input-group">
					<input type="text" class="form-control" name="currentpage" id="page-input" placeholder="请输入页码">
					<div class="input-group-btn">
						<button type="submit" class="btn btn-default" id="page-ok">跳转</button>
					</div>
				</div>
			</form>	
  </ul>			
  </div>
  </div>
