/**
 *
 */
package utils;

import java.io.IOException;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
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
		Set<Session> sessions = session.getOpenSessions();
		System.out.println("session size : " + sessions.size());
		for (Session s : sessions) {
			System.out.println("onMessage : " + s.getId());
			s.getAsyncRemote().sendText(message);
		}
//		session.getOpenSessions().forEach(s -> {
//			s.getAsyncRemote().sendText(message);
//		});
	}
	@OnOpen
	public void open(Session s) {
		System.out.println("open : " + s.getId());
	}

	@OnClose
	public void close(Session s) {
		System.out.println("close : " + s.getId());
	}

}




