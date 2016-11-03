package com.zyc.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zyc.biz.AdminService;
import com.zyc.entity.Page;
import com.zyc.entity.User;

public class DeleteUserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteUserServlet() {
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
		String currentpage=request.getParameter("currentpage");
		int curpage;
		if(currentpage==null||currentpage.equals(""))curpage=1;
		else curpage=Integer.parseInt(currentpage);
		Page page=new Page();
		AdminService service=new AdminService();
		try {
			page=service.getalluser(curpage);
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		ArrayList<User> array=page.getList();
		request.setAttribute("userlist", page);
		request.getRequestDispatcher("/admin/deleteuser.jsp").forward(request,response);
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
		request.setCharacterEncoding("UTF-8");
		String op=request.getParameter("op");
		if(op.equals("delete")){
			dodelete(request,response);
		}
		else if(op.equals("query")){
			doquery(request,response);
		}
	}
	public void doquery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int currentpage=Integer.parseInt(request.getParameter("currentpage"));		
		String id=request.getParameter("id");
		AdminService service=new AdminService();
		User user=null;
		try {
			user=service.getuser(id);
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		ArrayList<User> array=new ArrayList<User>();
		array.add(user);
		Page page=new Page(currentpage,1,array);
		request.setAttribute("userlist", page);
		request.getRequestDispatcher("/admin/deleteuser.jsp").forward(request,response);
	}
	public void dodelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int currentpage=Integer.parseInt(request.getParameter("currentpage"));		
		String id=request.getParameter("id");
		AdminService service=new AdminService();
		try {
			service.delete(id);
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		Page page=new Page();
		try {
			page=service.getalluser(currentpage);
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		request.setAttribute("userlist", page);
		request.getRequestDispatcher("/admin/deleteuser.jsp").forward(request,response);
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
