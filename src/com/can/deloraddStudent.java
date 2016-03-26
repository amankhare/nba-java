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
 * Servlet implementation class deloraddStudent
 */
@WebServlet("/deloraddStudent")
public class deloraddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;PreparedStatement ps1=null,ps=null;ResultSet rs=null;
	HttpSession hs=null;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deloraddStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//delete students
		HttpSession hs=request.getSession(false);
		String arr[]=request.getParameterValues("chk");
		int l=arr.length;
		String strsql="delete from students where universityNum=?";
		con=CRUDOperation.createConection();
		try
		{
		//con.setAutoCommit(false);
		for(int i=0;i<l;i++)
		{		
			ps=con.prepareStatement(strsql);
			ps.setString(1, arr[i]);
			ps.executeUpdate();
			
		}	
	}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		response.sendRedirect("/jss_nba/jsp/showStudents.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession hs=request.getSession(false);
		String name=request.getParameter("name");
		String u=request.getParameter("universityNum");
		String b=request.getParameter("branch");
		String se=request.getParameter("session");
		String s=request.getParameter("nsection");
		String strsql="insert into students values(?,?,?,?,?)";
		con=CRUDOperation.createConection();
		try
		{
			ps=con.prepareStatement(strsql);
			ps.setString(1, name);
			ps.setString(2, u);
			ps.setString(3, b);
			ps.setString(4, se);
			ps.setString(5, s);
			ps.executeUpdate();
			
			
	}
		catch(SQLException sx)
		{
			System.out.println(sx);
		}
		response.sendRedirect("/jss_nba/jsp/showStudents.jsp");
	}

	}


