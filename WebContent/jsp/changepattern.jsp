<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,com.dbutil.*,com.can.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Request Change Pattern</title>
<link rel="stylesheet" href="/jss_nba/bootstrap/inc/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/jss_nba/bootstrap/inc/animations/css/animate.min.css">
		<link rel="stylesheet" href="/jss_nba/bootstrap/inc/font-awesome/css/font-awesome.min.css"> <!-- Font Icons -->
		<link rel="stylesheet" href="/jss_nba/bootstrap/inc/owl-carousel/css/owl.carousel.css">
		<link rel="stylesheet" href="/jss_nba/bootstrap/inc/owl-carousel/css/owl.theme.css">
<link rel="stylesheet" href="/jss_nba/bootstrap/css/reset.css">
		<link rel="stylesheet" href="/jss_nba/bootstrap/css/style.css">
		<link rel="stylesheet" href="/jss_nba/bootstrap/css/mobile.css">
<link rel="stylesheet" href="/jss_nba/bootstrap/css/skin/cool-gray.css">
<header id="header" class="header-main">

                <!-- Begin Navbar -->
                <nav id="main-navbar" class="navbar navbar-default navbar-fixed-top" role="navigation"> 

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
            <script type="text/javascript">
            function action(a)
            {
            	document.getElementById("action").innerHTML=a+"<b class='caret'></b>";
            }
            </script>

</head>
<body>
<div class="container text-center" style="top: 90px;position: relative;">
<div class="page-header" >
<h3 class="wow fadeInUp" style="text-decoration: underline;" data-wow-delay="0.3s">Change Pattern</h3>
<div class="devider"></div>
<div class="subtitle wow bounceInLeft" data-wow-delay="0.5s">Request for change in methods of calculation</div>
</div>
<div class="collapse navbar-collapse wow bounceInRight" data-wow-delay="0.3s" style="left:380px;position: relative;">
<ul class="nav navbar-nav navbar-center">
<li class="dopdown">
<a href="#" class="dropdown-toggle" id="action" data-toggle="dropdown">Action<b class="caret"></b></a>
<ul class="dropdown-menu">
<li><a class="page-scroll wow zoomIn" href="#" onclick="action('Edit Pattern')">View Pattern</a></li>
<li><a class="page-scroll wow zoomIn" href="#" onclick="action('New Pattern')">New Pattern</a></li>
</ul>
</li>
</ul>
</div>
<%Connection con=null;ResultSet rs,rs1;PreparedStatement ps,ps1;
HttpSession hs=request.getSession(false);
String branch=(String)hs.getAttribute("branch_inki");
branch=branch.trim().replace(" ", "").toLowerCase();
String state="select * from "+branch+"pattern";
con=CRUDOperation.createConection();
try
{
 ps=con.prepareStatement(strsql);
 rs=ps.executeQuery();
 if(rs.next())
 {
%>
<p class="subtitle">No. Of Parts</p>

</div>
</form>
</div>
</div>
<div id="new">
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