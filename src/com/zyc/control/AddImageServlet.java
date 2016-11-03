package com.zyc.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

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

import com.zyc.biz.FootArticleService;
import com.zyc.biz.UserService;
import com.zyc.entity.Photos;
import com.zyc.entity.User;

public class AddImageServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddImageServlet() {
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

		String basePath = request.getScheme() + "://"  
    	        + request.getServerName() + ":" + request.getServerPort()  
    	        + request.getContextPath() + "/";  
    	        String id=request.getParameter("id"); 
    	        String savePath =request.getSession().getServletContext().getRealPath("/")+"images/photos\\";
    	        String backnews="fail";
    	            File f1 = new File(savePath);   
    	            //System.out.println(savePath);  
    	            if (!f1.exists()) {  
    	                f1.mkdirs();  
    	            }  
    	            DiskFileItemFactory fac = new DiskFileItemFactory();  
    	            ServletFileUpload upload = new ServletFileUpload(fac);  
    	            upload.setHeaderEncoding("utf-8");  
    	            List fileList = null;  
    	            try {  
    	                fileList = upload.parseRequest(request);  
    	            } catch (FileUploadException ex) {  
    	            }  
    	            Iterator<FileItem> it = fileList.iterator();  
    	            String name = "";  
    	            String extName = "";  
    	            while (it.hasNext()) {  
    	                FileItem item = it.next();  
    	                if (!item.isFormField()) {  
    	                    name = item.getName();  
    	                    long size = item.getSize();  
    	                    String type = item.getContentType();  
    	                    //System.out.println(size + " " + type);  
    	                    if (name == null || name.trim().equals("")) {  
    	                        continue;  
    	                    }  
    	                    // 扩展名格式：  
    	                    if (name.lastIndexOf(".") >= 0) {  
    	                        extName = name.substring(name.lastIndexOf("."));  
    	                    }  
    	                    File file = null;  
    	                    do {  
    	                        // 生成文件名：  
    	                        name = UUID.randomUUID().toString();  
    	                        file = new File(savePath + name + extName);   
    	                    } while (file.exists());  
    	                    File saveFile = new File(savePath + name + extName);
    	                    String path="/zyc/images/photos/"+name+extName;
    	                    try {  
    	                        item.write(saveFile);
    	                        Photos photo=new Photos(id,path);
    	                        FootArticleService service=new FootArticleService();
    	                        int mark=service.addPhotos(photo);
    	                        backnews="suc";
    	                    } catch (Exception e) {  
    	                    	backnews="fail";
    	                        e.printStackTrace();  
    	                    }  
    	                }  
    	            }  
    	            response.setCharacterEncoding("UTF-8");
    				response.setContentType("application/json; charset=utf-8");
    				String jsonStr;
 
    				jsonStr = "{\"backnews\":\""+backnews+"\",\"path\":\"/zyc/images/photos/"+name+extName+"\"}";
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

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
