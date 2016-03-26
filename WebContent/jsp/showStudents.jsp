<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*,com.dbutil.*,com.can.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show Students</title>

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
                      <a class="navbar-brand page-scroll wow bounceInRight" data-wow-delay="s" href="#">JSS-NBA</a>
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


</head>
<body>
<div class="container">
<div style="position: relative;top: 100px;">
<form action="/jss_nba/deloraddStudent" method="Get">
<table class="table table-hover" style="width: 100%;">
<tr style="height:40px;"><td>Select</td>
<td style="text-decoration: underline;">Name</td>
<td style="text-decoration: underline;">University No.</td>
<td style="text-decoration: underline;">Branch</td>
<td style="text-decoration: underline;">Session</td>
<td style="text-decoration: underline;">Section</td>
</tr>
<% Connection con=null;PreparedStatement ps1=null,ps=null;ResultSet rs=null;
HttpSession hs=null;
String query=request.getParameter("button");
System.out.println(query);
String strsql="select * from students where branch=? and session=?";
con=CRUDOperation.createConection();
try
{
String s[]=query.split("@@");
if(s[0].equals("All Branches") && s[1].equals("all"))
	{
	System.out.println("1");
	strsql="select * from students";
	ps=con.prepareStatement(strsql);
	}
else if(s[0].equals("All Branches") && !s[1].equals("all"))
{   System.out.println("2");
	strsql="select * from students where session=?";
	ps=con.prepareStatement(strsql);
	ps.setString(1, s[1]);
}
else if(!s[0].equals("All Branches") && s[1].equals("all"))
{    System.out.println("3");
	strsql="select * from students where branch=?";
	ps=con.prepareStatement(strsql);
	ps.setString(1, s[0]);
}
else
	{ps=con.prepareStatement(strsql);
	System.out.println("4");
    ps.setString(1, s[0]);
    ps.setString(2, s[1]);
	}
rs=ps.executeQuery();
	while(rs.next())
	{
	%>
	<tr>
	<td><input type="checkbox" class="wow zoomIn" value="<%=rs.getString("universityNum")%>" name="chk" ></td>
	<td class="wow bounceInRight"><%=rs.getString("name") %></td><td class="wow bounceInRight"><%=rs.getString("universityNum") %></td><td data-wow-delay="0.4s" class="wow shake"><%=rs.getString("branch") %></td><td class="wow bounceInLeft"><%=rs.getString("session") %></td><td class="wow bounceInLeft"><%=rs.getString("section") %></td></tr>
	<% 
}}
catch(SQLException se)
{
	System.out.println(se);
}
%>

</table>
<input type="submit" class="btn btn-danger wow bounceInLeft" value="Delete">
</form>
<div style="top:10px;position: relative;">
<button id="nam" class="btn btn-success wow bounceInRight">Add New</button>

<form action="/jss_nba/deloraddStudent" method="Post">
<table class="table table-hover" style="width: 100%;">
<tr style="height:40px;">
<td ><input type="text" class=" wow bounceInRight form-control input-lg" data-wow-delay="0.8s"  placeholder="Name" name="name"></td>
<td ><td ><input type="text" class=" wow bounceInRight form-control input-lg" data-wow-delay="0.8s"  placeholder="UniversityNo." name="name"></td>
<td ><td ><input type="text" class=" wow bounceInRight form-control input-lg" data-wow-delay="0.8s"  placeholder="Branch" name="name"></td>
<td ><td ><input type="text" class=" wow bounceInRight form-control input-lg" data-wow-delay="0.8s"  placeholder="Session" name="name"></td>
<td ><td ><input type="text" class=" wow bounceInRight form-control input-lg" data-wow-delay="0.8s"  placeholder="Section" name="name"></td>
</tr>
</table></form>
</div>
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