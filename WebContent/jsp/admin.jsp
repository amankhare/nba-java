<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*,com.dbutil.*,com.can.*, java.util.*" %>
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
                      <a class="navbar-brand page-scroll wow bounceInRight" data-wow-delay="s" href="#">JSS-NBA</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                        <li class="dopdown">
                        <a href="#" class="dropdown-toggle wow bounceInLeft" data-toggle="dropdown">Account<b class="caret"></b></a>
			             <ul class="dropdown-menu">
			    <li><a class="page-scroll wow zoomIn"  data-wow-delay="0.1s" href="/jss_nba/jsp/inbox.jsp">Inbox</a></li>
			    <li><a class="page-scroll wow zoomIn"  data-wow-delay="0.2s" href="/jss_nba/jsp/sentbox.jsp">Sent Box</a></li>
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

<script>
var branch;
var year;
function showpendingrequest()
{
	document.getElementById("butn").style.display="none";
    document.getElementById("hssid").style.display="none";
	document.getElementById("hid").style.display="none";
 	document.getElementById("hsid").style.display="none";
	document.getElementById("hdid").style.display="block";
	}
function deleteuser()
{
	document.getElementById("butn").style.display="none";
	document.getElementById("hdid").style.display="none";
    document.getElementById("hsid").style.display="none";
    document.getElementById("hssid").style.display="none";
	document.getElementById("hid").style.display="block";
	}
function showstudentdata()
{
	document.getElementById("butn").style.display="none";
	document.getElementById("branch").innerHTML="Branch<b class='caret'>";
	document.getElementById("hdid").style.display="none";
	document.getElementById("hid").style.display="none";
	document.getElementById("hssid").style.display="none";
	document.getElementById("hsid").style.display="block";
	}
function showbranchyear(a)
	{
	branch=a;
	document.getElementById("butn").style.display="none";
	document.getElementById("branch").innerHTML=branch+"<b class=\"caret\">";
	document.getElementById("hdid").style.display="none";
	document.getElementById("hid").style.display="none";
	document.getElementById("hsid").style.display="block";
	document.getElementById("hssid").style.display="block";
	//alert(branch)
	}
	function showbtn(year)
	{
		document.getElementById("button").value=branch+"@@"+year;
		document.getElementById("year").innerHTML=year+"<b class=\"caret\">";
		document.getElementById("hdid").style.display="none";
		document.getElementById("hid").style.display="none";
		document.getElementById("hsid").style.display="block";
		document.getElementById("hssid").style.display="block";
		document.getElementById("butn").style.display="block";
			
	}
</script>

</head>
<body style="background-image: url('/jss_nba/images/1.jpg	');background-size: 100% 650px;">
<div style="height:100px;"></div>
<div class="container">
<div class="page-header text-center wow zoomIn">
<h2 style="text-decoration: overline;">Welcome Admin</h2>
<div class="devider"></div>
<p class="subtitle">Manage this site..</p>
</div>
<div class="container">
<!-- <h2 style="text-align: center;text-decoration: overline;">Welcome Admin</h2>
<div> -->
<table  style="width: 100%;height: 40px;"><tr>
<th><a href="#" class="wow zoomIn" style="color: blue;float:left; ;text-decoration: underline;" onmousedown="showpendingrequest()" >Pending Request</a></th>
<th><a href="#" class="wow zoomIn" style="color: blue;float:left;text-decoration: underline;" onmousedown="deleteuser()" >Current User</a></th>
<th><a href="#" class="wow zoomIn" style="color: blue;float:left;text-decoration: underline;" onmousedown="showstudentdata()" >Manage Students Database</a></th>
</tr></table>
</div>
<div id="hdid" style="display: none;">
<form action="/jss_nba/admin" id="pending" method="post">
<table class="table table-hover wow bounceInLeft" style="width: 100%;">
<tr style="height:40px;"><th style="text-align: center;">Select</th>
<th style="text-align: center;">LoginId</th>
<th style="text-align: center;">Name</th>
<th style="text-align: center;">User Type</th>
<th style="text-align: center;">Branch</th>
<th style="text-align: center;">Id No.</th>
<th style="text-align: center;">Contact No.</th>
</tr>
<%HttpSession hs=request.getSession(false);
String composedatabase="";
hs.setAttribute("type1", "admin");
Connection con=null;PreparedStatement ps=null,ps1=null;ResultSet rs=null,rs1=null;
String strsql="select * from registrationdetail where status=?";
String strsql2="select * from registrationdetail where status=?";
con=CRUDOperation.createConection();
	try
	{ 
		ps=con.prepareStatement(strsql);
		ps1=con.prepareStatement(strsql2);
		ps.setString(1, "false");
		ps1.setString(1, "true");
		rs=ps.executeQuery();
		rs1=ps1.executeQuery();
			while(rs.next())
			{
				
%>
<tr style="height: 30px;">
<td style="text-align: center;"><input type="checkbox" name="chk" value="<%=rs.getString("loginId") %>@@@@@@@@@@@@@@@@@@@@@@@@@@@<%= rs.getString("type") %>"></td>
<td style="text-align: center;"><%= rs.getString("loginId") %></td>
<td style="text-align: center;"><%= rs.getString("name") %></td>
<td style="text-align: center;"><%= rs.getString("type") %></td>
<td style="text-align: center;"><%= rs.getString("branch") %></td>
<td style="text-align: center;"><%= rs.getString("otherId") %></td>
<td style="text-align: center;"><%= rs.getString("phoneNum") %></td>
</tr>
<%
             }
			
		%>
<tr><td style="visibility: hidden;height:20px;"></td><td><td><td></td><td></td><td></td><td></td></tr>
<tr style="border-top: hidden;">
<td  style="text-align:center;">
<input type="submit" class="btn btn-success" value="Accept"></td>
<td><button type="submit" name="nam" value="nam" form="pending" formaction="/jss_nba/admin" formmethod="get" class="btn btn-danger">Delete</button></td>
</tr>
</table>
</form>
</div>
<div id="hid" style="display: none;">
<form action="/jss_nba/admin" method="Get">
<table class="table table-hover wow bounceInRight" style="width: 100%;">
<tr style="height:40px;"><th style="text-align: center;">Select</th>
<th style="text-align: center;">LoginId</th>
<th style="text-align: center;">Name</th>
<th style="text-align: center;">User Type</th>
<th style="text-align: center;">Branch</th>
<th style="text-align: center;">Id No.</th>
<th style="text-align: center;">Contact No.</th>
</tr>
		<% 
		if(rs1.next())//when message is recieved
		{
			while(rs1.next())
			{
				if((rs1.getString("type")).equals("admin"))
					continue;
				else
				{
					hs.setAttribute("type", rs1.getString("type") );
		%>
		
<tr style="height:30px;">
<td style="text-align: center;"><input type="checkbox" name="chk" value="<%=rs1.getString("loginId") %>"></td>
<td style="text-align: center;"><%= rs1.getString("loginId")%></td>
<td style="text-align: center;"><a href="/jss_nba/jsp/composeMail.jsp?<%= rs1.getString("loginId") %>"" ><%= rs1.getString("name") %></a></td>
<td style="text-align: center;"><%= rs1.getString("type") %></td>
<td style="text-align: center;"><%= rs1.getString("branch") %></td>
<td style="text-align: center;"><%= rs1.getString("otherId") %></td>
<td style="text-align: center;"><%= rs1.getString("phoneNum") %></td>
</tr>
<%
			}}
		}
	}
	catch(SQLException se)
	{
	System.out.println(se);}
	%>
<tr><td style="visibility: hidden;height:20px;"></td><td><td><td></td><td></td><td></td><td></td></tr>	
<tr>
<td style="text-align: center;border-top: hidden;"><input type="submit" class="btn btn-danger" value="Delete"></td>
</tr>
</table>
</form>
</div>
<div id="hsid" style="display: none;">
 <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-left">
                        <li class="dopdown">
                        <a href="#" class="dropdown-toggle wow bounceInLeft" id="branch" data-toggle="dropdown">Branch<b class="caret"></b></a>
			             <ul class="dropdown-menu">
<%
String strsql3="select * from branch";
	try
	{ 
		ps=con.prepareStatement(strsql3);
		rs=ps.executeQuery();
			while(rs.next())
			{	
%>

			    <li><a class="page-scroll wow zoomIn" onclick="showbranchyear('<%=rs.getString("branch")%>')" data-wow-delay="0.1s"  href="#<%=rs.getString("branch")%>"><%=rs.getString("branch")%></a></li>
                <%
                }}
                catch(Exception ex)
	{
                	System.out.println(ex);
	}
                %>
                <li class="devider"></li>
                <li><a class="page-scroll wow shake" onclick="showbranchyear('All Branches')" data-wow-delay="0.2s" href="#All Branches">All Branches</a></li>
                    </ul>
                    </li>
                    </ul>
                    </div>
</div>
<div id="hssid" style="display: none;">
 <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-left">
                        <li class="dopdown">
                        <a href="#" class="dropdown-toggle wow bounceInLeft" id="year" data-toggle="dropdown">Year<b class="caret"></b></a>
			             <ul class="dropdown-menu">
			    <li><a onclick="showbtn('2012-16')" class="page-scroll wow zoomIn"  data-wow-delay="0.1s" href="#2012-16">2012-16</a></li>
			    <li><a onclick="showbtn('2013-17')" class="page-scroll wow zoomIn"  data-wow-delay="0.2s" href="#2013-17">2013-17</a></li>
			    <li><a onclick="showbtn('2014-18')" class="page-scroll wow zoomIn"  data-wow-delay="0.3s" href="#2014-18">2014-18</a></li>
			    <li><a onclick="showbtn('2015-19')" class="page-scroll wow zoomIn"  data-wow-delay="0.4s" href="#2015-19">2015-19</a></li>
                <li class="devider"></li>
                <li><a onclick="showbtn('all')" class="page-scroll wow shake" data-wow-delay="0.2s" href="#All Branches">All Year</a></li>
                    </ul>
                    </li>
                    </ul>
                    </div>
                  
</div>
<div id="butn" style="display: none;width: 100%">
<form id="ss" action="">
<button id="button" name="button" form="ss" style="left:30px;" formaction="/jss_nba/jsp/showStudents.jsp"  formmethod="get" class="btn btn-success wow bounceInRight">Extract</button>
</form>
</div>
</div>
<form action="/jss_nba/Khare" >
<input type="submit" >
</form>
<script src="/jss_nba/bootstrap/inc/jquery/jquery-1.11.1.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/bootstrap/js/bootstrap.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/owl-carousel/js/owl.carousel.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/stellar/js/jquery.stellar.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/animations/js/wow.min.js"></script>
        <script src="/jss_nba/bootstrap/inc/isotope.pkgd.min.js"></script>
		<script src="/jss_nba/bootstrap/js/theme.js"></script>

</body>
</html>