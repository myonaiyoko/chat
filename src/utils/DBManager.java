package utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 */

/**
 * @author yoko myonai
 *
 */
public class DBManager {
	private static String driverName = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost/chat";
	private static String user = "root";
	private static String pass = "12345678";
	public static Connection getconnectio() {
		Connection con = null;
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url,user,pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return con;
	}

}
