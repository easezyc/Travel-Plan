package com.zyc.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.zyc.base.DBConnection;
import com.zyc.dao.AdminServicedao;
import com.zyc.dao.UserServicedao;
import com.zyc.entity.*;

public class AdminService extends DBConnection{
	Connection conn=null;
	public int checkId(String id) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		AdminServicedao dao=new AdminServicedao();
		mark=dao.checkId(conn,id);
		closeConn();
		return mark;
	}
	public int getpower(String id) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		AdminServicedao dao=new AdminServicedao();
		mark=Integer.parseInt(dao.getpower(conn,id));
		closeConn();
		return mark;
	}
	public int add(Admin admin,Admin sup) throws ClassNotFoundException, SQLException {
		conn=getCon();
		int mark=0;
		AdminServicedao dao=new AdminServicedao();
		mark =dao.add(conn,admin,sup);
		closeConn();
		return mark;
	}
	public int modpwd(Admin admin) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		AdminServicedao dao=new AdminServicedao();
		mark =dao.modpwd(conn, admin);
		closeConn();
		return mark;
	}
	public int changepower(Admin sup,String id) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		AdminServicedao dao=new AdminServicedao();
		mark =dao.changepower(conn, id,sup);
		closeConn();
		return mark;
	}
	public int query(Admin admin) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		AdminServicedao dao=new AdminServicedao();
		mark=dao.query(conn, admin);
		closeConn();
		return mark;
	}
	public int delete(String id) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		AdminServicedao dao=new AdminServicedao();
		mark=dao.deleteUser(conn, id);
		closeConn();
		return mark;
	}
	public Page getalluser(int currentpage) throws ClassNotFoundException, SQLException{
		Page page=new Page();
		conn=getCon();
		AdminServicedao dao=new AdminServicedao();
		page=dao.getallUser(conn,currentpage);
		closeConn();
		return page;
	}
	public ArrayList getcommonadmin() throws ClassNotFoundException, SQLException{
		ArrayList<Admin> array=new ArrayList<Admin>();
		conn=getCon();
		AdminServicedao dao=new AdminServicedao();
		array=dao.getcommonAdmin(conn);
		closeConn();
		return array;
	}
	public ArrayList getsupadmin() throws ClassNotFoundException, SQLException{
		ArrayList<Admin> array=new ArrayList<Admin>();
		conn=getCon();
		AdminServicedao dao=new AdminServicedao();
		array=dao.getsupAdmin(conn);
		closeConn();
		return array;
	}
	public int deleteadmin(String id) throws ClassNotFoundException, SQLException{
		conn=getCon();
		int mark=0;
		AdminServicedao dao=new AdminServicedao();
		mark=dao.deleteAdmin(conn, id);
		closeConn();
		return mark;
	}
	public User getuser(String id) throws ClassNotFoundException, SQLException{
		conn=getCon();
		AdminServicedao dao=new AdminServicedao();
		User user=dao.getuser(conn, id);
		closeConn();
		return user;
	}
}
