package com.daehan.inventory;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/inventory")
public class InventoryController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(InventoryController.class);
	
	@RequestMapping(value = "/pdf.do")
	public ModelAndView searchVendList(HttpServletRequest request, ModelMap model,ModelAndView modelAndView) throws Exception{
		
		//modelAndView = new ModelAndView("pdfReport" , new HashMap<String, Object>());

        return modelAndView;


	}
	
}
