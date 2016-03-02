/**
 *
 */
package utils;

import java.io.IOException;

import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 * @author Administrator
 *
 */
@ServerEndpoint("/echo")
public class ChatWebSocket {

	@OnMessage
	public void echo(String message,Session session) throws IOException {
		session.getOpenSessions().forEach(s -> {
			s.getAsyncRemote().sendText(message);
		});
}

}
