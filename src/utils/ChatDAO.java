package utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 */

/**
 * @author Administrator
 *
 */
public class ChatDAO {
	private String selectAll = "select id, name, text, date from chat order by date desc";
	private String insertSQL = "insert into chat(name, text, date) value('";

	public ArrayList<Chat> gettSelectAll() throws SQLException {
		Connection con = DBManager.getconnectio();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(selectAll);
		ArrayList<Chat> chatList = new ArrayList<Chat>();
		while (rs.next()) {
			Chat chat = new Chat();
			chat.setName(rs.getString("name"));
			chat.setText(rs.getString("text"));
			chat.setDate(rs.getTimestamp("date"));
			chatList.add(chat);
		}

		return chatList;
	}

	public void insertValue(Chat chat) throws SQLException {
		Connection con = DBManager.getconnectio();
		Statement stmt = con.createStatement();
		insertSQL = insertSQL
				+ chat.getName()
				+ "','"
				+ chat.getText()
				+ "',cast('"
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(chat
						.getDate()) + "' as datetime))";
		stmt.executeUpdate(insertSQL);

	}

}
