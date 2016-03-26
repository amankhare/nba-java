package com.dbutil;
import java.sql.*;
public class CRUDOperation
{
	private static Connection con = null;
	public static Connection createConection()
	{
		try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root", "root");
		System.out.println(con);
		}
	catch(Exception cse){
		System.out.println(cse);
	}
	return con;
	
}
}
