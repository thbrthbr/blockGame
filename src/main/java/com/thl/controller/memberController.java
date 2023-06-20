package com.thl.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.thl.model.member;
import com.thl.dao.memberDao;

/**
 * Servlet implementation class memberController
 */
@WebServlet("/memberController")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private memberDao memberDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public memberController() {
		super();
		this.memberDao = new memberDao();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	
	  protected void doGet(HttpServletRequest request, HttpServletResponse
	  response) throws ServletException, IOException { // TODO Auto-generated method stub 
	  String memberIDStr = request.getParameter("name");
	  System.out.println(memberIDStr);
	  
	  
	  member member2 = this.memberDao.getUserPassWordById(memberIDStr);
	  System.out.println(member2);
	  
	  response.getWriter().append("Served at: ").append(request.getContextPath());
	  }
	 

	public void logIn(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		HttpSession session = request.getSession();

		String u_id = request.getParameter("uid");
		String u_pw = request.getParameter("upswd");

		if (u_id == "" || u_pw == "") {
			session.invalidate();

			response.setContentType("text/html; charset=UTF-8");

			response.getWriter()
					.append("<script>alert('아이디나 비밀번호가 잘못되었습니다.'); location.href='final-firstscreen.jsp';</script>")
					.append(request.getContextPath());

		} else {
			if (!u_id.equals("admin") && !u_pw.equals("1346")) {

				member forlogin = this.memberDao.getUserById(u_id);
				List<member> forlogin2 = this.memberDao.getAllUsers();

				/*
				 * ResultSet rset = forlogin; ResultSet rset2 = forlogin2;
				 */

				int count = 0;
				while (count < forlogin2.size()) {

					if (forlogin2.get(count).getName().equals(u_id)) {
						count++;
					}
				}
				if (count == 0) {
					response.setContentType("text/html; charset=UTF-8");

					response.getWriter().append(
							"<script>alert('등록되어있지 않은 아이디입니다'); location.href='final-firstscreen.jsp';</script>")
							.append(request.getContextPath());

					return;
				}

				if (!forlogin.getPassword().equals(u_pw)) {
					response.setContentType("text/html; charset=UTF-8");

					response.getWriter()
							.append("<script>alert('비밀번호가 맞지않습니다.'); location.href='final-firstscreen.jsp';</script>")
							.append(request.getContextPath());

					return;
				}

				session.setAttribute("memberId", u_id);
				session.setAttribute("memberPw", u_pw);

				response.setContentType("text/html; charset=UTF-8");

				response.getWriter().append("<script>location.href='final-firstscreenSuccess.jsp';</script>")
						.append(request.getContextPath());
			} else {
				if (u_id.equals("admin") && u_pw.equals("1346")) {
					session.setAttribute("memberId", u_id);
					session.setAttribute("memberPw", u_pw);

					response.setContentType("text/html; charset=UTF-8");

					response.getWriter().append("<script>location.href='final-firstscreenSuccess.jsp';</script>")
							.append(request.getContextPath());

				} else {
					response.setContentType("text/html; charset=UTF-8");

					response.getWriter().append(
							"<script>alert('아이디나 비밀번호가 잘못되었습니다.'); location.href='final-firstscreen.jsp';</script>")
							.append(request.getContextPath());
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
