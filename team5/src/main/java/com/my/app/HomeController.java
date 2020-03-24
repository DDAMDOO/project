package com.my.app;

import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */

@Slf4j // 로그 사용 하는 어노테이션
@Controller
public class HomeController {

	@Autowired
	DataSource dataSource;
	@Autowired
	LeeDBHandle dbhandle;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.", locale);

		return "index";
	}

	// 로그인 select table
	// 테이블 확인용
	@RequestMapping(value = "/sel", method = RequestMethod.GET)
	public String assignFn(HttpServletRequest request, Model model) {
		model.addAttribute("student", request.getParameter("student"));
		return "seluser";
	}
	@RequestMapping(value = "/sel1", method = RequestMethod.GET)
	public void assignFn(HttpServletResponse response, Model model) {
		response.setContentType("text/html; charset=UTF-8");

		try {
			PrintWriter out = response.getWriter();
			String jsonStr = dbhandle.selectUser();
			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 회원가입 insert
	@RequestMapping(value = "/ins1", method = RequestMethod.GET)
	public String insertFn(HttpServletRequest request, Model model) {
		System.out.println("insert start");

		try {
			String name = request.getParameter("inputName");
			String id = request.getParameter("inputID");
			String pw = request.getParameter("inputPassword");
			String birth = request.getParameter("inputBirth");
			String email = request.getParameter("inputEmailAddress");
			String gender = request.getParameter("gender");

			dbhandle.insertAppUser(id, pw, name, birth, email, gender);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "insuser";
	}

	// 로그인 check
	@RequestMapping(value = "/logincheck", method = RequestMethod.GET)
	public String checkFn(HttpServletRequest request, Model model) {
//			System.out.println("로그인체크");
		HttpSession session = request.getSession();
		String id = request.getParameter("inputID");
		String pw = request.getParameter("inputPassword");

		session.setAttribute("ses", id);

		if (dbhandle.loginCheck(id, pw).equals("success")) {
			System.out.println("세션 : " + session.getAttribute("ses"));
			return "index";
		} else {
			return "resources/resources_main/login.html";
		}
	}

	// 회원정보 수정
	@RequestMapping(value = "/update1", method = RequestMethod.GET)
	public String updateFn(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("update start");

		System.out.println("session test" + session.getAttribute("ses"));
		String ses = (String) session.getAttribute("ses");
		try {
			String name = request.getParameter("inputName");
			String id = request.getParameter("inputID");
			String pw = request.getParameter("inputPassword");
			String birth = request.getParameter("inputBirth");
			String email = request.getParameter("inputEmailAddress");
			String gender = request.getParameter("gender");

//			System.out.println(
//					"컨트롤러 로그 : " + ses + " " + id + " " + pw + " " + name + " " + birth + " " + email + " " + gender);

			dbhandle.UpdateInfo(ses, pw, name, birth, email, gender);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "update";
	}
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String testFn(HttpServletRequest request, Model model) {
		model.addAttribute("student", request.getParameter("student"));
		return "map_test";
	}
}