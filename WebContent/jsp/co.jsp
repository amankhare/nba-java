<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="/jss_nba/jsp/errorPage.jsp"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,com.dbutil.*,com.can.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Outcome</title>
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
                      <a class="navbar-brand page-scroll" href="#">JSS-NBA</a>
                    </div>

                         <!-- Collect the nav links, forms, and other content for toggling -->
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

<script type="text/javascript">
 </script>
</head>
<body style="width:100%;"> 
<div class="container">
<div style="top:90px;position: relative;" class="page-header text-center wow fadeInUp" >
<h2>CO's & PO's</h2>
<div class="devider"></div>
<p class="subtitle">Make changes to the CO's</p>
</div>
<%
Connection con=null; ResultSet rs;PreparedStatement ps;
HttpSession hs=request.getSession(false);
String s=request.getQueryString();
hs.setAttribute("code", s);
%>
<div>
<h5 style="position: relative;top: 40px;" class="page-header wow bounceInRight">Course Outcome of <%=s %></h5>
</div>
<form class="form-group" action="/jss_nba/addcopo" method="GET">
<table class="table table-hover" style="top:30px;width:500px;position:relative;">
<%
String strsql="select * from "+s;
con=CRUDOperation.createConection();
try
{
ps=con.prepareStatement(strsql);
rs=ps.executeQuery();
while(rs.next())
{
%>
<tr><th class="wow bounceInLeft" data-wow-delay="0.3s"><%=rs.getString("co") %></th>
<td class="wow bounceInRight" data-wow-delay="0.7s"><%=rs.getString("text") %></td>
</tr>
<%}
}
catch(Exception se)
{
	se.printStackTrace();
	}
%>
<tr>
<td>
<input class="btn btn-success wow shake" type="submit" value="Add"></td>
<td><textarea class="form-control wow bounceInRight" name="textco" cols="40" rows="4">
</textarea>
</td>
</tr>
</table>
</form>
<table class="table">
<tr style="border: hidden;"><td></td></tr>
<tr style="border: hidden;"><td></td></tr>
<tr style="border: hidden;"><td></td></tr>
</table>
<div>
<h5 class="page-header wow bounceInRight">Program Outcome's</h5>
<table class="table table-hover" style="top:30px;width:500px;position:relative;">
<%
String strsql1="select * from pos";
try
{
ps=con.prepareStatement(strsql1);
rs=ps.executeQuery();
while(rs.next())
{
%>
<tr><th class="wow bounceInLeft" data-wow-delay="0.3s"><%=rs.getString("title") %></th>
<td class="wow bounceInRight" data-wow-delay="0.7s"><%=rs.getString("text") %></td></tr>
<%}
}
catch(Exception se)
{
	se.printStackTrace();
	}
%>
</table>
</div>
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