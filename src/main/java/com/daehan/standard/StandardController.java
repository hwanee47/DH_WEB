package com.daehan.standard;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.daehan.standard.service.StandardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/standard")
public class StandardController {
	
	/** AppService */
	@Resource(name = "standardService")
	private StandardService standardService;
	
	private static final Logger logger = LoggerFactory.getLogger(StandardController.class);
	
	@RequestMapping(value = "/addVend.do", method = RequestMethod.POST)
	public String addVend(HttpServletRequest request, @RequestParam HashMap<String, Object> map, ModelMap model) throws Exception {
		
		standardService.addVend(map);
		
		model.addAttribute("code", "1");
		model.addAttribute("msg", "등록하였습니다.");
		
		return "home";
	}
	
}
