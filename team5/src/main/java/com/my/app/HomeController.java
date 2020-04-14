package com.my.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
			return "resources/resources_main/login";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate(); // userImpl.logout(session);
		return "redirect:/";
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
			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 예훈
	@RequestMapping(value = "/diff", method = RequestMethod.GET)
	public String diffFn(HttpServletRequest request, Model model) {

		return "diff_view";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(@RequestParam("mysearch") String search, @RequestParam("mylevel") String level,
			@RequestParam("mytime") String time, HttpServletResponse response, Model model) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = dbhandle.selectData(search, level, time);
			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/getfav", method = RequestMethod.GET)
	public String s_fromFn3(Locale locale, HttpServletResponse response, HttpServletRequest request, Model model) {
		return "fav_view";
	}

	@RequestMapping(value = "/fav", method = RequestMethod.GET)
	public void fav(@RequestParam("mycode") String code, @RequestParam("mycase") int mycase,
			HttpServletResponse response, HttpSession session) {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("mycase :" + mycase);
		String ses1 = (String) session.getAttribute("ses");
		try {
			PrintWriter out = response.getWriter();
			String a = dbhandle.changeFav(ses1, code, mycase);
			System.out.println("a: " + a);
			if (!a.equals("에러")) {
				if (a.equals("추가 성공")) {
					out.print("추가 되었습니다.");
					out.flush();
				} else if (a.equals("삭제 성공")) {
					out.print("삭제 되었습니다.");
					out.flush();
				} else if (a.equals("이미 있음")) {
					out.print("이미 즐겨찾기에 있는 등산로입니다.");
					out.flush();
				} else if (a.equals("이미 없음")) {
					out.print("즐겨찾기에 등록되어 있지 않은 등산로입니다.");
					out.flush();
				} else if (a.equals("No data")) {
					System.out.println("뭐지!!");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/favorite", method = RequestMethod.GET)
	public void search(HttpServletResponse response, HttpSession session) {
		response.setContentType("text/html; charset=UTF-8");
		String ses1 = (String) session.getAttribute("ses");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = dbhandle.selectFav(ses1);
			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/mwex", method = RequestMethod.GET)
	public void mountainInfo(HttpServletResponse response, HttpServletRequest request, Model model) {
		response.setContentType("text/html; charset=UTF-8");
		JSONArray arr = new JSONArray();
		///////////////////////// 한 예 훈@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		String search = request.getParameter("myinput");
		String weather = dbhandle.getWeather(search);
		System.out.println(weather);
		JSONParser parser = new JSONParser();
		Object obj;
		try {
			obj = parser.parse(weather);
		} catch (Exception e1) {
			System.out.println("mwex 에러메세지: " + e1.getMessage());
			obj = null;
		}
		JSONArray j_weather = (JSONArray) obj;
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		for (int i = 0; i < j_weather.size(); i++) {
			JSONObject obj_weather = (JSONObject) j_weather.get(i);
			String m_city = (String) obj_weather.get("m_city");
			String temp_num = String.valueOf(obj_weather.get("m_num"));
			int m_num = Integer.parseInt(temp_num);
			System.out.println(m_city);
			System.out.println(m_num);
			try {
				request.setCharacterEncoding("utf-8");
				// localArea 숫가 지역 매핑
				String userArea = m_city;
				int localArea = -100;
				if (userArea.equals("서울특별시"))
					localArea = 1;
				else if (userArea.equals("부산광역시"))
					localArea = 3;
				else if (userArea.equals("대전광역시"))
					localArea = 7;
				else if (userArea.equals("울산광역시"))
					localArea = 8;
				else if (userArea.equals("경기도"))
					localArea = 9;
				else if (userArea.equals("강원도"))
					localArea = 10;
				else if (userArea.equals("충청남도"))
					localArea = 11;
				else if (userArea.equals("충청북도"))
					localArea = 12;
				else if (userArea.equals("전라남도"))
					localArea = 13;
				else if (userArea.equals("전라북도"))
					localArea = 14;
				else if (userArea.equals("경상남도"))
					localArea = 15;
				else if (userArea.equals("경상북도"))
					localArea = 16;
				else if (userArea.equals("제주도"))
					localArea = 17;
				else
					System.out.println("localArea default 들어감. 선택해줘야 함");
				// 산악기상데이터 API
				String apiUrl = "http://know.nifos.go.kr/openapi/mtweather/mountListSearch.do?"
						+ "keyValue=fCls08WS8%2BM1vGhZ79C0Yh2E%2Bzxa6XhdFviV3vJfSi4%3D&version=1.0&" + "localArea="
						+ localArea + "&obsid=" + m_num;
				Document doc = Jsoup.connect(apiUrl).get();
				request.setCharacterEncoding("utf-8");
				Elements mountainInfo = doc.select("outputData");
				for (Element item : mountainInfo) {
					String changeForm = "";
					for (int j = 0; j < item.selectFirst("wd2mstr").text().length(); j++) {
						if (item.selectFirst("wd2mstr").text().charAt(j) == 'E')
							changeForm += "동";
						else if (item.selectFirst("wd2mstr").text().charAt(j) == 'W')
							changeForm += "서";
						else if (item.selectFirst("wd2mstr").text().charAt(j) == 'S')
							changeForm += "남";
						else if (item.selectFirst("wd2mstr").text().charAt(j) == 'N')
							changeForm += "북";
						else {
							changeForm += "?";
							System.out.println("이상한 값");
						}
					} // 안쪽포문
					JSONObject o = new JSONObject();
					o.put("city", item.selectFirst("obsName").text().substring(0,
							item.selectFirst("obsName").text().indexOf(' ')));
					o.put("name",
							item.selectFirst("obsName").text().substring(
									item.selectFirst("obsName").text().indexOf(' '),
									item.selectFirst("obsName").text().length()));
					o.put("temp", item.selectFirst("tm2m").text());
					o.put("seupdo", item.selectFirst("hm2m").text());
					o.put("punghyang", item.selectFirst("wd2mstr").text() + "(" + changeForm + ")");
					o.put("pungsok", item.selectFirst("ws2m").text());
					arr.add(o);
					System.out.println("제이슨 데이터 날라왔니? -> " + arr.toJSONString());
				} // for문 끝
			} catch (Exception e) {
				System.out.println("통합 코드 中 선재꺼 에러메세지: " + e.getMessage());
			}
		}
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(arr.toJSONString());
		out.flush();
	}

	// 선재

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void weatherInfo(HttpServletResponse response, HttpServletRequest request, Model model) {
		JSONArray arr = new JSONArray();
		response.setContentType("text/html; charset=UTF-8");
		TestWeatherModel rstModel = null;
		ArrayList<String> sArr = new ArrayList<String>();
		PrintWriter out = null;
		String selOne = request.getParameter("selOne");

		try {
			String url = "https://www.weather.go.kr/weather/observation/currentweather.jsp";
			Document doc = Jsoup.connect(url).get();
			request.setCharacterEncoding("utf-8");
			Elements element = doc.select("table.table_develop3");
			for (Element el : element.select("tr > td")) {
				sArr.add(el.text());
			}
			JSONObject o = new JSONObject();
			for (int i = 0; i < sArr.size(); i += 14) {
				if (selOne.equals(sArr.get(i))) {
					o.put("name", sArr.get(i));
					o.put("temp", sArr.get(i + 5));
					o.put("chegam", sArr.get(i + 7));
					o.put("seupdo", sArr.get(i + 10));
					arr.add(o);
				}
			}
			out = response.getWriter();
			out.print(o.toJSONString());
			out.flush();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@RequestMapping(value = "/accpc", method = RequestMethod.GET)
	public void selectAccidentPerCity(HttpServletResponse response, Model model) {
		// response.setCharacterEncoding("utf-8");
		// response.setContentType("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = null;
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
		// response.setCharacterEncoding("utf-8");
		// response.setContentType("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = null;
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
	public String chart(HttpServletResponse response, HttpServletRequest request, Model model) {
		return "piechart";
	}

	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chartFn(HttpServletResponse response, HttpServletRequest request, Model model) {
		return "chart";
	}

	@RequestMapping(value = "/mw", method = RequestMethod.GET)
	public String mountainWeather(HttpServletResponse response, HttpServletRequest request, Model model) {
		return "mountainweather";
	}

	@RequestMapping(value = "/cw", method = RequestMethod.GET)
	public String cityWeather(HttpServletResponse response, HttpServletRequest request, Model model) {
		return "cityweather";
	}

	@RequestMapping(value = "/geo1", method = RequestMethod.GET)
	public void geo1Fn(HttpServletResponse response, HttpServletRequest request, @RequestParam("lat") String lat,
			@RequestParam("lon") String lon) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = dbhandle.selectNearMountain(Double.parseDouble(lat), Double.parseDouble(lon));
			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/geo", method = RequestMethod.GET)
	public String geoFn(HttpServletResponse response, HttpServletRequest request) {
		return "geolocation";
	}
	
	
	@RequestMapping(value = "/geoview", method = RequestMethod.GET)
	public String geoviewFn(HttpServletResponse response, HttpServletRequest request) {
		return "near_view";
	}
}