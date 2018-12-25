package com.daehan.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value = "/com")
public class ComUrlController {
	
	private static final Logger logger = LoggerFactory.getLogger(ComUrlController.class);
	
	@RequestMapping(value = "/pageLink.do")
	public String moveToPage(@RequestParam("link") String linkPage, HttpServletRequest request, ModelMap model) throws Exception{
		
		String link = linkPage;
		
		//메뉴권한을 위해 member객체를 뷰로 보내줌.
		//model.addAttribute("member", request.getSession().getAttribute("member"));
		
		if (linkPage==null || linkPage.equals(""))
		{
			link="error/Error";
		}else {
			if(link.indexOf(",")>-1){
			    link=link.substring(0,link.indexOf(","));
			}
		}
		
		return link;
	}
	
}
