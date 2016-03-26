package com.can;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.*;


/**
 * Servlet implementation class Cocal1_2
 */
@WebServlet("/Cocal1_2")
public class Cocal1_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cocal1_2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("aagaya");
/*		  XSSFWorkbook workbook = new XSSFWorkbook(); 
	      XSSFSheet spreadsheet = workbook.createSheet("Project1");
	      XSSFRow row = spreadsheet.createRow((short) 0); //creating row
	      row.createCell(0).setCellValue("CO");
	      for(int i=1;i<12;i++)
	      {
	      row.createCell(i).setCellValue("PO"+i);
		  row.createCell(2).setCellValue("PO2");
		  row.createCell(3).setCellValue("PO3");
		  row.createCell(4).setCellValue("PO4");
		  row.createCell(5).setCellValue("PO5");
		  row.createCell(6).setCellValue("PO6");
		  row.createCell(7).setCellValue("PO7");
		  row.createCell(8).setCellValue("PO8");
		  row.createCell(9).setCellValue("PO9");
		  row.createCell(10).setCellValue("PO10");
		  row.createCell(11).setCellValue("PO11");
		  row.createCell(12).setCellValue("PO12");
	      
	      }
		  for(int i=1;i<8;i++)
		  {
	      row = spreadsheet.createRow((short) i);
	      row.createCell(0).setCellValue("ECS801.1amamammmmmmmmmmmmmmmmmmmmmmmmmmmm");
	      //row.createCell(1);
	      row = spreadsheet.createRow((short) 2);
	      row.createCell(0).setCellValue("ECS801.2fdaskjajsfkj");
	      //row.createCell(1).setCellValue(true);
	      row = spreadsheet.createRow((short) 3);
	      row.createCell(0).setCellValue("ECS801.3");
	      //row.createCell(1).setCellValue(XSSFCell.CELL_TYPE_ERROR );
	      row = spreadsheet.createRow((short) 4);
	      row.createCell(0).setCellValue("ECS801.4");
	      //row.createCell(1).setCellValue(new Date());
	      row = spreadsheet.createRow((short) 5);
	      row.createCell(0).setCellValue("ECS801.5" );
	      //row.createCell(1).setCellValue(20 );
	      row = spreadsheet.createRow((short) 6);
	      row.createCell(0).setCellValue("ECS801.6");
	      //row.createCell(1).setCellValue("A String");
		  row = spreadsheet.createRow((short) 7);
	      row.createCell(0).setCellValue("ECS801.7");
		  }
		  //int rows = spreadsheet.getPhysicalNumberOfRows(); // or sheet.getLastRowNum();
		  row = spreadsheet.createRow((short) 8);
	      row.createCell(0).setCellValue("ECS801");
		  */
		InputStream inp = new FileInputStream("/home/aman/Project1.xlsx");
	    XSSFWorkbook wb = new XSSFWorkbook(inp); 
	    XSSFSheet sheet = wb.getSheetAt(0);
		XSSFRow row1 = sheet.getRow((short) 8);
	    //Row row = sheet.getRow(8);
	    //Cell cell1 = row.getCell(1);
		//row1.createCell(1)
	    //String cellContents = cell.getStringCellValue(); 
	    //Modify the cellContents here
		
		  row1.createCell(1).setCellType(XSSFCell.CELL_TYPE_FORMULA);
	      row1.createCell(1).setCellFormula("AVERAGE(B1:B8)" );
		  row1.createCell(2).setCellFormula("AVERAGE(C1:C8)" );
		  row1.createCell(3).setCellFormula("AVERAGE(D1:D8)" );
		  row1.createCell(4).setCellFormula("AVERAGE(E1:E8)" );
		  row1.createCell(5).setCellFormula("AVERAGE(F1:F8)" );
		  row1.createCell(6).setCellFormula("AVERAGE(G1:G8)" );
		  row1.createCell(7).setCellFormula("AVERAGE(H1:H8)" );
		  row1.createCell(8).setCellFormula("AVERAGE(I1:I8)" );
		  row1.createCell(9).setCellFormula("AVERAGE(J1:J8)" );
		  row1.createCell(10).setCellFormula("AVERAGE(K1:K8)" );
		  row1.createCell(11).setCellFormula("AVERAGE(L1:L8)" );
		  row1.createCell(12).setCellFormula("AVERAGE(M1:M8)" );
	     System.out.println(row1);
		  //cell = row.createCell(3);
	      //cell.setCellValue("SUM(C2:C3)");
		
		//row1.createCell(1).setCellType(XSSFCell.CELL_TYPE_FORMULA);
		//row1.createCell(1).setCellValue("AVERAGE(B2:B8)");
	    // Write the output to a file
		
		//cellContents ="1000000";
		 //row.createCell(1).setCellType(XSSFCell.CELL_TYPE_FORMULA);
		  //row.createCell(1).setCellValue("AVERAGE(B2:B8)");
		  
	    //cell.setCellValue(cellContents);

		/*for(int i=1;i<=12;i++){
			row1.createCell(i).setCellType(XSSFCell.CELL_TYPE_FORMULA);
			row1.createCell(i).setCellValue("AVERAGE(B2:B8)");
		}
		*/
		
	   // row1.createCell(1).setCellValue("Hi");
		FileOutputStream fileOut = new FileOutputStream("Project1.xlsx");
	    wb.write(fileOut);
	    fileOut.close();
		  
		   // Create SUM formula
	      //row.createCell(1).setCellType(XSSFCell.CELL_TYPE_FORMULA);
		  //row.createCell(1).setCellValue("AVERAGE(B2:B8)");
		  /*;
		  row.createCell(2).setCellValue("ECS801");
		  row.createCell(3).setCellValue("ECS801");
		  row.createCell(4).setCellValue("ECS801");
		  row.createCell(5).setCellValue("ECS801");
		  row.createCell(6).setCellValue("ECS801");
		  row.createCell(7).setCellValue("ECS801");
		  row.createCell(8).setCellValue("ECS801");
		  row.createCell(9).setCellValue("ECS801");
		  row.createCell(10).setCellValue("ECS801");
		  row.createCell(11).setCellValue("ECS801");
		  row.createCell(12).setCellValue("ECS801");
		  
		  */
		  
		  /*
	      FileOutputStream out = new FileOutputStream(
	      new File("Project1.xlsx"));
	      workbook.write(out);
	      out.close();
	      System.out.println(
	      "Project1.xlsx written successfully");
	   */
	    response.sendRedirect("/jss_nba/jsp/calculation.jsp");
	   }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
