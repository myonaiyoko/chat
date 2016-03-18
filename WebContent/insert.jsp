<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="utils.ChatDAO"%>
<%@page import="utils.Chat"%>
<%@page import="java.lang.String"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%
		String pData = request.getParameter("request");

		String[] strAry = pData.split(",");
		String name = strAry[0];
		String text = strAry[1];
		String sDate = strAry[2];

		Chat c = new Chat();
		c.setName(name);
		c.setText(text);
		c.setDate(sDate);

		ChatDAO cd = new ChatDAO();
		cd .insertValue(c);
	%>


	<%
	out.println(name);
	out.println(text);
	out.println(sDate);
	%>
</body>
</html>