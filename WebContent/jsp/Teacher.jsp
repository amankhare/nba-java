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
		<script type="text/javascript">
function delsub(del)
{
	if (XMLHttpRequest)
	{
	x=new XMLHttpRequest();
	}
	x.onreadystatechange=function()
	{
		
		if(x.readyState==4 && x.status==200)
		{
		var info=x.responseText;//used to store the response send by the server
		document.getElementById(del).innerHTML=info;
		}
	}
	x.open("POST","/jss_nba/deladdsub?us="+del,true);
	x.send(null);
}
</script>
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
                      <a class="navbar-brand page-scroll wow bounce" data-wow-delay="0.4s" href="#">JSS-NBA</a>
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
                <!-- End Navbar -->

            </header>

</head>
<body style="background-image: url('/jss_nba/images/1.jpg	');background-size: 100% 650px;">
<div style="background-image:url('/jss_nba/images/9.jpg');background-repeat:no-repeat; height:130px;width:100%;"></div>
<%Connection con=null; ResultSet rs,rs1,rs0,rs2; PreparedStatement ps,ps1,ps0,ps2;
HttpSession hs=request.getSession(false);
String nameforwelcome=""; 
hs.setAttribute("type1", "Teacher");
String userid=(String)hs.getAttribute("loginid");
if(userid!=null)
{
String strsql="select * from registrationdetail where loginId=?";
String strsql1="select * from followedSub where loginId=?";
con=CRUDOperation.createConection();
int flag=0,flag1=0;
try
{
ps=con.prepareStatement(strsql);
ps.setString(1, userid);
rs=ps.executeQuery();
while(rs.next())
{
	nameforwelcome=rs.getString("name");
	hs.setAttribute("name", rs.getString("name"));
%>
<div class="container">
<div style="float:left;width:200px;height:100%;text-align: center;text-decoration: underline;position:absolute;">
<div ><a href="/jss_nba/jsp/uploadpic.jsp"><img style="height:150px;width:150px;" class="wow zoomIn" src="/jss_nba/images/2.jpg"></a></div>
<div style="height: 20px;" class="wow bounceInLeft" data-wow-delay="0.2s"></div>
<div style="height: 20px;" class="wow shake" data-wow-delay="0.6s"><a href="/jss_nba/jsp/Teacher.jsp">Home</a></div>
<div style="height: 20px;" class="wow bounceInLeft" data-wow-delay="0.2s"><a href="/jss_nba/jsp/calculation.jsp">Calculation</a></div>
<div style="height: 20px;" class="wow bounceInLeft" data-wow-delay="0.3s"><a href="/jss_nba/jsp/followSub.jsp">Subjects</a></div>
<div style="height: 20px;" class="wow bounceInLeft" data-wow-delay="0.2s"><a href="/jss_nba/jsp/composeMail.jsp?Teacher">Compose</a></div>
<div style="height: 20px;" class="wow bounceInLeft" data-wow-delay="0.3s"><a href="/jss_nba/jsp/editinfo.jsp?Teacher">Edit info</a></div>
</div>
</div>
<div style="left:200px;width:100%;height:100%;text-align: center;text-decoration: underline;position: absolute;"></div>
<%
}
%>
<div class="container">
<div class="text-center wow fadeInDown" data-wow-delay="0.2s">
<h2 style="text-decoration: underline;">Welcome <%= nameforwelcome %></h2>
<div class="devider"></div>
<div class="subtitle">Your Selected Subjects.</div>
</div>
<h5 class="page-header text-center wow bounceInRight" style="position: relative;top:40px;text-decoration:underline">Subject's You Teach</h5>
<div class="wow" data-wow-delay="0.3s">
<table class="table table-hover" style="left:33%;position: relative;width:35%;">
<tr style="height:20px;"><th style="text-align: center;">Code</th>
<th style="text-align: center;">Subject</th>
<th style="text-align: center;">Action</th></tr>
<%
ps=con.prepareStatement(strsql1);
ps.setString(1, userid);
rs=ps.executeQuery();
while(rs.next())
{
	String s=rs.getString("subjId")+"@"+userid; 
%>
<tr style="height:25px;"><th  class="wow bounceInLeft" style="text-align: center;"><a href="/jss_nba/jsp/co.jsp?<%=rs.getString("subjId") %>"><%=rs.getString("subjId") %></a></th>
<th style="text-align: center;"><%=rs.getString("subname") %></th>
<th style="text-align: center;"><button id=<%=rs.getString("subjId") %> class="btn btn-danger btn-sm wow bounceInRight" value=<%=rs.getString("subjId")%> onclick="delsub(this.value)">Delete</button></th>
</tr>
<%}
}
catch(SQLException se)
{
	System.out.println(se);
	}
%>

</table>
</div>
<%}
else
{response.sendRedirect("/jss_nba/html/sample.html");
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