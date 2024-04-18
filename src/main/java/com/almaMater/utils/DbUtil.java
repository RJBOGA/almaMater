package com.almaMater.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {

	private static final String jdbc = "jdbc:mysql://localhost:3306/almaMater";
	private static final String driver = "com.mysql.cj.jdbc.Driver";


	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection(String username, String password) throws SQLException {
		return DriverManager.getConnection(jdbc, username, password);
	}
}
