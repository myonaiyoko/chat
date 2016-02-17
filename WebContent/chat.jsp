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
	if (session.getAttribute("nickname") == null) {
%>
		<meta http-equiv="refresh" content="0;URL=./index.jsp">
<%
	}
%>

<title>chat</title>
<script type="text/javascript">
$(function(){
	$('button').click(function() {
		$("#msg").html($("#text").val() + "<br>" + $("#msg").html());
	});
});
</script>
</head>
<body>
<div>
	<button>送信</button>
</div>
<input type="text" value="xyz" id="text">
<br>
投稿者名：
<%
	out.println(session.getAttribute("nickname"));
%>
<br>
<div id="msg"></div>

</body>
</html>