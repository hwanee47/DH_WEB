<%@ page language="java" contentType="application/pdf; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.data.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ page import="net.sf.jasperreports.*" %>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.daehan.common.model.Report" %>

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
         fis = new FileInputStream(reportLocation + "/reports/main.jasper");
         bufferedInputStream = new BufferedInputStream(fis);
          
         // fill parameter list
         List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
         
         for(int i=0; i<7; i++)
         {
        	 HashMap<String,String> param = new HashMap<String, String>();
        	 
        	 param.put("cnt", String.valueOf(i));
        	 param.put("text", "한글한글!!#$");
        
        	 list.add(param);
         }
         
         Report report = new Report();
         report.setTest("MAIN!!!!2");
         report.setList(list);
         
         
         List<Report> resultlist = new ArrayList<Report>();
         
         resultlist.add(report);
         
         Map<String, Object> parameters = new HashMap<String, Object>();
		 parameters.put("reportUrl", reportLocation+"\\reports\\");
		 System.out.println(reportLocation+"\\reports\\subReport1.jasper");
		 
         // export to pdf           
         JasperReport jasperReport = (JasperReport) JRLoader.loadObject(bufferedInputStream);
        /*  JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
           map, new JREmptyDataSource()); */
         JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(resultlist));  
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