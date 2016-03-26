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

</head>
<body style="background-image: url('/jss_nba/images/14.jpg');background-position:right; background-repeat: no-repeat;height:100%;width:100%;background-attachment: fixed;">  <!-- style="background-image: url('/jss_nba/images/5.jpg');background-position:center; background-repeat: no-repeat;height:100px;width:100%;background-attachment: fixed;" -->
<div style="background-image:url('/jss_nba/images/9.jpg');background-repeat:no-repeat; height:130px;"></div>
<%Connection con=null; ResultSet rs,rs1,rs0,rs2; PreparedStatement ps,ps1,ps0,ps2;
HttpSession hs=request.getSession(false);
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
%>
<div style="float:left;width:200px;height:100%;text-align: center;text-decoration: underline;position:absolute;">Welcome <%= rs.getString("name") %>
<div><a href="/jss_nba/jsp/uploadpic.jsp"><img style="height:150px;width:150px;" src="/jss_nba/images/unknown_male_profile.jpg"></a></div>
<div><a href="/jss_nba/jsp/Teacher.jsp">Home</a></div>
<div><a href="/jss_nba/jsp/myposts.jsp">Calculation</a></div>
<div><a href="/jss_nba/jsp/Subjects.jsp">Subjects</a></div>
<div><a href="/jss_nba/jsp/composeMail.jsp?Teacher">Compose</a></div>
<div><a href="/jss_nba/jsp/editinfo.jsp?Teacher">Edit info</a></div>
<div><a href="/jss_nba/LogOut">Log Out</a></div>
</div>
<div style="left:200px;width:100%;height:100%;text-align: center;text-decoration: underline;position: absolute;"></div>
<%
}
%>
<!-- <h4 style="text-align: center;">Post Something....</h4> -->
<!-- <form action="/jss_nba/Post_text" method="Get">
<table  style="left:300px;width:700px;position:relative;">
<tr><td>
<textarea style="width:800px;" rows="4" cols="50" name="post_text">
</textarea>
</td></tr>
<tr><td><input type="submit" value="Post"/></td></tr>
</table>
</form> -->
<h5 style="text-align: center;">Subject's Available.....</h5>
<table border="1" style="left:530px;width:300px;position:relative;background-color: white;">
<tr><th>Code</th>
<th>Subject</th>
</tr>
<%}
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
</body>
</html>