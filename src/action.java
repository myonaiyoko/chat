import java.sql.SQLException;

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

		try {
			ChatDAO d = new ChatDAO();
			Chat c = new Chat();
			c.setName("綾小路翔");
			c.setText("てすとテスト試験");
			c.setDate("2016/03/18 12:11:22");
			d.insertValue(c);
		} catch (Exception e) {

		}

	}
}
