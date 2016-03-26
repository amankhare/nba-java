<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="/jss_nba/jsp/errorPage.jsp"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,com.dbutil.*,com.can.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500' rel='stylesheet' type='text/css'> 
		<link href='http://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'> 
		<link rel="stylesheet" href="/jss_nba/bootstrap/inc/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/jss_nba/bootstrap/inc/animations/css/animate.min.css">
		<link rel="stylesheet" href="/jss_nba/bootstrap/inc/font-awesome/css/font-awesome.min.css"> <!-- Font Icons -->
		<link rel="stylesheet" href="/jss_nba/bootstrap/inc/owl-carousel/css/owl.carousel.css">
		<link rel="stylesheet" href="/jss_nba/bootstrap/inc/owl-carousel/css/owl.theme.css">

		<!-- Theme CSS -->
        <link rel="stylesheet" href="/jss_nba/bootstrap/css/reset.css">
		<link rel="stylesheet" href="/jss_nba/bootstrap/css/style.css">
		<link rel="stylesheet" href="/jss_nba/bootstrap/css/mobile.css">

		<!-- Skin CSS -->
		<link rel="stylesheet" href="/jss_nba/bootstrap/css/skin/cool-gray.css">
		<header id="header" class="header-main">

                <!-- Begin Navbar -->
                <nav id="main-navbar" class="navbar navbar-default navbar-fixed-top" role="navigation"> <!-- Classes: navbar-default, navbar-inverse, navbar-fixed-top, navbar-fixed-bottom, navbar-transparent. Note: If you use non-transparent navbar, set "height: 98px;" to #header -->

                  <div class="container">

                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                      <a class="navbar-brand page-scroll wow zoomIn" href="/jss_nba/jsp/Teacher.jsp">JSS-NBA</a>
                    </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                        <li class="dopdown">
                        <a href="#" class="dropdown-toggle wow bounceInLeft" data-toggle="dropdown">Account<b class="caret"></b></a>
			             <ul class="dropdown-menu">
			    <li><a class="page-scroll wow zoomIn"  data-wow-delay="0.1s" href="#about-section">Inbox</a></li>
			    <li><a class="page-scroll wow zoomIn"  data-wow-delay="0.2s" href="#about-section">Sent Box</a></li>
                <li class="devider"></li>
                <li><a class="page-scroll wow shake" data-wow-delay="0.2s" href="/jss_nba/jsp/LogOut.jsp">Log Out</a></li>
                    </ul>
                    </li>
                    </ul>
                    </div><!-- /.navbar-collapse -->
                  </div><!-- /.container -->
                </nav>
                            </header>
<script type="text/javascript">
var cia;
var year;
var branch,action;
function clickedcia(a)
{
	cia=a;
	if(a!="")
		{
	document.getElementById("branch").style.display="block";
		}
	document.getElementById("sam").style.display="none";
	document.getElementById("text3").style.display="none";
	//document.getElementById("sam2").style.display="none";
	document.getElementById("eval").style.display="none";
	document.getElementById("maineval").style.display="none";
	document.getElementById("uploadclicked").style.display="none";
}
function clickedbranch(a)
{	branch=a;
	document.getElementById("sam").style.display="none";
	document.getElementById("eval").style.display="none";
	document.getElementById("uploadclicked").style.display="none";
	document.getElementById("saal").style.display="block";
	//document.getElementById("sam2").style.display="none";
	document.getElementById("text3").style.display="none";
	document.getElementById("maineval").style.display="none";
	}
 function evaluation(a)
 {
	 action=a;
	 if(a=="COPO")
		 document.getElementById("_p_").innerHTML="CO & PO ATTAINMENT<b class='caret'></b>"
		 else
			 document.getElementById("_p_").innerHTML="CIA ANALYSIS<b class='caret'></b>"
	 document.getElementById("uploadclicked").style.display="block";
	 document.getElementById("maineval").style.display="none";
	 document.getElementById("text3").style.display="none";
		//document.getElementById("sam2").style.display="none";
 }
 function clickedyear(a)
 {
	 year=a;
	 document.getElementById("text3").style.display="none";
	 document.getElementById("_p_").innerHTML="ACTION<b class='caret'></b>";
	 document.getElementById("maineval").style.display="none";
	 document.getElementById("uploadclicked").style.display="none";
	 document.getElementById("text").style.display="none";
	//document.getElementById("sam2").style.display="none";
	 if(year!="")
		 {
		 document.getElementById("text3").style.display="none";
	 document.getElementById("sam").style.display="block";
		document.getElementById("eval").style.display="block";
		//document.getElementById("sam2").style.display="none";
		 }
 }
 function showbuttoneval()
 {   document.getElementById("text3").style.display="none";
	 document.getElementById("maineval").style.display="block";
	 //document.getElementById("sam2").style.display="block";
 }
function onsample() 
{
	
	var x;
	if (XMLHttpRequest)
	{
	x=new XMLHttpRequest();
	}
	x.onreadystatechange=function()
	{
		
		if(x.readyState==4 && x.status==200)
		{var info=x.responseText;
			//alert("aa");
		document.getElementById("msgtxt").innerHTML="Success!!!";
		document.getElementById("text").style.display="block";
		//document.getElementById("sam2").style.display="block";
		}
	}
	s=cia+"@@"+year+"@@"+branch;
	document.getElementById("text3").style.display="none";
	//alert(s);
	x.open("GET","/jss_nba/sample_file_download?ak="+s,true);
	x.send(null);
}
 
function onsample2() 
{
	var x;
	document.getElementById("text3").style.display="none";
	if (XMLHttpRequest)
	{
	x=new XMLHttpRequest();
	}
	x.onreadystatechange=function()
	{
		
		if(x.readyState==4 && x.status==200)
		{//var info=x.responseText;
			//alert("aa");
		document.getElementById("msgtxt2").innerHTML="Success!!";
		document.getElementById("text2").style.display="block";
		}
	}
	s=cia+"@@"+branch;
	//alert(s);
	x.open("GET","/jss_nba/sam?us="+s,true);
	x.send(null);	
		
}
function ajaxwork()
{
	var x;
	if(XMLHttpRequest)
		{
		x=new XMLHttpRequest();
		}
	x.onreadyststechange=function()
	{
		if(x.readyState==4 && x.status==200)
				{
			document.getElementById("text3").style.display="block";
			document.getElementById("msgtxt3").innerHtml="Evaluation complete";
				}
	}
		x.open("GET","/jss_nba/Khare",true);
		x.send(null);
	
	}
                            
</script>

</head>
<body style="background-image: url('/jss_nba/images/1.jpg	');background-size: 100% 650px;">
<div style="background-image:url('/jss_nba/images/9.jpg');background-repeat:no-repeat; height:130px;"></div>
<%Connection con=null; ResultSet rs,rs1,rs0,rs2; PreparedStatement ps,ps1,ps0,ps2;
HttpSession hs=request.getSession(false);
hs.setAttribute("type1", "Teacher");
String branch=(String)hs.getAttribute("branch_inki");
String userid=(String)hs.getAttribute("loginid");
if(userid!=null)
{
String s=(String)hs.getAttribute("name");
%>
<div class="container">
<div style="float:left;width:200px;height:100%;text-align: center;text-decoration: underline;position:absolute;">
<div ><a href="/jss_nba/jsp/uploadpic.jsp"><img style="height:150px;width:150px;" class="wow zoomIn" src="/jss_nba/images/2.jpg"></a></div>
<div style="height: 20px;"></div>
<div class="wow bounceInLeft" data-wow-toggle="0.2s" style="height: 20px;" ><a href="/jss_nba/jsp/Teacher.jsp">Home</a></div>
<div class="wow shake" data-wow-toggle="1.3s" style="height: 20px;" ><a href="/jss_nba/jsp/calculation.jsp">Calculation</a></div>
<div class="wow bounceInRight" data-wow-toggle="0.4s" style="height: 20px;" ><a href="/jss_nba/jsp/followSub.jsp">Subjects</a></div>
<div class="wow bounceInLeft" data-wow-toggle="0.2s "style="height: 20px;" ><a href="/jss_nba/jsp/composeMail.jsp?Teacher">Compose</a></div>
<div class="wow bounceInRight" data-wow-toggle="0.4s "style="height: 20px;" ><a href="/jss_nba/jsp/editinfo.jsp?Teacher">Edit info</a></div>
</div>
<div class="page-header text-center wow zoomIn">
<h5 style="text-decoration: underline;">Evaluation</h5>
<div class="devider"></div>
<p class="subtitle">Download a sample sheet to know more.</p>
</div>
<div style="left:33%;position: relative;">
<select onchange="clickedsub(this.value)" class="form-group wow bounceInLeft">
<option >Select Subject</option>
<%
System.out.println("branch  :--"+branch);
String str="select * from branch";
con=CRUDOperation.createConection();
String pp="select * from subjects where branch=?";
try
{
	ps1=con.prepareStatement(pp);
	ps1.setString(1, branch);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
%>
<option><%=rs1.getString("name") %></option>
<%
}}
catch(Exception ex)
{
	ex.printStackTrace();
	}
%>
</select>
</div>
<div style="left:33%;position: relative;">
<select onchange="clickedcia(this.value)" class="form-group wow bounceInLeft">
<option >Select</option>
<option >CIA 1</option>
<option >CIA 2</option>
<option >CIA 3</option>
</select>
</div>
<div style="display: none;left:33%;position: relative;" id="branch">
<select onchange="clickedbranch(this.value)" class="form-group wow bounceInRight">
<option >Branch</option>
<%
try
{
	ps=con.prepareStatement(str);
    rs=ps.executeQuery();
    while(rs.next())
    {
%>
<option><%=rs.getString("branch") %></option>
<%}}
catch(Exception c)
{
	c.printStackTrace();
	}
%>
</select>
</div>
<div id="saal" style="display:none;left:33%;position: relative;">
<select onchange="clickedyear(this.value)" class="form-group wow bounceInLeft">
<option value="">Year</option>
<option >2012-16</option>
<option >2013-17</option>
<option >2014-18</option>
<option >2015-19</option>
</select>
</div>
<form id="aa">
</form>
<div style="display:none;left:33%;position: relative;" id="sam">
<button form="aa" formaction="/jss_nba/sample_file_download" formmethod="get" onclick="onsample()" class="btn btn-primary wow fadeInDown btn-sm" >Create Sample Sheet</button>
</div>
<div style="display:none;left:33%;position: relative;" id="text"><p id="msgtxt" class="subtitle"></p></div>
<div style="display:none;left:33%;position: relative;" id="sam2">
<button form="aa" formaction="/jss_nba/sam" formmethod="get" onclick="onsample2()" class="btn btn-primary wow fadeInDown btn-sm" >Download Sample Sheet</button>
</div>
<div style="display:none;left:33%;position: relative;" id="text2"><p id="msgtxt2" class="subtitle"></p></div>
<div style="display: none;position: relative;left: 29%;" class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul id="eval" style="display: none;" class="nav navbar-nav navbar-left">
                        <li class="dopdown">
                        <a href="#" class="dropdown-toggle wow bounceInLeft" id="_p_" data-toggle="dropdown">Action<b class="caret"></b></a>
			             <ul class="dropdown-menu">
			           <li><a href="#" class="page-scroll wow zoomIn" onclick="evaluation('COPO')" data-wow-delay="0.1s">CO & PO Attainment</a></li>
			           <li><a href="#" class="page-scroll wow zoomIn" onclick="evaluation('CIA')" data-wow-delay="0.1s">CIA Analysis</a></li>
			            </ul></li></ul>
			             </div>
<div class="wow bounceInRight" style="display:none;position: relative;left:33%;" id="uploadclicked">		             
<form action="/jss_nba/UploadSheet" method="post" enctype="multipart/form-data">
<input onclick="showbuttoneval()" type="file" name="file">
</form>
</div>
<div class="wow bounceInRight" style="display:none;position: relative;left:33%;top:20px;" id="maineval">
<button onclick="ajaxwork()" class="btn btn-success wow bounceInRight btn-sm" data-wow-delay="0.8s">Do Evaluation</button>
<div style="display:none;left:33%;position: relative;" id="text3"><p id="msgtxt3" class="subtitle"></p></div>
</div>
<%}
else
{
	response.sendRedirect("/jss_nba/html/sample.html");
	}%>
</div>
<script src="/jss_nba/bootstrap/inc/jquery/jquery-1.11.1.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/bootstrap/js/bootstrap.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/owl-carousel/js/owl.carousel.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/stellar/js/jquery.stellar.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/animations/js/wow.min.js"></script>
        <script src="/jss_nba/bootstrap/inc/isotope.pkgd.min.js"></script>
		<script src="/jss_nba/bootstrap/js/theme.js"></script>

</body>
</html>