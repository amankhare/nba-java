package com.can;

import java.io.FileInputStream;
import java.io.FileOutputStream;
//import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.*;
/**
 * Servlet implementation class marsks_eval_co
 */
@WebServlet("/marsks_eval_co")
public class marsks_eval_co extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public marsks_eval_co() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("come here");
		InputStream inp = new FileInputStream("/home/aman/pr2.xlsx");
	    XSSFWorkbook wb = new XSSFWorkbook(inp); 
	    XSSFSheet sheet = wb.getSheetAt(0);
	    XSSFRow row ;
	    for(int i=9;i<63;i++)
		{
		row= sheet.getRow((short) i);
		row.createCell(14).setCellType(XSSFCell.CELL_TYPE_FORMULA);
		row.createCell(14).setCellFormula("SUM(D"+(i+1)+":N"+(i+1)+")" );
		}
	    for(int i=9;i<63;i++)
		{
		row= sheet.getRow((short) i);
		row.createCell(15).setCellType(XSSFCell.CELL_TYPE_FORMULA);
		row.createCell(15).setCellFormula("SUM((D"+(i+1)+":F"+(i+1)+"),IF(J"+(i+1)+"=\"\",0,J"+(i+1)+"),IF(N"+(i+1)+"=\"\",0,N"+(i+1)+"),H"+(i+1)+")/SUM(4,IF(J"+(i+1)+"=\"\",0,10),IF(N"+(i+1)+"=\"\",0,5))");
		}
	    for(int i=9;i<63;i++)
		{
		row= sheet.getRow((short) i);
		row.createCell(16).setCellType(XSSFCell.CELL_TYPE_FORMULA);
		row.createCell(16).setCellFormula("SUM((D"+(i+1)+":F"+(i+1)+"),IF(J"+(i+1)+"=\"\",0,J"+(i+1)+"),IF(N"+(i+1)+"=\"\",0,N"+(i+1)+"),H"+(i+1)+")/SUM(4,IF(J"+(i+1)+"=\"\",0,10),IF(N"+(i+1)+"=\"\",0,5))");
		}
	    //
	    //System.out.println("sheet value:-----"+row);
		FileOutputStream fileOut = new FileOutputStream("pr2.xlsx");
	    wb.write(fileOut);
	    fileOut.close();
		
		response.sendRedirect("/jss_nba/jsp/calculation.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
