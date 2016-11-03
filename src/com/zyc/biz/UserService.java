package com.zyc.biz;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.zyc.dao.*;
import com.zyc.base.*;
import com.zyc.entity.User;

public class UserService extends DBConnection{
	Connection conn=null;
	public int checkId(String id) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		UserServicedao dao=new UserServicedao();
		mark=dao.checkId(conn,id);
		closeConn();
		return mark;
	}
	public int checkphone(String phone) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		UserServicedao dao=new UserServicedao();
		mark=dao.checkphone(conn,phone);
		closeConn();
		return mark;
	}
	public int add(User user) throws ClassNotFoundException, SQLException {
		conn=getCon();
		int mark=0;
		UserServicedao dao=new UserServicedao();
		mark =dao.add(conn,user);
		closeConn();
		return mark;
	}
	public int mod(User user) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		UserServicedao dao=new UserServicedao();
		mark =dao.mod(conn, user);
		closeConn();
		return mark;
	}
	public int query(User user) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		UserServicedao dao=new UserServicedao();
		mark=dao.query(conn, user);
		closeConn();
		return mark;
	}
}
