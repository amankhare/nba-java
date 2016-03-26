<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="HTML5, Bootsrtrap, One Page, Responsive, Template, Portfolio" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/jss_nba/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/jss_nba/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/jss_nba/bootstrap/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="/jss_nba/bootstrap/bootstrap-responsive.min.css">
<link rel="stylesheet" type="text/css" href="/jss_nba/bootstrap/bootstrap.js">
<link rel="stylesheet" type="text/css" href="/jss_nba/bootstrap/bootstrap.min.js">

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
<div class="container">
<div>
<h2 style="text-align: center;">REGISTER...</h2>
</div>
<form action="/jss_nba/registration" method="post">
<table  style="top:10%;left:34%;height:500px;width:500px;position:absolute;">
<tr class="text" style="color:blue;"><td >Name </td><td colspan="2"><input type="text" class="form-control" name="name"/></td></tr>
<tr style="color:blue;"><td >LoginId </td><td colspan="2"><input type="text" class="form-control" name="admissionno" onblur="checkuserid(this.value)" />
<p id="msgtxt" style="color:red;"></p></td></tr>
<tr style="color:blue;"><td >Id No.. </td><td colspan="2"><input type="text" class="form-control" name="universityroll" onblur="checkuserid(this.value)" />
<tr style="color:blue;"><td>Password</td>
<td colspan="2"><input type="password" class="form-control" name="password"/></td></tr>
<tr style="color:blue;"><td>PhoneNumber</td><td colspan="2"><input type="text" class="form-control" name="phonenumber"/></td></tr>
<tr style="color:blue;"><td>Type</td><td>Teacher<input type="radio" name="type" class="form-control" value="teacher" onclick="hideFacility()"></td><td>Student<input type="radio" name="type" value="student" onclick="showFacility()"></td></tr>
<tr style="color:blue; "><td>Department</td>
<td colspan="2"><select name="department" >
<option value="IT">Information Technology</option>
<option value="CS">Computer Science</option>
<option value="ME">Mechanical Engineering</option>
<option value="EE">Electrical Engineering</option></select></td></tr>
<tr><th colspan="3"><input type="submit" class="btn btn-primary" value="Register"/></th></tr></table></form><!-- </div> -->
</div>
</body>
</html>