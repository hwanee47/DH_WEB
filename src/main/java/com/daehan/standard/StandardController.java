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
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView searchVendList(HttpServletRequest request, ModelMap model) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<HashMap<String,String>> list = standardService.searchVendList();
		
		mv.setViewName("jsonView");
		mv.addObject("result", Result.ok());
		mv.addObject("data", list);
		
		return mv;
	}
	
	
	@RequestMapping(value = "/addVend.do", method = RequestMethod.POST)
	public String addVend(HttpServletRequest request, @RequestParam HashMap<String, Object> map, ModelMap model) throws Exception {
		standardService.addVend(map);
		
		return "redirect:/standard/searchVendList.do";
	}
	
	
	@RequestMapping(value = "/deleteVend.do", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteVend(HttpServletRequest request, @RequestParam HashMap<String, Object> map, ModelMap model) throws Exception{
        Map<String, Object> retVal = new HashMap<String, Object>();
        
		standardService.deleteVend(map);
		
		retVal.put("result", Result.ok());
		
		return retVal;
	}
	
	
	@RequestMapping(value = "/addMaterial.do", method = RequestMethod.POST)
	public String addMaterial(HttpServletRequest request, @RequestParam HashMap<String, Object> map, ModelMap model) throws Exception {
		standardService.addMaterial(map);
		
		return "redirect:/standard/searchMaterialList.do";
	}
	
	
	@RequestMapping(value = "/searchMaterialList.do")
	public ModelAndView searchMaterialList(HttpServletRequest request, ModelMap model) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<HashMap<String,String>> list = standardService.searchMaterialList();
		
		mv.setViewName("jsonView");
		mv.addObject("result", Result.ok());
		mv.addObject("data", list);
		
		return mv;
	}
	
	
	@RequestMapping(value = "/deleteMaterial.do", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteMaterial(HttpServletRequest request, @RequestParam HashMap<String, Object> map, ModelMap model) throws Exception{
        Map<String, Object> retVal = new HashMap<String, Object>();
        
		standardService.deleteMaterial(map);
		
		retVal.put("result", Result.ok());
		
		return retVal;
	}
	
}
