package utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 */

/**
 * @author Administrator
 *
 */
public class ChatDAO {
	private String selectAll = "select id, name, text, date from chat order by date asc";

	public ArrayList<Chat> gettSelectAll() throws SQLException {
		Connection con = DBManager.getconnectio();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(selectAll);
		ArrayList<Chat> chatList = new ArrayList<Chat>();
		while (rs.next()) {
			Chat chat = new Chat();
			chat.setName(rs.getString("name"));
			chat.setText(rs.getString("text"));
			chat.setDate(rs.getDate("date"));
			chatList.add(chat);
		}

		return chatList;
	}

}
