package com.zyc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.zyc.entity.Admin;
import com.zyc.entity.Page;
import com.zyc.entity.User;

public class AdminServicedao {
	protected Statement sql=null;
	protected ResultSet rs=null;
	public int add(Connection conn, Admin admin,Admin sup) throws SQLException {
		int mark=0;
		if(sup.getSup()==1){
		sql=conn.createStatement();
		String condition="insert into admin (id,pwd) values('"+admin.getId()+"','"+admin.getPwd()+"')";		
		mark=sql.executeUpdate(condition);
		}
		return mark;
	}
	public String getpower(Connection conn, String id) throws SQLException {
		String mark="0";
		sql=conn.createStatement();
		String condition="select *from admin where id='"+id+"'";		
		rs=sql.executeQuery(condition);
		while(rs.next()){
			mark=rs.getString(3);
		}
		return mark;
	}
	public int changepower(Connection conn, String id,Admin sup) throws SQLException {
		int mark=0;
		if(sup.getSup()==1){
		sql=conn.createStatement();
		String condition="update admin set sup ='1' where id='"+id+"'";		
		mark=sql.executeUpdate(condition);
		}
		return mark;
	}
	public int modpwd(Connection conn, Admin admin) throws SQLException {
		sql=conn.createStatement();
		int mark=0;
		String condition="update admin set pwd ='"+admin.getPwd()+"' where id='"+admin.getId()+"'";
		mark=sql.executeUpdate(condition);
		return mark;
	}
	public int query(Connection conn,Admin admin) throws SQLException{
		sql=conn.createStatement();
		int mark=0;
		String condition="Select *from admin where id ='"+admin.getId()+"' and pwd ='"+admin.getPwd()+"'";
		rs=sql.executeQuery(condition);
		while(rs.next()){
			mark=1;
		}
		return mark;
	}
	public int checkId(Connection conn,String id) throws SQLException{
		sql=conn.createStatement();
		int mark=0;
		String condition="Select *from admin where id ='"+id+"'";
		rs=sql.executeQuery(condition);
		while(rs.next()){
			mark=1;
		}
		return mark;
	}
	public int deleteUser(Connection conn,String id) throws SQLException{
		sql=conn.createStatement();
		int mark=0;
		String condition="delete from account where id ='"+id+"'";
		mark=sql.executeUpdate(condition);
		return mark;
	}
	public int deleteAdmin(Connection conn,String id) throws SQLException{
		sql=conn.createStatement();
		int mark=0;
		String condition="delete from admin where id ='"+id+"'";
		mark=sql.executeUpdate(condition);
		return mark;
	}
	public User getuser(Connection conn,String id) throws SQLException{
		sql=conn.createStatement();
		String condition="select *from account where id ='"+id+"' or phone ='"+id+"'";
		rs=sql.executeQuery(condition);
		User user=null;
		while(rs.next()){
			user=new User();
			user.setId(rs.getString(4));
			user.setName(rs.getString(1));
			user.setPwd(rs.getString(2));
			user.setImage(rs.getString(5));
			user.setPhone(rs.getString(3));
		}
		return user;
	}
	public Page getallUser(Connection conn,int currentpage) throws SQLException{
		Page page=new Page();
		ArrayList<User> array=new ArrayList<User>();
		sql=conn.createStatement();
		String condition="Select count(*) from account";
		rs=sql.executeQuery(condition);
		rs.next();
		double allrow=rs.getDouble(1);
		page.setMaxpage((int)Math.ceil(allrow/page.getPagesize()));
		condition="Select * from account limit "+(currentpage-1)*page.getPagesize()+","+page.getPagesize();
		rs=sql.executeQuery(condition);
		while(rs.next()){
			User user=new User(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
			array.add(user);
		}
		page.setList(array);
		page.setCurrentpage(currentpage);
		return page;
	}
	public ArrayList getcommonAdmin(Connection conn) throws SQLException{
		ArrayList<Admin> array=new ArrayList<Admin>();
		sql=conn.createStatement();
		String condition="Select *from admin where sup ='0'";
		rs=sql.executeQuery(condition);
		while(rs.next()){
			Admin admin=new Admin(rs.getString(1),rs.getString(2),rs.getInt(3));
			array.add(admin);
		}
		return array;
	}
	public ArrayList getsupAdmin(Connection conn) throws SQLException{
		ArrayList<Admin> array=new ArrayList<Admin>();
		sql=conn.createStatement();
		String condition="Select *from admin where sup ='1'";
		rs=sql.executeQuery(condition);
		while(rs.next()){
			Admin admin=new Admin(rs.getString(1),rs.getString(2),rs.getInt(3));
			array.add(admin);
		}
		return array;
	}
}
