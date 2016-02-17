<%@page import="com.sun.xml.internal.ws.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("UTF-8");

	if (request.getParameter("nickname") != null
			&& request.getParameter("nickname").trim().isEmpty() == false) {

		session.setAttribute("nickname", request.getParameter("nickname"));
		//TODO cookieの期限
%>
<meta http-equiv="refresh" content="0;URL=./chat.jsp">
<%
	}
	if (session.getAttribute("nickname") != null) {
%>
		<meta http-equiv="refresh" content="0;URL=./chat.jsp">
<%
	}
%>
	<title>チャットログイン</title>
</head>
<body>
	<form action="./index.jsp" method="post">
		ニックネーム：<input type="text" name="nickname"> <input type="submit">
	</form>

</body>
</html>