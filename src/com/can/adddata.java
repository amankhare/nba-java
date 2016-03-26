package com.can;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.io.InputStream;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.dbutil.CRUDOperation;

/**
 * Servlet implementation class adddata
 */
@WebServlet("/adddata")
public class adddata extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;PreparedStatement ps1=null,ps=null;ResultSet rs=null;
	HttpSession hs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adddata() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		XSSFRow row;
		
		FileInputStream fis = new FileInputStream(new File("Book1.xlsx"));
	      XSSFWorkbook workbook = new XSSFWorkbook(fis);
	      XSSFSheet spreadsheet = workbook.getSheetAt(0);
	      //read
	      String s="";
	      int i=0;
	      Iterator rowIterator = spreadsheet.iterator();
	      String strsql="insert into students values(?,?,?,?,?)";
			con=CRUDOperation.createConection();
			try
			{
	      while (rowIterator.hasNext()) 
	      {
	       row = (XSSFRow)rowIterator.next();
	       if(i==0)
	       {i++;
	    	   continue;
	       }
           Iterator cellIterator = row.cellIterator();
           s="";
	         while ( cellIterator.hasNext()) 
	         {  
	            Cell cell = (Cell)cellIterator.next();
	            switch (cell.getCellType()) 
	            {
	               case Cell.CELL_TYPE_NUMERIC:
	               s+=(long)cell.getNumericCellValue()+"@@";
	               break;
	               case Cell.CELL_TYPE_STRING:
	               s+=cell.getStringCellValue()+"@@";
	               break;
	            }
	         }
	            System.out.println(s);
	            String k[]=s.split("@@");
	            ps=con.prepareStatement(strsql);
				ps.setString(1, k[0]);
				ps.setString(2, k[1]);
				ps.setString(3, k[2]);
				ps.setString(4, k[3]);
				ps.setString(5, k[4]);
				ps.executeUpdate();
	          
	}
	         
			}
			catch(Exception exe)
			{
				exe.printStackTrace();
			}
	      fis.close();
	      }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
