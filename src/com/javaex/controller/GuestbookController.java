package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestbookDao;
import com.javaex.vo.GuestbookVo;

@WebServlet("/gbc")
public class GuestbookController extends HttpServlet {
    //기본 생성자 생략 가능
    public GuestbookController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
	//writeForm -->전화번호 등록
	response.getWriter().append("Served at: ").append(request.getContextPath());
	String act = request.getParameter("action");
	//System.out.println(act);
	//System.out.println("PhonebookController");
	
	if("list".equals(act)) {
	GuestbookDao guestbookDao = new GuestbookDao();
	List<GuestbookVo> guestbookList = guestbookDao.getList();
	//guestbook 객체
	request.setAttribute("guestbookList",guestbookList);
	//forward
	RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/list.jsp");
	rd.forward(request, response);
	
	}else if("write".equals(act)) {
	//System.out.println("action=write");
		
		//parameter 3개 꺼내온다
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		String regDate = request.getParameter("regDate");
		//vo로 만들기
		GuestbookVo guestbookVo = new GuestbookVo(name, password, content, regDate);
		
		//dao 메모리에 올린다
		GuestbookDao guestbookDao = new GuestbookDao();
		
		//dao.insert(vo)
		guestbookDao.insert(guestbookVo);
		//dao.inset(vo);
		
		
		//꼬리표 표기
		//System.out.println("action=write");
	}else {
		System.out.println("파라미터 없음");
	}
}//get


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
