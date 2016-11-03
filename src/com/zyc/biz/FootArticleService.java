package com.zyc.biz;

import java.sql.Connection;
import java.sql.SQLException;

import com.zyc.base.DBConnection;
import com.zyc.dao.AdminServicedao;
import com.zyc.dao.FootArticledao;
import com.zyc.entity.*;

public class FootArticleService extends DBConnection{
	Connection conn=null;
	public int insertArticle(Footarticle article) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		FootArticledao dao=new FootArticledao();
		mark=dao.insertArticle(conn,article);
		closeConn();
		return mark;
	}
	public int addPhotos(Photos photo) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		FootArticledao dao=new FootArticledao();
		mark=dao.addPhotos(conn,photo);
		closeConn();
		return mark;
	}
	public Page getallArticle(int currentpage,String search) throws ClassNotFoundException, SQLException{
		Page page=new Page();
		conn=getCon();
		FootArticledao dao=new FootArticledao();
		page=dao.getallArticle(conn,currentpage,search);
		closeConn();
		return page;
	}
	public Page getArticleImg(int currentpage) throws ClassNotFoundException, SQLException{
		Page page=new Page();
		conn=getCon();
		FootArticledao dao=new FootArticledao();
		page=dao.getArticleImg(conn,currentpage);
		closeConn();
		return page;
	}
	public Footarticle getArticlecontent(String id) throws ClassNotFoundException, SQLException{
		conn=getCon();
		FootArticledao dao=new FootArticledao();
		Footarticle article=dao.getArticlecontent(conn,id);
		closeConn();
		return article;
	}
}
