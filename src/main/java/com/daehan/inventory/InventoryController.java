package com.daehan.inventory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daehan.common.model.Report;
import com.daehan.common.model.Result;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/inventory")
public class InventoryController {
	List<Report> resultlist = new ArrayList<Report>();
	
	private static final Logger logger = LoggerFactory.getLogger(InventoryController.class);
	
	@RequestMapping(value = "/report.do")
	public ModelAndView searchVendList(HttpServletRequest request) throws Exception{
		
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		
		JRDataSource JRdataSource = new JRBeanCollectionDataSource(resultlist);
		//detail data setting. jrDataSource is defined as reportDataKey in servlet-context.sml
		parameterMap.put("jrDataSource", JRdataSource);
		//subReport url setting
		parameterMap.put("reportUrl", request.getSession().getServletContext().getRealPath("WEB-INF")+"/reports/");
		
		ModelAndView mv=new ModelAndView("JasperReportTest", parameterMap); 
		mv.addObject("format", "pdf");
		
		return mv;
	}
	
	@RequestMapping(value = "/setReportData.do", method = RequestMethod.POST)
	public ModelAndView setReportData(HttpServletRequest request, @RequestParam HashMap<String, Object> map) throws Exception{
		resultlist.clear();
		
		// fill parameter list
        List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
        

        JSONArray nameArray = (JSONArray) JSONSerializer.toJSON(map.get("LIST"));
        for(Object js : nameArray){
        	HashMap<String,String> param = new HashMap<String, String>();
            JSONObject json = (JSONObject) js;
            param.put("SEQ",(String) json.get("SEQ"));
            param.put("MODEL",(String) json.get("MODEL"));
            param.put("ITEM_NAME",(String) json.get("ITEM_NAME"));
            param.put("ITEM_NUMBER",(String) json.get("ITEM_NUMBER"));
            param.put("QTY",(String) json.get("QTY")+"EA");
            param.put("DT",(String) json.get("DT"));
            
            list.add(param);
        }
        
        for(int i=nameArray.size()+1; i<10; i++) {
        	HashMap<String,String> param = new HashMap<String, String>();
        	param.put("SEQ",String.valueOf(i));
            param.put("MODEL","");
            param.put("ITEM_NAME","");
            param.put("ITEM_NUMBER","");
            param.put("QTY","");
            param.put("DT","");
        	list.add(param);
        }
        
        Report report = new Report();
        report.setVendName((String)map.get("VEND_NAME"));
        report.setList(list);
        report.setRemark((String)map.get("REMARK"));
        
        
        resultlist.add(report);
        
        ModelAndView mv = new ModelAndView();
		
		mv.setViewName("jsonView");
		mv.addObject("result", Result.ok());
		
		return mv;
	}
}
