<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("UTF-8");

	// チャット画面からログアウトしたときの処理
	if (request.getParameter("logout") != null) {
		Cookie cookies[] = request.getCookies();
		for (Cookie c : cookies) {
			if ("nickname".equals(c.getName())) {
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
	}
%>
		<meta http-equiv="refresh" content="0;URL=./index.jsp">
<title>logout</title>
</head>
<body>

</body>
</html>