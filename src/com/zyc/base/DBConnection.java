package com.zyc.base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	 public static Connection conn=null;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	public Connection getCon() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String uri="jdbc:mysql://localhost/zyc?characterEncoding=utf-8";
  		String user="root";
  		String databasepassword="123";
		conn=DriverManager.getConnection(uri,user,databasepassword);	
		conn.setAutoCommit(false);
		return conn;
	}
	public void closeConn() throws SQLException{
		if(conn!=null){
			conn.commit();
			conn.close();
		}
	}
	public void rollback() throws SQLException{
		if(conn!=null){
			conn.rollback();
			conn.close();
		}	
	}

}

