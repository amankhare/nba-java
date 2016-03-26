<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
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
                            <!-- <li><a class="page-scroll" href="body">Home</a></li>
                            <li><a class="page-scroll" href="#login-section">LogIn</a></li>
			    <li><a class="page-scroll" href="#about-section">About</a></li> -->
                            <!-- <li><a class="page-scroll" href="#services-section">Services</a></li>-->
                            <!-- <li><a class="page-scroll" href="#team-section">Team</a></li>
                            <li><a class="page-scroll" href="/jss_nba/jsp/signup.jsp">SignUp</a></li>                            
                             <li><a class="page-scroll" href="#prices-section">Prices</a></li> 
                             --><li><a class="page-scroll" href="#">Logout</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                  </div><!-- /.container -->
                </nav>
                <!-- End Navbar -->

            </header>

<script type="text/javascript">
var teachid;
function myFunction(teachid)
{	
if(XMLHttpRequest)
{
x=new XMLHttpRequest();
}
x.onreadystatechange=function()
{
if(x.readyState==4 && x.status==200)
{
//used to store the response send by the server
if(x.responseText)
	{
	document.getElementById("btcl").innerHTML=x.responseText;
	document.getElementById("msgtxt").style.color="green";
	}
	}
	}

x.open("GET","/e-canvass/Follow?p="+teachid,true);
x.send(null);

	
	}
	</script>
</head>
<body style="background-image: url('/e-canvass/images/14.jpg');background-position:right; background-repeat: no-repeat;height:100%;width:100%;background-attachment: fixed;">
<div style="background-image:url('/e-canvass/images/9.jpg');background-repeat:no-repeat; height:130px;"></div>
<%Connection con=null; ResultSet rs,rs1,rs2; PreparedStatement ps,ps1,ps2;
HttpSession hs=request.getSession(false);
String s1=request.getQueryString();
String userid=(String)hs.getAttribute("loginid");
if(userid!=null)
{
String strsql="select * from registrationdetail where admissionNum=?";
con=CRUDOperation.createConection();	
try
{
ps=con.prepareStatement(strsql);
ps.setString(1, userid);
rs=ps.executeQuery();
while(rs.next())
{
%>
<div style="float:left;width:200px;height:100%;text-align: center;text-decoration: underline;position:absolute;">Welcome <%= rs.getString("name") %>
<div><a href="/e-canvass/jsp/uploadpic.jsp"><img style="height:150px;width:150px;" src="/e-canvass/images/unknown_male_profile.jpg"></a></div>
<div><a href="/e-canvass/jsp/<%=s1 %>.jsp">Home</a></div>
<%if(s1.equals("Teacher"))
	{%>
<div><a href="/e-canvass/jsp/myposts.jsp">My Posts</a></div>
<div><a href="/e-canvass/jsp/availableteacher.jsp?Teacher">Teachers</a></div>
<div><a href="/e-canvass/jsp/composeMail.jsp?Teacher">Compose</a></div>
<% }
else
{%>
<div><a href="/e-canvass/jsp/availablestudents.jsp?student">Student's</a></div>
<%} %>
<div><a href="/e-canvass/jsp/sentbox.jsp?<%=s1%>">Sentbox</a></div>
<div><a href="/e-canvass/jsp/inbox.jsp?<%=s1 %>">Inbox</a></div>
<div><a href="/e-canvass/jsp/editinfo.jsp">Edit info</a></div>
<div><a href="#">Join</a></div>
<div><a href="/e-canvass/LogOut">Log Out</a></div>
</div>
<div style="left:200px;width:100%;height:100%;text-align: center;text-decoration: underline;position: absolute;">
</div>
<%
}
%>
<h5 style="text-align: center;">Join....</h5>
<table style="left:530px;width:300px;position:relative;background-color: white;" border="1">
<tr><th>Faculty</th>
<th>Department</th>
<th>Action</th>
</tr>
<%
}
catch(SQLException se)
{
	System.out.println(se+"error");
	}
String strsql1="select * from registrationdetail where type=? and status=? ";
String strsql2="select * from follow where followedby=? and followedto=? ";
try
{
ps1=con.prepareStatement(strsql1);
ps1.setString(1, "teacher");
ps1.setString(2, "true");
//ps1.setString(3, userid);
rs1=ps1.executeQuery();
while(rs1.next())
{
	String s=rs1.getString("branch");
	ps2=con.prepareStatement(strsql2);
	ps2.setString(1, userid);
	ps2.setString(2, rs1.getString("admissionNum"));
	rs2=ps2.executeQuery();
	if(rs2.next() || (rs1.getString("admissionNum")).equals(userid))
		{continue;}
	else
	{

	
%>
<tr><td style="text-align: center;"><%= rs1.getString("name") %></td>
<td style="text-align: center;"><%=s  %></td>
<th><button id="btcl" value="<%= rs1.getString("admissionNum") %>@<%= rs1.getString("name") %>@<%=s  %>" onclick="myFunction(this.value)">Join Class</button></th>
</tr>
<%
}
}}
catch(SQLException se)
{
	System.out.println(se+"error");
	}
%>
</table>
<%}
else
{
	response.sendRedirect("/jss_nba/html/sample.html");
	}%>
</body>
</html>