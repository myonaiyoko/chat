import java.sql.SQLException;
import java.util.ArrayList;

import utils.Chat;
import utils.ChatDAO;

/**
 *
 */

/**
 * @author Administrator utilsクラスの実行テスト用クラス
 *
 */
public class action {
	public static void main(String[] args) throws SQLException {

		ArrayList<Chat> chatList = new ArrayList<>();
		ChatDAO d = new ChatDAO();

		chatList = d.gettSelectAll();

		for (Chat chat : chatList) {
			System.out.println(chat.getName());
			System.out.println(chat.getText());
			System.out.println(chat.getDate());
		}

	}
}
