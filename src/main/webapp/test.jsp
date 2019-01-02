<%@ page language="java" contentType="application/pdf; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.data.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ page import="net.sf.jasperreports.*" %>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
	ServletOutputStream servletOutputStream = response.getOutputStream();  
	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	 
	FileInputStream fis;
	BufferedInputStream bufferedInputStream;
	try{
		out.clear();
		pageContext.pushBody();
         // get report location
         ServletContext context = getServletContext();
         String reportLocation = context.getRealPath("WEB-INF");
          
         // get report
         fis = new FileInputStream(reportLocation + "/reports/report2.jasper");
         bufferedInputStream = new BufferedInputStream(fis);
          
         // fill parameter list
         List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
         
         for(int i=0; i<7; i++)
         {
        	 HashMap<String,String> param = new HashMap<String, String>();
        	 
        	 param.put("CNT", String.valueOf(i));
        	 param.put("TEXT", "GOOD!!");
        
        	 list.add(param);
         }
         
         
         
         
         // fill parameters
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("TEST", "㈜  코 텍");
                          
         // export to pdf           
         JasperReport jasperReport = (JasperReport) JRLoader.loadObject(bufferedInputStream);
        /*  JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
           map, new JREmptyDataSource()); */
         JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map, new JRBeanCollectionDataSource(list));  
         JasperExportManager.exportReportToPdfStream(jasperPrint, baos);
 
         response.setContentLength(baos.size());
         baos.writeTo(servletOutputStream);
 
         // close it
         fis.close();
         bufferedInputStream.close();
		
	}catch (Exception e){
		e.printStackTrace();
	}  
%>