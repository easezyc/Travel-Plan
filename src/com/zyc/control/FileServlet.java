package com.zyc.control;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created with IntelliJ IDEA.
 * User: http://www.mbaike.net
 * Date: 13-10-31
 * Time: 下午4:31
 * To change this template use File | Settings | File Templates.                                   a
 */
public class FileServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String basePath = request.getScheme() + "://"  
    	        + request.getServerName() + ":" + request.getServerPort()  
    	        + request.getContextPath() + "/";  
    	        String backnews="fail";
    	        String returnPath=basePath+"images/cover/";  
    	        String savePath =request.getSession().getServletContext().getRealPath("/")+"images/cover\\";  
    	          
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
    	                        //System.out.println(savePath + name + extName);  
    	                    } while (file.exists());  
    	                    File saveFile = new File(savePath + name + extName);  
    	                    System.out.println(savePath + name + extName);
    	                    try {  
    	                        item.write(saveFile); 
    	                        backnews="suc";
    	                    } catch (Exception e) {  
    	                        e.printStackTrace();  
    	                        backnews="fail";
    	                    }  
    	                }  
    	            }  
    	            response.setCharacterEncoding("UTF-8");
    				response.setContentType("application/json; charset=utf-8");
    				String jsonStr;
 
    				jsonStr = "{\"backnews\":\""+backnews+"\",\"path\":\"/zyc/images/cover/"+name+extName+"\"}";
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

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String basePath = request.getScheme() + "://"  
    	        + request.getServerName() + ":" + request.getServerPort()  
    	        + request.getContextPath() + "/";  
    	          
    	        String returnPath=basePath+"intentionPicture/";  
    	        String savePath =request.getSession().getServletContext().getRealPath("/")+"intentionPicture\\";  
    	          
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
    	                        //System.out.println(savePath + name + extName);  
    	                    } while (file.exists());  
    	                    File saveFile = new File(savePath + name + extName);  
    	                    System.out.println(saveFile);
    	                    try {  
    	                        item.write(saveFile);  
    	                    } catch (Exception e) {  
    	                        e.printStackTrace();  
    	                    }  
    	                }  
    	            }  
    	            response.setCharacterEncoding("UTF-8");
    				response.setContentType("application/json; charset=utf-8");
    				String jsonStr;
 
    				jsonStr = "{\"backnews\":\"suc\",\"name\":\"a\"}";
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