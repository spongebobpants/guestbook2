<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.javaex.vo.GuestbookVo" %>

<%
	//GuestbookDao 우선 불러오기
	List<GuestbookVo> guestbookList = (List<GuestbookVo>) request.getAttribute("list");
	//localhost:8088/guestbook2/gbc?action=list
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook2 list model2</title>
</head>
<body>

	<!-- 등록폼 영역 -->
	<form action="/guestbook2/gbc" method="get" >
	<table border="1" width="500px">
		<tr>
			<td>name</td>
			<td><input type="text" name="name" value=""></td>
			<td>password</td>
			<td><input type="password" name="password" value=""></td>
		</tr>
		<tr>
			<td colspan="4">
				<textarea cols="65" rows="5" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="submit">submit</button>
			</td>
		</tr>
	</table>
	</form>
	<br>
	
	<%
	for(int i=0; i<guestbookList.size(); i++){
	%>
	
	<form action="/guestbook2/gbc" method=get>
	<table border="1" width ="500px">
		<tr>
			<td><input type="text" name="no" value="<%=guestbookList.get(i).getNo()%>"></td>
			<td><%=guestbookList.get(i).getName()%></td>
			<td><%=guestbookList.get(i).getRegDate()%></td>
			
			<td><a href="/guestbook2/deleteForm.jsp?id=<%=guestbookList.get(i).getNo()%>">delete</a>
			<input type="hidden" name="action" value="deleteForm">
			</td>
		</tr>
		<tr>
			<td colspan="4"><%=guestbookList.get(i).getContent()%></td>
		</tr>
	</table>
	</form>
	<!-- 리스트영역 종료-->
	<br>
	<%
	}
	%>
	</body>
	</html>