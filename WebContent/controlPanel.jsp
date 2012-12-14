<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Author Version 1.0 Mark Powell 25/10/2012-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="css/style.css">

<title>Smart House</title>
</head>
<body>
	<%
	
		String devicesAndStates = "";
		if (request.getAttribute("deviceStates") != null) {
			devicesAndStates = (String) request
					.getAttribute("deviceStates");
		}
		//out.println(" new state is "+newState);
	%>
<h3>Control Panel</h3>
<div class="lightImages">
	<%
		if (devicesAndStates.contains("lightIn:on")) {

		out.println("<div align=\"center\"><img src=\"images/lightBulbOnSmallControlPanel.jpg\" >");
		} else {
		out.println("<div align=\"center\"><img src=\"images/lightBulbOffSmallControlPanel.jpg\" >");
			}
	%>
</div>

<p><a href="indoorLight.jsp" target="content">Indoor Light</a></p>

<h4>&nbsp;</h4>
</body>
</html>