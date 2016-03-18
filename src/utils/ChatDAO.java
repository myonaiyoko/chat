package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 */

/**
 * @author Administrator
 *
 */
public class ChatDAO {
	private String selectAll = "select id, name, text, date from chat order by id desc";
	private String insertSQL = "insert into chat(name, text, date) value(?,?,?)";
	private String url="jdbc:mysql://localhost/chat";
	private String jdbcd = "com.mysql.jdbc.Driver";
	private String user = "root";
	private String password = "12345678";

	public ArrayList<Chat> gettSelectAll() throws SQLException {

		ArrayList<Chat> chatList = new ArrayList<>();

		try {
			Class.forName(jdbcd).newInstance();
			Connection con = DriverManager.getConnection(url,user,password);
			PreparedStatement ps = con.prepareStatement(selectAll);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Chat chat = new Chat();
				chat.setName(rs.getString("name"));
				chat.setText(rs.getString("text"));
				chat.setDate(rs.getString("date"));
				chatList.add(chat);
			}

		} catch(Exception e) {
			e.printStackTrace();
		}
		return chatList;
	}

	public void insertValue(Chat chat) throws SQLException {
		try {
			Class.forName(jdbcd).newInstance();
			Connection con = DriverManager.getConnection(url,user,password);
			PreparedStatement ps = con.prepareStatement(insertSQL);
			ps.setString(1, chat.getName());
			ps.setString(2, chat.getText());
			ps.setString(3, chat.getDate());
			ps.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
