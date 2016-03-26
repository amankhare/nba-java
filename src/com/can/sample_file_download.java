package com.can;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.*;

import com.dbutil.CRUDOperation;
import com.mysql.jdbc.*;


/**
 * Servlet implementation class sample_file_download
 */
@WebServlet("/sample_file_download")
public class sample_file_download extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs;
	PreparedStatement ps;
	HttpSession hs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sample_file_download() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		String name=(String)hs.getAttribute("name");
	    String branch=(String)hs.getAttribute("branch_inki");
	    String filename="";
	    System.out.println("haji  "+branch);
	    XSSFWorkbook workbook = new XSSFWorkbook();
	    String a="",errorhandler="";
	    String s[]={"am","am","am"};
	    int l=0;
	    while(true)
	    {
	    	l++;
	    a=request.getParameter("ak");
	    if(a!=null)
	    {
	    System.out.println(":-"+a);
	    s=a.split("@@");
		System.out.println(":-"+s[1]);
		errorhandler=s[1];
		System.out.println(s[0]+""+s[1]+""+name);
		filename=(s[0]+"_"+name+"_"+s[2]+"").toLowerCase();
	    XSSFSheet spreadsheet = workbook.createSheet(filename);
		XSSFRow row = spreadsheet.createRow((short) 0);
		row.createCell(1).setCellValue("Dept:");
	    row.createCell(2).setCellValue(s[2]);
	    row = spreadsheet.createRow((short) 1);
		row.createCell(1).setCellValue("Sem/Section");
	    row.createCell(2).setCellValue(s[1]);
	    row = spreadsheet.createRow((short) 2);
		row.createCell(1).setCellValue("Faculty:-");
	    row.createCell(2).setCellValue(name);
	    row = spreadsheet.createRow((short) 3);
		row.createCell(1).setCellValue(s[0]);
		row = spreadsheet.createRow((short) 5);
		row.createCell(0).setCellValue("Sl.No.");
		row.createCell(1).setCellValue("Roll No.");
		row.createCell(2).setCellValue("Name of Student");
		row.createCell(3).setCellValue("Part A");
		row.createCell(4).setCellValue("(1x5)");
		row.createCell(8).setCellValue("Part B");
		row.createCell(9).setCellValue("(10x1)");
		row.createCell(10).setCellValue("Part C");
		row.createCell(11).setCellValue("(5x3)");
		row.createCell(14).setCellValue("Total");
		row = spreadsheet.createRow((short) 6);
		XSSFRow row1=spreadsheet.createRow((short) 7);
		for(int i=3;i<14;i++)
		{
			row.createCell(i).setCellValue(i-2);
			row1.createCell(i).setCellValue("CO");
		}
		int i=1,j=8;
		String strsql="select * from students where branch=? and session=?";
	   
		System.out.println("only for sql "+errorhandler);
		con=(Connection)CRUDOperation.createConection();
	      try
	      {  //PrintWriter out=response.getWriter();
	    	 ps=con.prepareStatement(strsql);
	    	 ps.setString(1, s[2]);
	    	 ps.setString(2, errorhandler);
	    	 rs=ps.executeQuery();
	    	 while(rs.next())
	    	 {
	    		 row = spreadsheet.createRow((short) j);
	    		 row.createCell(0).setCellValue(i);
	    		 row.createCell(1).setCellValue(rs.getString("universityNum"));
	    		 row.createCell(2).setCellValue(rs.getString("name"));
	    		 j++;
	    		 i++;
	    	 }
	    	 row = spreadsheet.createRow((short) j);
    		 row.createCell(2).setCellValue("Average");
    		 filename=filename+".xlsx";
		 FileOutputStream out = new FileOutputStream(new File(filename));
			      workbook.write(out);
			      out.close();
			      workbook.close();
			         
				 
		  }
	      catch(Exception se)
	      {
	    	  System.out.println("banged");
	    	  se.printStackTrace();
	    	  
	      }
	      
	     System.out.println("if");
	      //return;
	    }//end of if
	    System.out.println("while");
	    break;
	   // return;
	    }// end of while
	    filename="cia _steve_computer science.xlsx";
	    response.setContentType("text/html");
	      response.setContentType("APPLICATION/OCTET-STREAM");   
	      response.setHeader("Content-Disposition","attachment; filename=\"" + "cia _steve_computer science.xlsx"+ "\"");
	   System.out.println(filename);
	    PrintWriter aman=response.getWriter();
		FileInputStream fileInputStream = new FileInputStream(filename);  
        int m;
        while ((m=fileInputStream.read()) != -1) {
        	
	    aman.println("hey");
        }
      System.out.println(aman);
      fileInputStream.close();
	}
	  

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}} 
	    
	             
	   