<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import ="java.util.List" %>
<%@ page import ="com.javaex.vo.GuestbookVo" %>

<%
String no =request.getParameter("no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete form</title>
</head>
<body>
	<form action="/guestbook2/gbc" method="get">
		<table>
			<tr><!-- id -->
				<td>ID</td>
				<td>
					<input type="text" name="no" value="<%=no%>">
					<input type="text" name="action" value="delete">
				</td>
			</tr>
			
			<tr><!-- password -->
				<td>PW</td>
				<td>
					<input type="password" name="password" value="">
					<button type="submit">delete</button>
				</td>
			</tr>
 		</table>
	</form>
	<br>
	<a href="/WEB-INF/list.jsp">home</a>
</body>
</html>