package com.fun.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/have_fun";
	static final String USER = "root";
	static final String PASS = "10086";
	
	static{
		
			try {
				Class.forName(JDBC_DRIVER);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		
		
	}

	public static Connection getConn() throws SQLException {
		return  DriverManager.getConnection(DB_URL,
				USER, PASS);
	}
	
}
