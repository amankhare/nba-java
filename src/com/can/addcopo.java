package com.can;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.CRUDOperation;

/**
 * Servlet implementation class addcopo
 */
@WebServlet("/addcopo")
public class addcopo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement reginsert,pslogin,psreg=null,ps;
       ResultSet rs;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addcopo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession hs=request.getSession(false);
		String text=request.getParameter("textco");
		String code=(String)hs.getAttribute("code");
		
		String userid=(String)hs.getAttribute("loginid");
		System.out.print(userid+" id at co station ");
		System.out.print(code+" code at co station ");
		con=CRUDOperation.createConection();
		try
	    {
			String strsql1="select count(*) from "+code;
			 ps=con.prepareStatement(strsql1);
			 rs=ps.executeQuery();
			 rs.next();
			 System.out.println("reached");
			 String ss="CO"+(rs.getInt(1)+1);
			 System.out.println("look at this --this has to be new co :---"+ss);
			 String strsql="insert into "+code+" values(?,?)";
			 ps=con.prepareStatement(strsql);
			    ps.setString(1,ss);
			    ps.setString(2,text);
			    ps.executeUpdate();
	    }
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		response.sendRedirect("/jss_nba/jsp/co.jsp?"+code);
	    /**/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// TODO Auto-generated method stub
		HttpSession hs=request.getSession(false);
		String text=request.getParameter("textpo");
		String code=(String)hs.getAttribute("code");
		String ss[]=text.split(":-");
		String userid=(String)hs.getAttribute("loginid");
		System.out.print(userid+" id at po station ");
		System.out.print(code+" code at po station ");
		con=CRUDOperation.createConection();
		try
	    {
			 String strsql="insert into pos values(?,?)";
			 ps=con.prepareStatement(strsql);
			    ps.setString(1,ss[0]);
			    ps.setString(2,ss[1]);
			    ps.executeUpdate();
	    }
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		response.sendRedirect("/jss_nba/jsp/co.jsp?"+code);
	    /**/
	}
	}


