package com.zyc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.zyc.entity.*;

public class FootArticledao {
	protected Statement sql=null;
	protected ResultSet rs=null;
	public int insertArticle(Connection conn, Footarticle article) throws SQLException {
		int mark=0;
		sql=conn.createStatement();
		String condition="insert into footarticle (id,userid,username,city,title,content,img) values('"+article.getArticleid()+"','"+article.getCreaterid()+"','"+article.getCreatername()+"','"+article.getCity()+"','"+article.getTitle()+"','"+article.getContent()+"','"+article.getImg()+"')";		
		mark=sql.executeUpdate(condition);
		return mark;
	}
	public int addPhotos(Connection conn, Photos photo) throws SQLException {
		int mark=0;
		sql=conn.createStatement();
		String condition="insert into photos (id,url) values('"+photo.getId()+"','"+photo.getUrl()+"')";		
		mark=sql.executeUpdate(condition);
		return mark;
	}
	public Footarticle getArticlecontent(Connection conn, String id) throws SQLException {
		Footarticle article=new Footarticle();
		sql=conn.createStatement();
		String condition="Select *from footarticle where id ='"+id+"'";		
		rs=sql.executeQuery(condition);
		while(rs.next()){
			article.setFootarticle(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
		}
		return article;
	}
	public Page getallArticle(Connection conn,int currentpage,String search) throws SQLException{
		Page page=new Page();
		ArrayList<Footarticle> array=new ArrayList<Footarticle>();
		sql=conn.createStatement();
		String condition="Select count(*) from footarticle";
		rs=sql.executeQuery(condition);
		rs.next();
		double allrow=rs.getDouble(1);
		page.setMaxpage((int)Math.ceil(allrow/page.getPagesize()));
		condition="Select *from footarticle where userid like '%"+search+"%' or username like '%"+search+"%' or city like '%"+search+"%' or title like '%"+search+"%' or content like '%"+search+"%' limit "+(currentpage-1)*page.getPagesize()+","+page.getPagesize();
		rs=sql.executeQuery(condition);
		while(rs.next()){
			Footarticle article=new Footarticle(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
			array.add(article);
		}
		page.setList(array);
		page.setCurrentpage(currentpage);
		return page;
	}
	public Page getArticleImg(Connection conn,int currentpage) throws SQLException{
		Page page=new Page();
		ArrayList<Photos> array=new ArrayList<Photos>();
		sql=conn.createStatement();
		String condition="Select count(*) from photos";
		rs=sql.executeQuery(condition);
		rs.next();
		double allrow=rs.getDouble(1);
		page.setPagesize(12);
		page.setMaxpage((int)Math.ceil(allrow/page.getPagesize()));
		condition="Select *from photos limit "+(currentpage-1)*page.getPagesize()+","+page.getPagesize();
		rs=sql.executeQuery(condition);
		while(rs.next()){
			Photos photo=new Photos(rs.getString(1),rs.getString(2));
			array.add(photo);
		}
		page.setList(array);
		page.setCurrentpage(currentpage);
		return page;
	}
}
