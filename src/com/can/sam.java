package com.can;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class sam
 */
@WebServlet("/sam")
public class sam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String filename="",saviour="";
		HttpSession hs=request.getSession(false);
		String name=(String)hs.getAttribute("name");
		String s[]={"","",""};
		int l=0;
		while(true)
	    {
			l=0;
	    filename=request.getParameter("us");
	    if(filename!=null)
	    {
		s=filename.split("@@");
		System.out.println(s[1]);
	    filename=(s[0]+"_"+name+"_"+s[1]+".xlsx").toLowerCase();
	    saviour=filename;
	    System.out.println("at get filename is +"+filename);
		l=1;
       break;
	}
		break;
	    }
		System.out.println("sssssssssssssssssssssss "+saviour);
		 response.setContentType("text/html");
	      response.setContentType("APPLICATION/OCTET-STREAM");   
	      response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");
	   System.out.println(filename);
	    PrintWriter aman=response.getWriter();
		FileInputStream fileInputStream = new FileInputStream(filename);  
       int m;
       while ((m=fileInputStream.read()) != -1) {
       	
	    aman.println(m);
       }
     System.out.println(aman);
     fileInputStream.close();
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
