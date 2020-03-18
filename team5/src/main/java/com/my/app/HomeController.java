package com.my.app;

import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
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

@Slf4j	//로그 사용 하는 어노테이션
@Controller
public class HomeController {
	
	@Autowired
	DataSource dataSource;
	@Autowired
	ProdDBHandle dbhandle;

	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.", locale);
		
		return "index";
	}
	
	@RequestMapping(value = "/ins", method = RequestMethod.GET)
	public String insFn(HttpServletResponse response, Model model) {
		String result = dbhandle.insertAppUser();
		model.addAttribute("result", result);
		
		return "insertstudent";
	}
	
}
