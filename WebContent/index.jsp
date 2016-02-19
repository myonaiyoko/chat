<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.sun.xml.internal.ws.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("UTF-8");

	//ニックネームが入力された場合はクッキーへ保存しチャット画面へ遷移
	if (request.getParameter("nickname") != null
			&& request.getParameter("nickname").trim().isEmpty() == false) {
		Cookie cookie = new Cookie("nickname",URLEncoder.encode(request.getParameter("nickname"),"UTF-8"));
		cookie.setMaxAge(Integer.MAX_VALUE);
		response.addCookie(cookie);
%>
<meta http-equiv="refresh" content="0;URL=./chat.jsp">
<%
	}

	//クッキーの存在チェック
	Cookie cookies[] = request.getCookies();
	String nickname = null;
	if (cookies != null) {
		for (Cookie c : cookies) {
			if ("nickname".equals(c.getName())) {
				nickname = c.getValue();
			}
		}
	}

	//クッキーが存在する場合はチャット画面へ遷移
	if (cookies != null && nickname != null) {
%>
		<meta http-equiv="refresh" content="0;URL=./chat.jsp">
<%
	}
%>
	<title>チャットログイン</title>
</head>
<body>
	<form action="./index.jsp" method="post">
		ニックネーム：<input type="text" name="nickname">
		<button type="submit">ログイン</button>
	</form>

</body>
</html>