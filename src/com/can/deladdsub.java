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
 * Servlet implementation class deladdsub
 */
@WebServlet("/deladdsub")
public class deladdsub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con;PreparedStatement ps1,ps2;ResultSet rs1,rs2;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deladdsub() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("reached here");
		HttpSession hs=request.getSession(false);
		String userid=(String)hs.getAttribute("loginid");
		String code=request.getParameter("us");
		String strsql1="select * from subjects where code=?";
		String strsql2="insert into followedSub values(?,?,?,?)";
		con=(Connection)CRUDOperation.createConection();
		System.out.println("reached on sub code "+code);
		try
		{   PrintWriter out=response.getWriter();
			ps1=con.prepareStatement(strsql1);
		ps2=con.prepareStatement(strsql2);
		ps1.setString(1, code);
		rs1=ps1.executeQuery();
		rs1.next();
		ps2.setString(1, userid);
		ps2.setString(2, rs1.getString("code"));
		ps2.setString(3, rs1.getString("branch"));
		ps2.setString(4, rs1.getString("name"));
		ps2.executeUpdate();
		out.println("Added To List");
		}
		catch(Exception se)
		{
			se.printStackTrace();
			}
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("reached here");
		HttpSession hs=request.getSession(false);
		String userid=(String)hs.getAttribute("loginid");
		String code=request.getParameter("us");
		String strsql1="delete from followedSub where loginId=? and subjId=?";
		con=(Connection)CRUDOperation.createConection();
		System.out.println("reached on sub code "+code);
		try
		{PrintWriter out=response.getWriter();
			ps1=con.prepareStatement(strsql1);
			ps1.setString(1, userid);
		ps1.setString(2, code);
			ps1.executeUpdate();
		
		out.println("Deleted");
		}
		catch(Exception se)
		{
			se.printStackTrace();
			}
		
	}

}
