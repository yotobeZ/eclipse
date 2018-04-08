package com.fun.test;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

import com.fun.util.DBUtil;

public class MyClient {

	@Test
	public void test() throws SQLException {
		Connection conn = DBUtil.getConn();
		System.out.println(conn);
		conn.close();
	}

}
