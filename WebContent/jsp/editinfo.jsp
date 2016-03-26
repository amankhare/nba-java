<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="/e-canvass/jsp/errorPage.jsp"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.sql.*,com.dbutil.*,com.can.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Info...</title>
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
                      <a class="navbar-brand page-scroll" href="/jss_nba/jsp/Teacher.jsp">JSS-NBA</a>
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
            </header>
		
<script type="text/javascript">
var upass;
function checkpass(upass)
{	if(XMLHttpRequest)
		{
		x=new XMLHttpRequest();
		}
	x.onreadystatechange=function()
	{
		if(x.readyState==4 && x.status==200)
		{
		k=(x.responseText).split("&");
		   document.getElementById("msgtxt").innerHTML=k[0];
			document.getElementById("msgtxt").style.color="green";
			
			document.getElementById("mepass").style.display=k[1];
			
			
		
				
		}
	}
	
	x.open("GET","/e-canvass/Edit?p="+upass,true);
	x.send(null);
	
	}
function shownpass()
{
	document.getElementById("pass").style.display="block";
	document.getElementById("passtxt").style.display="block";
	//document.write("i am here");
}
</script>
</head>
<body style="background-image: url('/jss_nba/images/1.jpg	');background-size: 100% 650px;">
<h2 style="text-align: center;text-decoration: overline;">Edit Info</h2>
<%HttpSession hs=request.getSession(false);
String userid=(String)hs.getAttribute("loginid");
System.out.println("id is ="+userid);
if(userid!=null)
{
Connection con=null;PreparedStatement ps,ps1=null;ResultSet rs,rs1=null;
String strsql="select * from registrationdetail where loginId=?";
String sst="select * from branch";
con=CRUDOperation.createConection();
	try
	{
		ps=con.prepareStatement(strsql);
		ps1=con.prepareStatement(sst);
		ps.setString(1, userid);
		hs=request.getSession();
		hs.setAttribute("senderid", userid);
		rs=ps.executeQuery();
		rs1=ps1.executeQuery();
		if(rs.next())
		{
         System.out.println("yoda");
			%>
			<section id="edit-section" class="page bg-style1">
  <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInUp" data-wow-delay="0.4s">
                            <h2>Edit Info</h2>
                            <div class="devider"></div>
                            <p class="subtitle">Make changes. </p>
        
                    
		
		<div class="col-sm-6">
                           <div>
                                <form role="form" action="/jss_nba/Edit" method="post" style="left:54%;position:relative;" >
                                        <div class="form-group"></div>
                                        <div class="form-group"></div>
                                        <div class="form-group">
                                        <label for="name" class="btn wow zoomIn" data-wow-delay="2s">Name</label>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" id="name" class=" wow bounceInRight form-control input-lg" data-wow-delay="0.8s"  placeholder=<%=rs.getString("loginId")%> name="name" required>
                                        </div>
                                        <div class="form-group">
                                         <label for="number" class="btn wow zoomIn" data-wow-delay="2.230s">Number</label>
                                         </div>
                                        <div class="form-group">
                                            <input type="number" id="number" class=" wow bounceInLeft form-control input-lg" data-wow-delay="1s" placeholder=<%=rs.getString("phoneNum")%> name="phonenumber" required>
                                        </div>
                                        <div class="form-group">
                                        <label for="bbb" class="btn wow zoomIn" data-wow-delay="2.45s">Branch</label></div>
                                        <div class="form-group">
                                        <select name=pass class="form-control wow bounceInRight"  data-wow-delay="1.30s">
                                        <% while(rs1.next()) 
                                        {
                                        %>
                                        <option><%=rs1.getString("branch") %></option>
                                        <%} %>
                                        </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="pass" class="btn wow zoomIn" data-wow-delay="2.45s">Password</label>
                                            </div>
                                        <div class="form-group">
                                            <input type="password" id="number" class=" wow bounceInLeft form-control input-lg" data-wow-delay="1.60s" placeholder=<%=rs.getString("password")%> name="pass" required>
                                        </div>
                                        <div class="form-group">
                                 	    <button type="submit" class="btn btn-success wow zoomIn" data-wow-delay="0.3s" value="Register">Save Changes</button>
                                 	    </div>
                                </form>
                              </div></div>
                              </div>
                              </div>
                              </div>
                              
                </section>
                
			
<!-- <form action="/e-canvass/Edit" method="POST"> -->
<!-- <table  style="top:10%;left:34%;height:500px;width:500px;position:absolute;"> -->
<%-- <tr><td>Admission Number </td><td colspan="2"><%=rs.getString("loginId") %></td></tr>
<tr><td>Name </td><td colspan="2"><input type="text" value="<%=rs.getString("name") %>" name="name"/></td></tr>
<tr><td>Password </td><td colspan="2">*******<br/><p style="text-decoration: underline;" onclick="shownpass()">Change Password</p></td></tr>
<tr><td></td><td><input type="text" id="mepass" style="display: none;" value="<%=rs.getString("password") %>"  name="pass"/></td></tr>
<tr><td></td>
<td id="passtxt" style="display:none;">Verify password</td>
<td colspan="2" id="pass" style="display:none;"><input type="password" value="" onblur="checkpass(this.value)"/>
<p id="msgtxt" style="color:red;"></p>
</td>
</tr>
<tr><td >UniversityNumber</td><td colspan="2"><%=rs.getString("universityno")%></td></tr>
<tr><td >Branch</td><td colspan="2"><%=rs.getString("branch")%></td></tr>
<tr><td>User Type</td><td colspan="2"><%=rs.getString("type")%></td></tr>
<tr><td><input type="submit"></td></tr>
</table> --%>
<!-- </form> -->
<%     }}
		catch(SQLException se)
		{
			System.out.println(se);}
			
%>
<script src="/jss_nba/bootstrap/inc/jquery/jquery-1.11.1.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/bootstrap/js/bootstrap.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/owl-carousel/js/owl.carousel.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/stellar/js/jquery.stellar.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/animations/js/wow.min.js"></script>
        <script src="/jss_nba/bootstrap/inc/waypoints.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/isotope.pkgd.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/classie.js"></script>
		<script src="/jss_nba/bootstrap/inc/jquery.easing.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/jquery.counterup.min.js"></script>
		<script src="/jss_nba/bootstrap/inc/smoothscroll.js"></script>

		<!-- Theme JS -->
		<script src="/jss_nba/bootstrap/js/theme.js"></script>
<%}
else
{
	response.sendRedirect("/jss_nba/html/sample.html");
	}%>
</body>
</html>