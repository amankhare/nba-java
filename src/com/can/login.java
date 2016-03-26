//THIS PAGE WILL CHECK FOR ADMIN,TEACHER OR STUDENT TYPE LOGIN AND REDIRECT ACCORDINGLY
package com.can;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbutil.CRUDOperation;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	Connection con=null;
	ResultSet rs;
	PreparedStatement ps;
	HttpSession hs=null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginid=request.getParameter("loginid");
		System.out.println(loginid);
		String password=request.getParameter("password");
		String strsql="select * from registrationdetail where loginid=? and password=?";
		con=(Connection)CRUDOperation.createConection();
		try
	    {
			con.setAutoCommit(false);
			ps=con.prepareStatement(strsql);
			ps.setString(1, loginid);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next())
			{
				System.out.print("rs value is="+rs);
				hs=request.getSession();
				hs.setAttribute("loginid", loginid);
				hs.setAttribute("name", rs.getString("name"));
				hs.setAttribute("branch_inki", rs.getString("branch"));
				String p=rs.getString("type");
				if(("true").equals(rs.getString("status")))
				{
					if(p.equals("admin"))
						response.sendRedirect("/jss_nba/jsp/admin.jsp");
				else
					if(p.equals("teacher"))
							response.sendRedirect("/jss_nba/jsp/Teacher.jsp");
					else
					response.sendRedirect("/jss_nba/jsp/student.jsp");
				}
			else
				response.sendRedirect("/jss_nba/html/index.html?unauthorized access");
	    }
			else
				response.sendRedirect("/jss_nba/html/sample.html?unauthorized access");
			}
		catch(SQLException e)
		{
		System.out.print(e);
		}			
			}
	    }
		