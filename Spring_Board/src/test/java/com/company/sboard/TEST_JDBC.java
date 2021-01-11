package com.company.sboard;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class TEST_JDBC {
	@Test
	public void test() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db0?useSSL=false", "root", "1234");

	}
}
