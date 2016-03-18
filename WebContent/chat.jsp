<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="utils.ChatDAO"%>
<%@page import="utils.Chat"%>
<%@page import="utils.ChatWebSocket"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">

</script>
<%
	request.setCharacterEncoding("UTF-8");

	//クッキーの存在チェック
	Cookie cookies[] = request.getCookies();
	String nickname = null;
	if (cookies != null) {
		for (Cookie c : cookies) {
	if ("nickname".equals(c.getName())) {
		nickname = URLDecoder.decode(c.getValue(),"UTF-8");
	}
		}
	}
	// クッキーが存在しない場合はログイン画面へ遷移
	if (cookies == null || nickname == null) {
%>
<meta http-equiv="refresh" content="0;URL=./index.jsp">

<%
	}
%>
<title>chat</title>
<script type="text/javascript">
	$(function() {
		// web socket
		var ws = new WebSocket("ws://192.168.1.7:8080/Chat/echo");

		ws.onopen = function() {
			alert("on open");
		}
		ws.onmessage = function(message) {
			alert("get message");
			$("#msg").prepend(message.data);
		}
		ws.onerror = function() {
			alert("on error");
		}
		ws.onclose = function() {
			alert("on close");
		}

		$(window).unload(function() {
			ws.onclose();
		})

		$('.msgbtn').click(function() {
			var nickname = <% out.print('"' + nickname + '"'); %>
			var maintext = $("#text").val();
			var d = new Date();
			var yyyy = d.getFullYear();
			var MM = ('0' + (d.getMonth() + 1)).slice(-2);
			var dd = ('0' + d.getDate()).slice(-2);
			var HH = ('0' + d.getHours()).slice(-2);
			var mm = ('0' + d.getMinutes()).slice(-2);
			var ss = ('0' + d.getSeconds()).slice(-2);
			var date = yyyy + "/" + MM + "/" + dd + " " + HH + ":" + mm + ":" + ss;

			var message = "投稿日時：" + date + "<br>投稿者　：" + nickname + "<br>本　文　：" + maintext + "<br><hr>";

			ws.send(message);
			alert(message);

			// ajaxでDBへデータ追加
			var postData = {
				request : nickname + "," + maintext + ","
						+ date
			};
			$.ajax({
				type : "POST",
				url : "insert.jsp",
				dataType : "text",
				data : postData,
			}).done(function(data) {
			}).fail(function(data) {
				alert("error");
			});

		});
	});
</script>
</head>
<body>
	投稿者名：
<%
	out.println(nickname);
%>
	<br> 発言：
	<input type="text" id="text">
	<div>
		<button class="msgbtn">送信</button>
	</div>
	<form action="./logout.jsp">
		<button type="submit" name="logout" value="yes">ログアウト</button>
	</form>
	<hr>
	<div id="msg">

		<%
			ChatDAO chatDao = new ChatDAO();
			ArrayList<Chat> chatList = new ArrayList<Chat>();
			chatList = chatDao.gettSelectAll();
			for (Chat c : chatList) {
				out.println("投稿日時：" + c.getDate() + "<br>");
				out.println("投稿者　：" + c.getName() + "<br>");
				out.println("本　文　：" + c.getText() + "<br><hr>");
			}

		%>
	</div>

</body>
</html>