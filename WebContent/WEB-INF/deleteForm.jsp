<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import ="java.util.List" %>
<%@ page import ="com.javaex.vo.GuestbookVo" %>

<%
GuestbookVo guestbookVo = (GuestbookVo)request.getAttribute("gbVo");

int ContentId = Integer.parseInt(request.getParameter("id"));
int id = guestbookVo.getNo();
String password = guestbookVo.getPassword();
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
					<input type="text" name="no" value="<%=id%>">
					<input type="text" name="action" value="delete">
				</td>
			</tr>
			
			<tr><!-- password -->
				<td>PW</td>
				<td>
					<input type="password" name="password" value="<%=password%>">
					<button type="submit">delete</button>
				</td>
			</tr>
 		</table>
	</form>
	<br>
	<a href="/WEB-INF/addList.jsp">home</a>
</body>
</html>