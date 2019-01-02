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
         fis = new FileInputStream(reportLocation + "/reports/fonts.jasper");
         bufferedInputStream = new BufferedInputStream(fis);
          
         // fill parameters
         Map<String, Object> map = new HashMap<String, Object>();
         
         map.put("TEST", "㈜  코 텍");
                          
         // export to pdf           
         JasperReport jasperReport = (JasperReport) JRLoader.loadObject(bufferedInputStream);
         JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
           map, new JREmptyDataSource());
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