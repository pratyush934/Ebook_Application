package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static  Connection conn;
	public static Connection getConn() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
//			String url = ;
//			String userName = ;
//			String passWord = "root";
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app", 
					"root", "root");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
