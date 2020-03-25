package com.my.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
			return "resources/resources_main/login.jsp";
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
	
	
	@RequestMapping(value = "/mapinfo", method = RequestMethod.GET)
	public String testFn(HttpServletRequest request, Model model) {
		
		return "mountain";
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public void map(@RequestParam("mysearch") String search, HttpServletResponse response, Model model) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = dbhandle.selectMap(search);
			if(jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//예훈
	@RequestMapping(value = "/diff", method = RequestMethod.GET)
	public String diffFn(HttpServletRequest request, Model model) {
		
		return "diff";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(@RequestParam("mysearch") String search, @RequestParam("mylevel") String level, @RequestParam("mytime") String time, HttpServletResponse response, Model model) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = dbhandle.selectData(search, level, time);
			if(jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@선재
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String weatherInfo(HttpServletResponse response, HttpServletRequest request ,Model model) {
		//ArrayList<TeamWeatherModel> wArr = new ArrayList<TeamWeatherModel>();
		ArrayList<TestWeatherModel> tArr = new ArrayList<TestWeatherModel>();
		ArrayList<String> sArr = new ArrayList<String>();
		TestWeatherModel rstModel = null;
		
		try {
			String url="https://www.weather.go.kr/weather/observation/currentweather.jsp";
			Document doc =  Jsoup.connect(url).get();
			request.setCharacterEncoding("utf-8");
			Elements element = doc.select("table.table_develop3");
			for(Element el: element.select("tr > td")) {
				sArr.add(el.text());
			}
			for(int i=0; i < sArr.size() ; i+=14) {
				tArr.add(new TestWeatherModel(sArr.get(i), sArr.get(i+1), sArr.get(i+2), sArr.get(i+3), sArr.get(i+4), sArr.get(i+5), sArr.get(i+6),
						sArr.get(i+7), sArr.get(i+8), sArr.get(i+9), sArr.get(i+10), sArr.get(i+11), sArr.get(i+12), sArr.get(i+13)));
			}
			for(TestWeatherModel t: tArr) {
				if(request.getParameter("selOne").equals(t.getName())) {
					rstModel = t;
				}
			}
			System.out.println(rstModel);
			model.addAttribute("rstmodel",rstModel);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return "cityweather";
	}
	
	@RequestMapping(value = "/test33", method = RequestMethod.GET)
	public void mountainInfo(HttpServletResponse response, HttpServletRequest request, Model model) {
		String test1 = request.getParameter("selOne");
		String test2 = request.getParameter("selTwo");

		
		String url = "http://know.nifos.go.kr/know/service/mtweather/mountListPop.do";
		
		ArrayList<MountainBaseModel> mArr = new ArrayList<MountainBaseModel>();
		ArrayList<String> sArr = new ArrayList<String>();
		ArrayList<MountainDetailModel> mdArr = new ArrayList<MountainDetailModel>();
		
		try {
			PrintWriter out = response.getWriter();
			
			Document doc = Jsoup.connect(url).get();
			request.setCharacterEncoding("utf-8");
			Elements element = doc.select("table.tbl_data");
			
			for(Element el: element.select("tr > td")) {
				sArr.add(el.text());
			}
			sArr.remove(0); sArr.remove(0);
			
			for(int i=0; i < sArr.size() ; i+=3) {
				mArr.add(new MountainBaseModel(sArr.get(i), sArr.get(i+1), sArr.get(i+2)) );
			}
			
			// localArea 숫가 지역 매핑
			String userArea =  request.getParameter("selOne");
			int localArea = -100;
			
			if(userArea.equals("seoul")) localArea = 1;
			else if(userArea.equals("pusan")) localArea = 3;
			else if(userArea.equals("daejeon")) localArea = 7;
			else if(userArea.equals("ulsan")) localArea = 8;
			else if(userArea.equals("gyeonggi")) localArea = 9;
			else if(userArea.equals("gangwon")) localArea = 10;
			else if(userArea.equals("chungnam")) localArea = 11;
			else if(userArea.equals("chungbuk")) localArea = 12;
			else if(userArea.equals("jeonnam")) localArea = 13;
			else if(userArea.equals("jeonbuk")) localArea = 14;
			else if(userArea.equals("gyeongnam")) localArea = 15;
			else if(userArea.equals("gyeongbuk")) localArea = 16;
			else if(userArea.equals("jeju")) localArea = 17;
			else
				System.out.println("localArea default 들어감. 선택해줘야 함");
			
			int obsid =dbhandle.selectMountNum(test2);
			System.out.println(obsid);
			// 산악기상데이터 API
			String apiUrl = "http://know.nifos.go.kr/openapi/mtweather/mountListSearch.do?"
					+ "keyValue=fCls08WS8%2BM1vGhZ79C0Yh2E%2Bzxa6XhdFviV3vJfSi4%3D&version=1.0&"
					+ "localArea=" + localArea
					+ "&obsid=" + obsid;
			
			doc = Jsoup.connect(apiUrl).get();
			request.setCharacterEncoding("utf-8");
			Elements mountainInfo = doc.select("outputData");
			
			for(Element item : mountainInfo) {

				String changeForm ="";
				for(int i = 0; i<item.selectFirst("wd2mstr").text().length(); i++) {
					if(item.selectFirst("wd2mstr").text().charAt(i)=='E') 
						changeForm += "동";
					else if(item.selectFirst("wd2mstr").text().charAt(i)=='W') 
						changeForm += "서";
					else if(item.selectFirst("wd2mstr").text().charAt(i)=='S') 
						changeForm += "남";
					else if(item.selectFirst("wd2mstr").text().charAt(i)=='N') 
						changeForm += "북";
					else {
						changeForm += "?";
						System.out.println("이상한 값");
					}
				}
				
				mdArr.add(new MountainDetailModel( item.selectFirst("tm2m").text() +"˚C",  item.selectFirst("hm2m").text()+"%", item.selectFirst("wd2mstr").text() +"(" + changeForm +"풍)", item.selectFirst("ws2m").text()+"m/s"));
				System.out.println(item.selectFirst("obsName").text() + ": " + mdArr.get(0));
				
			} // for문 끝
		} catch (Exception e) {
			System.out.println("에러메세지: " + e.getMessage());
		}
	}
	
	@RequestMapping(value = "/accpc", method = RequestMethod.GET)
	public void selectAccidentPerCity(HttpServletResponse response, Model model) {
		//response.setCharacterEncoding("utf-8");
		//response.setContentType("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=null;
		try {
			System.out.println(dbhandle.countPerCity());
			out = response.getWriter();
			out.print(dbhandle.countPerCity());
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/accpf", method = RequestMethod.GET)
	public void selectAccidentPerFactor(HttpServletResponse response, Model model) {
		//response.setCharacterEncoding("utf-8");
		//response.setContentType("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=null;
		try {
			System.out.println(dbhandle.countPerFactor());
			out = response.getWriter();
			out.print(dbhandle.countPerFactor());
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/testchart", method = RequestMethod.GET)
	public String chart(HttpServletResponse response, HttpServletRequest request ,Model model) {
		return "piechart";
	}
	
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chartFm(HttpServletResponse response, HttpServletRequest request ,Model model) {
		return "chart";
	}
	
	@RequestMapping(value = "/mw", method = RequestMethod.GET)
	public String mountainWeather(HttpServletResponse response, HttpServletRequest request ,Model model) {
		return "mountainweather";
	}
	
	@RequestMapping(value = "/cw", method = RequestMethod.GET)
	public String cityWeather(HttpServletResponse response, HttpServletRequest request ,Model model) {
		return "cityweather";
	}

}