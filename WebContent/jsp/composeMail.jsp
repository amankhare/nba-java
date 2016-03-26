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
                      <a class="navbar-brand page-scroll wow zoomIn" data-wow-delay="s" href="#">JSS-NBA</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                        <li class="dopdown">
                        <a href="#" class="dropdown-toggle wow zoomIn" data-toggle="dropdown">Account<b class="caret"></b></a>
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
<body style="background-image: url('/e-canvass/images/10.jpg');background-position:center; background-repeat: no-repeat;height:100%;width:100%;background-attachment: fixed;">
<div class="container">
<%HttpSession hs=request.getSession(false);
String userid=(String)hs.getAttribute("loginid");
String ty=(String)hs.getAttribute("type1");
/* String page1=(String)hs.getAttribute("page");
hs.setAttribute("page", page1);
 */
String s=request.getQueryString();
System.out.println("ye hai"+s);
String rec=(String)hs.getAttribute("rec");
System.out.println("sender id is "+userid);
hs.setAttribute("senderid", userid);
System.out.println(ty);
//logged in user id
%>
<div style="position: relative;top:90px;" class="page-header text-center wow zoomIn">
<h2>Compose Mail</h2>
<div class="devider"></div>
</div>
<div class="form-group">
<form action="/e-canvass/Mail?<%=ty %>" method="Post">
<table style="position:relative;  top:40px;">
<tr><td><label class="wow zoomIn" data-wow-delay="0.8s" for="to">To:</label>
<input id="to" style="width: 20%;" class="form-control wow bounceInRight" data-wow-delay="0.1s" type="text" name="id" value=<%=s%>></td></tr>
<tr><td><label class="wow zoomIn" data-wow-delay="0.9s" for="sub">Subject:</label>
<input id="sub" style="width: 20%;" class="form-control wow bounceInRight" data-wow-delay="0.2s" type="text" value="" name="subject"></td></tr>
<tr><td><label class="wow zoomIn" data-wow-delay="0.99s" for="mes">Message:</label>
<textarea id="mes" class="form-control wow bounceInRight" data-wow-delay="0.3s" name="message" rows="10" cols="100"></textarea></td></tr>
<tr><td>
<input type="submit" class="btn btn-success wow shake" data-wow-delay="1s" value="Send">
</td></tr>
</table>
</form>
</div>
<script src="/jss_nba/bootstrap/inc/jquery/jquery-1.11.1.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/bootstrap/js/bootstrap.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/owl-carousel/js/owl.carousel.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/stellar/js/jquery.stellar.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/animations/js/wow.min.js"></script>
        <script src="/jss_nba/bootstrap/inc/isotope.pkgd.min.js"></script>
		<script src="/jss_nba/bootstrap/js/theme.js"></script>
</div></body>
</html>