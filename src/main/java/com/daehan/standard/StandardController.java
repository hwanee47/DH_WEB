package com.daehan.standard;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value = "/searchVendList.do")
	public ModelAndView searchVendList(HttpServletRequest request, @RequestParam(value="program", required=false) String program, ModelMap model) throws Exception{
		ModelAndView mav = new ModelAndView();
		List<HashMap<String,String>> list = standardService.searchVendList();
		
		mav.addObject("vendList", list);
		mav.setViewName("standard/vendManage");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/addVend.do", method = RequestMethod.POST)
	public String addVend(HttpServletRequest request, @RequestParam HashMap<String, Object> map, ModelMap model) throws Exception {
		
		standardService.addVend(map);
		
		model.addAttribute("code", "1");
		model.addAttribute("msg", "등록하였습니다.");
		
		return "redirect:/standard/searchVendList.do";
	}
	
}
