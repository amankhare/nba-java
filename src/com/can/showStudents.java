package com.can;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.CRUDOperation;

/**
 * Servlet implementation class showStudents
 */
@WebServlet("/showStudents")
public class showStudents extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;PreparedStatement ps1=null,ps=null;ResultSet rs=null;
	HttpSession hs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showStudents() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//HttpSession hs=request.getSession(false);
		String query=request.getParameter("button");
		String strsql="select * from registrationdetail where branch=? and session=?";
		con=CRUDOperation.createConection();
		try
		{
	    String s[]=query.split("@@");
	    if(strsql=="All Branches")
	    	{
	    	strsql="select * from registrationdetail";
	    	ps=con.prepareStatement(strsql);
	    	}
	    else
	    {
			ps=con.prepareStatement(strsql);
			ps.setString(1, s[0]);
			ps.setString(2, s[1]);
			ps.executeUpdate();
			
		}
	    }
		catch(SQLException se)
		{
			System.out.println(se);
		}
		response.sendRedirect("/jss_nba/jsp/admin.jsp");
	}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
