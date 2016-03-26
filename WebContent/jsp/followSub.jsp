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
function addsub(add)
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
		document.getElementById(add).innerHTML=info;
		}
	}
	x.open("GET","/jss_nba/deladdsub?us="+add,true);
	x.send(null);
}
</script>
</head>
<body style="background-image: url('/jss_nba/images/1.jpg	');background-size: 100% 650px;">
<div style="background-image:url('/jss_nba/images/9.jpg');background-repeat:no-repeat; height:130px;"></div>
<%Connection con=null; ResultSet rs,rs1,rs0,rs2; PreparedStatement ps,ps1,ps0,ps2;
HttpSession hs=request.getSession(false);
hs.setAttribute("type1", "Teacher");
String userid=(String)hs.getAttribute("loginid");
if(userid!=null)
{
String s=(String)hs.getAttribute("name");
String strsql1="select * from subjects where branch=?";
String strsql2="select * from followedSub where loginId=?";
con=CRUDOperation.createConection();
%>
<div class="container">
<div style="float:left;width:200px;height:100%;text-align: center;text-decoration: underline;position:absolute;">
<div ><a href="/jss_nba/jsp/uploadpic.jsp"><img style="height:150px;width:150px;" class="wow zoomIn" src="/jss_nba/images/2.jpg"></a></div>
<div style="height: 20px;"></div>
<div class="wow fadeInUp" data-wow-delay="0.2s" style="height: 20px;" ><a href="/jss_nba/jsp/Teacher.jsp">Home</a></div>
<div class="wow fadeInDown" data-wow-delay="0.3s" style="height: 20px;" ><a href="/jss_nba/jsp/calculation.jsp">Calculation</a></div>
<div class="wow shake" data-wow-delay="0.2s" style="height: 20px;" ><a href="/jss_nba/jsp/followSub.jsp">Subjects</a></div>
<div class="wow fadeInDown" data-wow-delay="0.3s" style="height: 20px;" ><a href="/jss_nba/jsp/composeMail.jsp?Teacher">Compose</a></div>
<div class="wow fadeInUp" data-wow-delay="0.2s" style="height: 20px;" ><a href="/jss_nba/jsp/editinfo.jsp?Teacher">Edit info</a></div>
</div>

<div class="page-header text-center wow fadeInUp">
<h5 style="text-decoration: underline;">Subject's Available</h5>
<div class="devider"></div>
<p class="subtitle">Select the subjects you teach.</p>
</div>
<table class="table table-hover" style="width:50%;position:relative;left:300px;">
<tr><th class="wow bounceInLeft">Code</th>
<th class="wow zoomIn">Subject</th>
<th class="wow bounceInRight">Action</th></tr>
<%
try
{
	String branch_inki=(String)hs.getAttribute("branch_inki");
	ps=con.prepareStatement(strsql1);
	ps.setString(1,branch_inki);
ps1=con.prepareStatement(strsql2);
ps1.setString(1,userid);
rs=ps.executeQuery();
rs1=ps1.executeQuery();
while(rs.next())
{    int flag=0;
	System.out.println("hmm"+rs.getString("code"));
	while(rs1.next())
	{
	if((rs.getString("code")).equals(rs1.getString("subjId")) )
		{
		flag=1;
		break;
	     }
	}
if(flag==0)
{
%>
<tr class="wow bounceInRight" data-wow-delay="0.3s"><th><a href="/jss_nba/jsp/co.jsp?<%=rs.getString("code") %>"><%=rs.getString("code") %></a></th>
<th><%=rs.getString("name") %></th>
<th><button id=<%=rs.getString("code") %> class="btn btn-success" value=<%=rs.getString("code") %> onclick="addsub(this.value)">Select</button></th>
</tr>
<%
     }
	rs1.beforeFirst();
}
}
catch(SQLException se)
{
	System.out.println(se);
	}
%>
</table>
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