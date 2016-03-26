package com.can;

import java.io.IOException;

import com.dbutil.*;

import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class admin
 */
@WebServlet("/admin")
public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;PreparedStatement ps1=null,ps=null;ResultSet rs=null;
	HttpSession hs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession hs=request.getSession(false);
		String arr[]=request.getParameterValues("chk");
		int l=arr.length;
		String strsql="delete from registrationdetail where loginId=?";
		con=CRUDOperation.createConection();
		try
		{
		//con.setAutoCommit(false);
		for(int i=0;i<l;i++)
		{System.out.println(arr[i]);
		
			ps=con.prepareStatement(strsql);
			ps.setString(1, arr[i].split("@@@@@@@@@@@@@@@@@@@@@@@@@@@")[0]);
			ps.executeUpdate();
			
		}	
	}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		response.sendRedirect("/jss_nba/jsp/admin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession hs=request.getSession(false);
		String arr[]=request.getParameterValues("chk");
		int l=arr.length;
		String strsql="update registrationdetail set status=? where loginId=?";
		con=CRUDOperation.createConection();
		try
		{
		for(int i=0;i<l;i++)
		{
	        String[] s2 = arr[i].split( "@@@@@@@@@@@@@@@@@@@@@@@@@@@" );
	        System.out.println(s2[0]);
	     	System.out.println(s2[0]);
			ps=con.prepareStatement(strsql);
			ps.setString(1, "true");
			ps.setString(2, s2[0]);
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
