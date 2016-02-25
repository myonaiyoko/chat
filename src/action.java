import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;

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

		ChatDAO d = new ChatDAO();
		Chat c = new Chat();
		c.setName("綾小路翔");
		c.setText("てすとテスト試験");

		try {
			Date da = DateFormat.getDateTimeInstance().parse("2016/02/25 23:50:33");
			c.setDate(da);
		} catch (Exception e) {

		}

		d.insertValue(c);

	}
}
