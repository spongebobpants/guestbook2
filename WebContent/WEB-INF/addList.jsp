<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.javaex.dao.GuestbookDao" %>
<%@ page import="com.javaex.vo.GuestbookVo" %>

<%
	//GuestbookDao 우선 불러오기
	GuestbookDao guestbookDao = new GuestbookDao();
	List<GuestbookVo> gbList = guestbookDao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 등록폼 영역 -->
	<form action="/guestbook2/gbc" method="get" >
	<table border="2" width="500px">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value=""></td>
			<td>비밀번호</td>
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
	for(int i=0; i<gbList.size(); i++){
		GuestbookVo vo = gbList.get(i);
	%>
	
	<form action="/guestbook2/gbc" method=get>
	<table border ="1" width ="500px">
		<tr>
			<td><input type="text" name="no" value="<%=gbList.get(i).getNo()%>"></td>
			<td><%=vo.getName()%></td>
			<td><%=vo.getRegDate()%></td>
			<td><a href="/guestbook2/deleteForm.jsp?id=<%=gbList.get(i).getNo()%>">delete</a>
			<input type="hidden" name="action" value="deleteForm">
			</td>
		</tr>
		<tr>
			<td colspan="4"><%=gbList.get(i).getContent()%></td>
		</tr>
	</table>
	</form>
	<!-- 리스트영역 종료-->
	<br>
	<%
	}
	%>