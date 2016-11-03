package com.zyc.control;

import java.io.File; 
import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List; 

import javax.servlet.ServletContext; 
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem; 
import org.apache.commons.fileupload.FileUploadException; 
import org.apache.commons.fileupload.disk.DiskFileItemFactory; 
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.*;

import com.zyc.biz.UserService;
import com.zyc.entity.User;

public class UserModServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserModServlet() {
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
		String op=request.getParameter("op");
		HttpSession session=request.getSession(true);
		User user=(User)session.getAttribute("user");
		if(op.equals("pwd")){
			String pwd=request.getParameter("pwd");
			user.setPwd(pwd);
			UserService service=new UserService();
			int mark=0;
			try {
				mark=service.mod(user);
			} catch (ClassNotFoundException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			String jsonStr="";
			if(mark==1){
				jsonStr = "{\"backnews\":\"修改成功\"}";
			}
			else{
				jsonStr = "{\"backnews\":\"修改失败\"}";
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
		else if(op.equals("information")){
			String name=request.getParameter("name").trim();
			String phone=request.getParameter("phone").trim();
			UserService service=new UserService();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			String jsonStr="";
			int phonemark=0;
			if(!name.equals("")){
				user.setName(name);
			}
			if(!phone.equals("")){
				user.setPhone(phone);
				try {
					phonemark=service.checkphone(phone);
				} catch (ClassNotFoundException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
			}	
			int mark=0;
			if(phonemark==0){
				try {
					mark=service.mod(user);
				} catch (ClassNotFoundException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
				if(mark==1){
					jsonStr = "{\"backnews\":\"修改成功\"}";
				}
				else{
					jsonStr = "{\"backnews\":\"修改失败\"}";
				}
			}
			else{
				jsonStr = "{\"backnews\":\"该手机号已有账号\"}";
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
			String backnews="";
			HttpSession session=request.getSession(true);
			User user=(User)session.getAttribute("user");
	        DiskFileItemFactory factory=new DiskFileItemFactory();
	        ServletFileUpload sfu=new ServletFileUpload(factory);
	        sfu.setHeaderEncoding("UTF-8");  //处理中文问题
	        sfu.setSizeMax(1024*1024);   //限制文件大小
	        String basePath = request.getSession().getServletContext().getRealPath("/images/users/"); 
	        int n=0;
	        try {
	            List<FileItem> fileItems= sfu.parseRequest(request);  //解码请求 得到所有表单元素
	            for (FileItem fi : fileItems) {
	                //有可能是 文件，也可能是普通文字 
	                if (!fi.isFormField()) { //这个选项是 文件 System.out.println("表单值为："+fi.getString());
	                	n++;
	                } 
	            } 
	            if(n==1){
	            for (FileItem fi : fileItems) {
	                //有可能是 文件，也可能是普通文字 
	                if (fi.isFormField()) { //这个选项是 文字 
	                    System.out.println("表单值为："+fi.getString());
	                }else{
	                    // 是文件
	                	String fn=fi.getName();
	                	if (fn.endsWith(".jpg")) {
	                    System.out.println("文件名是："+fn);  //文件名 
	                    // fn 是可能是这样的E:/apache-tomcat-8.0.24/webapps/zyc/images/
	                    System.out.println(basePath+user.getId()+".jpg");
	                    File file=new File(basePath,user.getId()+".jpg");                    
	                    fi.write(file);
	                    fi.write(new File("E:/myeclipse work/zyc/WebRoot/images/users",user.getId()+".jpg"));
	                    backnews="上传成功";
	                    user.setImage("/zyc/images/users/"+user.getId()+".jpg");
	                    UserService service=new UserService();
	                    service.mod(user);
	                    }
	                	else {
	                		backnews="上传格式不对";
	                	}
	                }                
	            }
	            }
	            else {
	            	backnews="只能上传一张图片";
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            backnews="上传失败";
	        }
	        response.sendRedirect("/zyc/user/showinformation.jsp");
	        //去显示上传的文件
	        //request.setAttribute("pics", piclist);
	        //request.getRequestDispatcher("show").forward(request, response);
	       
		 
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
