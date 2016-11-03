package com.zyc.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zyc.biz.UserService;
import com.zyc.entity.User;

public class UserLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserLoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String op=request.getParameter("op");
		if(op==null){
			request.getRequestDispatcher("/user/login.jsp").forward(request,response);
		}
		else{
			int registermark=0;
			if(op.equals("register")){
				op=(String) request.getAttribute("op");
				registermark=1;
			}
			if(op.equals("login")){
				
				String userid=request.getParameter("userid");
				String pwd=request.getParameter("pwd");
				User user;
				HttpSession session=request.getSession(true);
				try{
					user=(User)session.getAttribute("user");
					if(user.equals(null)){
						user=new User(userid,pwd);
					}
				}
				catch(Exception ee){
					user=new User(userid,pwd);
				}
				UserService service=new UserService();
				int mark=0;
				try {
					mark=service.query(user);
				} catch (ClassNotFoundException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json; charset=utf-8");
				String jsonStr;
				if(mark==1&&registermark==1){
					session.setAttribute("user",user);
					response.sendRedirect("/zyc/index.jsp");
				}
				if(mark==1){
					session.setAttribute("user",user);
					jsonStr = "{\"backnews\":\"suc\"}";
				}
				else {
					session.setAttribute("user",null);
					jsonStr = "{\"backnews\":\"wrong\"}";
				}
				PrintWriter out = null;
				try {
				    out = response.getWriter();
				    out.write(jsonStr);
					} catch (IOException e) {
					    e.printStackTrace();
					} finally {
					    if (out != null) {
					        out.close();
					    }
					}
				
			}
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
