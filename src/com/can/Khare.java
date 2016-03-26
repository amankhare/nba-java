package com.can;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.*;

import com.dbutil.CRUDOperation;
import com.mysql.jdbc.PreparedStatement;

import java.sql.*;
/**
 * Servlet implementation class Khare
 */
@WebServlet("/Khare")
public class Khare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con;java.sql.PreparedStatement ps=null;ResultSet rs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Khare() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession hs=request.getSession(false);
		String branch=(String)hs.getAttribute("branch_inki");
		System.out.println(branch+"  aa gaye hai dekh lo");
		branch=branch.trim().replace(" ", "").toLowerCase();
	    String strsql="select * from "+branch+"pattern";
		XSSFRow row;String s;
		int totalstudents=63,totalquestions=11,numofparts=3;
		FileInputStream fis = new FileInputStream(new File("pr2.xlsx"));
			      XSSFWorkbook workbook = new XSSFWorkbook(fis);
			      XSSFSheet sheet = workbook.getSheetAt(0);
			      //read
			      Iterator rowIterator = sheet.iterator();
			      int i=1,j=0,k=0,maxco=0;
			      int arr[]=new int[totalquestions];
			      int fre[]=new int[totalquestions];
                  //Assuming 10 CO's
			      row=sheet.getRow((short)8);
			        Iterator cellIterator = row.cellIterator();
			         while ( cellIterator.hasNext()) 
			         {  j++;
			            Cell cell = (Cell)cellIterator.next();
			           
			            if(j<4)
				         continue;
				         if(j==15)
				        	 break;
				         s="";
				         System.out.println("haha "+cell.getStringCellValue());
				         s+=cell.getStringCellValue().toLowerCase().trim().charAt(2);
			             arr[k]=Integer.parseInt(s);
			             k++;
			           }			         
			      for (int l = 0; l < arr.length; l++) {
			    	  maxco=Math.max(maxco, arr[l]);
					System.out.println(":--"+arr[l]);
				}
			      System.out.println(":--"+maxco);
			      ArrayList<Integer> ab=new ArrayList<Integer>();
			      for(i=0;i<totalquestions;i++)
			      fre[arr[i]-1]++;
			      for(i=0;i<totalquestions;i++)
			      {
			    	if(fre[i]!=0)
			    	ab.add(i+1);
			      }
			      //now ab arraylist contains unique co numbers
			      int shifting=3+totalquestions;
			      for(i=9;i<=totalstudents;i++)
					{
					row= sheet.getRow((short) i);
					row.createCell(shifting).setCellType(XSSFCell.CELL_TYPE_FORMULA);
					row.createCell(shifting).setCellFormula("SUM(D"+(i+1)+":N"+(i+1)+")" );
					}
			      i=totalquestions+4;// +4 to move the column pointer ahead of total column
			      k=ab.size();
			      int length=k;
			      for(int m:ab)
			      {
			    	row= sheet.getRow((short) 8);//means 7 and it ha to occupy 3 rows
			    	System.out.println("colun no.:-"+i);
			    	row.setHeight((short)900);
			    	row.createCell(i).setCellValue("Avg\nCO"+m);
			    	row.createCell(i+k).setCellValue("%\nCO"+m);
			    	i++;
			      }
			      System.out.println("max co is :----"+maxco);
			      //finding location of every co
			      String ss[]=new String[maxco];
			      row=sheet.getRow((short)8);
			      cellIterator=row.cellIterator();
			      for(int m=0;m<maxco;m++)
			      {
			    	ss[m]="";
			      }
			      i=0;
			      while(cellIterator.hasNext())
			      {
			    	//  ss[i]="";
			    	  i++;
			    	  Cell cell=(Cell)cellIterator.next();
			    	  if(i==(totalquestions+4))
			    		  break;
			    	  if(i<4)
			    		  continue;
			    	  s=cell.getStringCellValue().trim().substring(2);
			    	  ss[Integer.parseInt(s)-1]+=i+"&&%";
			      }
			      i=0;
			      ArrayList<String> coloc=new ArrayList<String>();
			      for(int m=0;m<maxco;m++)
			      {
			    	  if(!ss[m].equals(""))
			    	  {
			    	  System.out.println(ab.get(i)+"----"+ss[m]);
			    	  coloc.add(ss[m]);
			    	  i++;
			      }
			      }
			      
			      // generic calculation
			      //
			      //String partscuplsinanmaxmrks[]=new String[numofparts];
			      con= CRUDOperation.createConection();
			      String upperlowercal[]=new String[k*2];
			      for(i=0;i<(k*2);i++)
			      {
			    	  upperlowercal[i]="SUM(";
			      }
			      try
			      {
			    	  String sk="";
			       ps=con.prepareStatement(strsql);
			       rs= ps.executeQuery();
			       //char position='D';
			       int upperlowercount=0,compulsorycount=0;
			       
			       if(rs.next())
			       {j=0;
			    	   for(int a:ab)
			    	   {
			    	   int checker=3;
			    	   for(i=0;i<rs.getInt("no_ofparts");i++)
					      { compulsorycount=0;   
			    		  	  sk=rs.getString("part"+(i+1));
					    	  String sm[]=sk.trim().split("##");
					    	  //for compulsory section
					    	  if(sm[2].equals("C"))
					    	  {
					    		  System.out.println(j+"  ye hai:---"+coloc.get(j));
					    		  for(String t:coloc.get(j).split("&&%"))
					    			{
					    			  if(!t.equals(""))
					    			  {
					    		  k=Integer.parseInt(t);
					    		  if(k<=(checker+Integer.parseInt(sm[0])) && k>checker)
					    		  {
					    			  compulsorycount++;
					    		upperlowercal[upperlowercount]+=(char)(k+64)+"###,";
					    		  }
					    			  }
					    			  }
					    		  upperlowercal[upperlowercount+1]+=compulsorycount+",";
					    		  
					    		  checker+=Integer.parseInt(sm[0]);
					    		  //upperlowercal
					    		  }
					    		else
					    		{
					    			for(String t:coloc.get(j).split("&&%"))
					    			{
					    				if(!t.equals(""))
					    				{
					    		  k=Integer.parseInt(t);
					    		  if(k<=(checker+Integer.parseInt(sm[0])) && k>checker)
					    		  {
					    		upperlowercal[upperlowercount]+="IF("+(char)(k+64)+"###=\"\",0,"+(char)(k+64)+"###),";
					    		upperlowercal[upperlowercount+1]+="IF("+(char)(k+64)+"###=\"\",0,"+sm[1]+"),";
					    	  }
					    		  }
					    			  
					    			}
					    		  checker+=Integer.parseInt(sm[0]);
					    		  //upperlowercal
					    			}
					    			
					    		}
			    	   			j++;
			    	   			upperlowercount=upperlowercount+2;
					    	  }
			      			       
			       }//end of if
			       }//end of try
			      catch(Exception ex)
			      {
			    	   ex.printStackTrace();
			      }
			      shifting=3+totalquestions+1;
			      ArrayList<String> nk=new ArrayList<String>();
					for(j=0;j<(length*2);j=j+2)
				      {   
			    	  upperlowercal[j]=(upperlowercal[j].substring(0, upperlowercal[j].length()-1 )+")/")+(upperlowercal[j+1].substring(0, upperlowercal[j+1].length()-1 )+")");
     		    	  nk.add(upperlowercal[j]);
     		    	 //System.out.println(upperlowercal[j]);
				      }
					for(i=9;i<=totalstudents;i++)
					{
					int sh2=shifting;
					row= sheet.getRow((short) i);
					for(String mm:nk)
					{
					row.createCell(sh2).setCellType(XSSFCell.CELL_TYPE_FORMULA);
	   	    	    row.createCell(sh2).setCellFormula(mm.replace("###", ""+(i+1)));
	   	    	    row.createCell(sh2+length).setCellType(XSSFCell.CELL_TYPE_FORMULA);
	   	    	    row.createCell(sh2+length).setCellFormula((char)(64+sh2+1)+""+(i+1)+"*100");//+1 in sh2 because shifting is according to 0th cell while char position is to be taken according to 1 so we need to add 1
	   	    	    sh2++;
					}
					}
					
			      
			      FileOutputStream fileOut = new FileOutputStream("pr2.xlsx");
				    workbook.write(fileOut);
				    fileOut.close();
				      
			   }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
