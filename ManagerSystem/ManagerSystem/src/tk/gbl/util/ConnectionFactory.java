package tk.gbl.util;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;


import com.mchange.v2.c3p0.ComboPooledDataSource;

public class ConnectionFactory {

	private ConnectionFactory() {
	}

	private static ComboPooledDataSource ds = null;

	static {
		try {
			
			ds = new ComboPooledDataSource();
			// 设置JDBC的Driver类
			ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			// 设置连接池的最大连接数
			ds.setMaxPoolSize(100);
			// 设置连接池的最小连接数
			ds.setMinPoolSize(10);
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
	}



	public static synchronized Connection getConnection(String dbName) {
		Connection con = null;
		try {
			// 设置JDBC的URL
			ds.setJdbcUrl("jdbc:sqlserver://localhost:1433; DatabaseName="
					+ dbName);
			con = ds.getConnection();

		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return con;
	}
	// C3P0 end
}