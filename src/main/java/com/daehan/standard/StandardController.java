package com.daehan.standard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daehan.common.model.Result;
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
	public String searchVendList(HttpServletRequest request, @RequestParam(value="program", required=false) String program, ModelMap model) throws Exception{
		List<HashMap<String,String>> list = standardService.searchVendList();
		
		model.addAttribute("vendList", list);
		
		return program;
	}
	
	
	@RequestMapping(value = "/addVend.do", method = RequestMethod.POST)
	public String addVend(HttpServletRequest request, @RequestParam HashMap<String, Object> map, ModelMap model) throws Exception {
		
		standardService.addVend(map);
		
		return "redirect:/standard/searchVendList.do?program=standard/vendManage";
	}
	
	
	@RequestMapping(value = "/deleteVend.do", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteVend(HttpServletRequest request, @RequestParam HashMap<String, Object> map, ModelMap model) throws Exception{
        Map<String, Object> retVal = new HashMap<String, Object>();
        
		standardService.deleteVend(map);
		
		retVal.put("result", Result.ok());
		
		return retVal;
	}
	
}
