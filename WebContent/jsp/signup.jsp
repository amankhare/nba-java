<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Jss-Nba</title>
		<meta name="description" content="Unika - Responsive One Page HTML5 Template">
		<meta name="keywords" content="HTML5, Bootsrtrap, One Page, Responsive, Template, Portfolio" />
		<meta name="author" content="imransdesign.com">

		<meta name="viewport" content="width=device-width, initial-scale=1">
        

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
                      <a class="navbar-brand page-scroll" href="/jss_nba/html/sample.html">JSS-NBA</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a class="page-scroll" href="/jss_nba/html/sample.html">Home</a></li>
                            <li><a class="page-scroll" href="/jss_nba/html/sample.html#login-section">LogIn</a></li>
			    <li><a class="page-scroll" href="/jss_nba/html/sample.html#about-section">About</a></li>
                            <!-- <li><a class="page-scroll" href="#services-section">Services</a></li>-->
                            <li><a class="page-scroll" href="/jss_nba/html/sample.html#team-section">Team</a></li>
                            <li><a class="page-scroll" href="/jss_nba/html/sample.html#signup-section">SignUp</a></li>                            
                            <!--  <li><a class="page-scroll" href="#prices-section">Prices</a></li>  -->
                            <li><a class="page-scroll" href="/jss_nba/html/sample.html#contact-section">Contact</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                  </div><!-- /.container -->
                </nav>
                <!-- End Navbar -->

            </header>

<title>Registration..</title>
<script type="text/javascript">
function checkuserid(uid)
{
	
	
	if(XMLHttpRequest)
		{
		x=new XMLHttpRequest();
		}
		
	x.onreadystatechange=function()
	{
		
		if(x.readyState==4 && x.status==200)
		{
		var info=x.responseText;//used to store the response send by the server
		document.getElementById("msgtxt").innerHTML=info;
		}
	}
	x.open("GET","/jss_nba/register?us="+uid,true);
	x.send(null);
	
	}
</script>

</head>
<body style="background-image: url('/jss_nba/images/1.jpg	');background-size: 100% 650px;">
-<!-- <div class="page-loader"></div> --> 
<div class="body">
<div class="container">
<div>
<h2 style="text-align: center;">REGISTER...</h2>
</div>
<section id="login-section" class="page bg-style1">
  <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInUp" data-wow-delay="0.4s">
                            <h2>Sign Up</h2>
                            <div class="devider"></div>
                            <p class="subtitle">Begin your journey from here. </p>
        
                    
		
		<div class="col-sm-6">
                                <div class="contact-form ">
                                	<h4></h4>
                                    <form role="form"   action="/jss_nba/registration" method="post" class="text-center ">
                                        <div class="form-group text-center">
                                            <input type="text" class=" wow bounceInRight form-control input-lg" data-wow-delay="0.8s"  placeholder="Your Name" name="name" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class=" wow bounceInLeft form-control input-lg" data-wow-delay="1s" placeholder="To be loginid" name="admissionno" required><p id="msgtxt" style="color:red;"></p>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class=" wow bounceInRight form-control input-lg" data-wow-delay="1.20s" onblur="checkuserid(this.value)" placeholder="College Id No." name="universityroll" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class=" wow bounceInLeft form-control input-lg" data-wow-delay="1.25s" placeholder="Password" name="password" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="number" class=" wow bounceInRight form-control input-lg" data-wow-delay="1.30s" placeholder="Contact" name="phonenumber" required>
                                        </div>
                                        <!-- <div class="form-group">
                                            <input type="radio" class="form-control input-lg" data-wow-delay="0.8s"  name="type" value="teacher" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="radio" class="form-control input-lg" data-wow-delay="0.8s" value="hod" name="type" required>
                                        </div> -->
				    <button type="submit" class="btn wow zoomIn" data-wow-delay="2s" value="Register">SignUp</button>
                                    </form>
                               </div>
		</div>	                                
                </div>
		</div>
</div>
                </section>
                
        
</div></div>
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
</body>
</html>