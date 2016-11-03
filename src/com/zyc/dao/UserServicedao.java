package com.zyc.dao;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zyc.entity.User;

public class UserServicedao {
	protected Statement sql=null;
	protected ResultSet rs=null;
	public int add(Connection conn, User user) throws SQLException {
		sql=conn.createStatement();
		int mark=0;
		String condition="insert into account (name,pwd,phone,id) values('"+user.getName()+"','"+user.getPwd()+"','"+user.getPhone()+"','"+user.getId()+"')";		
		mark=sql.executeUpdate(condition);
		return mark;
	}
	public int mod(Connection conn, User user) throws SQLException {
		sql=conn.createStatement();
		int mark=0;
		String condition="update account set name ='"+user.getName()+"',pwd ='"+user.getPwd()+"',phone='"+user.getPhone()+"',image ='"+user.getImage()+"' where id='"+user.getId()+"'";
		mark=sql.executeUpdate(condition);
		return mark;
	}
	public int query(Connection conn,User user) throws SQLException{
		sql=conn.createStatement();
		int mark=0;
		String condition="Select *from account where id ='"+user.getId()+"' and pwd ='"+user.getPwd()+"'";
		rs=sql.executeQuery(condition);
		while(rs.next()){
			user.setName(rs.getString(1));
			user.setPhone(rs.getString(3));
			user.setImage(rs.getString(5));
			mark=1;
		}
		return mark;
	}
	public int checkId(Connection conn,String id) throws SQLException{
		sql=conn.createStatement();
		int mark=0;
		String condition="Select *from account where id ='"+id+"'";
		rs=sql.executeQuery(condition);
		while(rs.next()){
			mark=1;
		}
		return mark;
	}
	public int checkphone(Connection conn,String phone) throws SQLException{
		sql=conn.createStatement();
		int mark=0;
		String condition="Select *from account where phone ='"+phone+"'";
		rs=sql.executeQuery(condition);
		while(rs.next()){
			mark=1;
		}
		return mark;
	}
}
