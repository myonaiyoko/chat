<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js">
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
	//クッキーが存在しない場合はログイン画面へ遷移
	if (cookies == null || nickname == null) {
%>
		<meta http-equiv="refresh"content="0;URL=./index.jsp">
<%
	}
%>

<title>chat</title>
<script type="text/javascript">
$(function(){
	$('.msgbtn').click(function() {
		$("#msg").html($("#text").val() + "<br>" + $("#msg").html());
	});
});
</script>
</head>
<body>
投稿者名：
<%
	out.println(nickname);
%>
<br>
発言：
<input type="text" id="text">
<div>
	<button class="msgbtn">送信</button>
</div>
<form action="./logout.jsp">
	<button type="submit" name="logout" value="yes">ログアウト</button>
</form>
<hr>
<br>
<br>
<div id="msg"></div>

</body>
</html>