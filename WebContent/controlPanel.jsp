<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="comms.Client"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Author Version 1.0 Mark Powell 25/10/2012-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="css/style.css">

<title>Smart House</title>
</head>
<body id="borderRight">
	<%
		Client client = new Client();
	    client = (Client) session.getAttribute("client");
	    String devicesAndStates = "";
	    if(client.getInitialStatesFromServerStartUpString().contains("lightIn")){
	    	devicesAndStates = client.getInitialStatesFromServerStartUpString();
	    	//We then set it to empty as we only needed to use it on first load
	    	client.emptyTheInitialStates();
	    }else{
	    	devicesAndStates = client.getDeviceState();
	    }
	    
	    
	    System.out.println("controlPanel = devicesAndStates is "+devicesAndStates);
		//if (request.getAttribute("deviceStates") != null) {
			//devicesAndStates = (String) request
					//.getAttribute("deviceStates");
		//}
		//out.println(" new state is "+newState);
	%>
<div class="divRightBar">
<h2 id="WhiteBackgroundRedText">Control Panel</h2>
<h3 id="RedBackgroundWhiteText">Indoor Devices</h3>
<br>
<!-- Indoor Devices -->
	<%
	//Indoor Light
		if (devicesAndStates.contains("lightIn:on")) {

			out.println("<div align=\"center\"><a href=\"indoorLight.jsp\" target=\"content\"><img border=\"0\" src=\"images/indoor-lamp-on-small.jpg\" ></a></p>");
		} else {
			out.println("<div align=\"center\"><a href=\"indoorLight.jsp\" target=\"content\"><img border=\"0\" src=\"images/indoor-lamp-off-small.jpg\" ></a></p>");
			}
	//Indoor fan (Ventilation)
	if (devicesAndStates.contains("fan:on")) {

		out.println("<div align=\"center\"><a href=\"indoorFan.jsp\" target=\"content\"><img border=\"0\" src=\"images/fan_on_small.jpg\" ></a></p>");
	} else {
		out.println("<div align=\"center\"><a href=\"indoorFan.jsp\" target=\"content\"><img border=\"0\" src=\"images/fan_off_small.jpg\" ></a></p>");
		}


	//Indoor Heater
			if (devicesAndStates.contains("heaterRoom:on")) {

				out.println("<div align=\"center\"><a href=\"indoorHeater.jsp\" target=\"content\"><img border=\"0\" src=\"images/indoorHeater_on_small.jpg\" ></a></p>");
			} else {
				out.println("<div align=\"center\"><a href=\"indoorHeater.jsp\" target=\"content\"><img border=\"0\" src=\"images/indoorHeater_off_small.gif\" ></a></p>");
				}
		
	%>
<!-- End Indoor Devices -->
<h3 id="RedBackgroundWhiteText">Loft Devices</h3>
<!-- Loft Devices -->
<br>
<%
	//Loft heater	
	if (devicesAndStates.contains("heaterLoft:on")) {

			out.println("<div align=\"center\"><a href=\"loftHeater.jsp\" target=\"content\"><img border=\"0\" src=\"images/loftHeater_on_small.jpg\" ></a></p>");
		} else {
			out.println("<div align=\"center\"><a href=\"loftHeater.jsp\" target=\"content\"><img border=\"0\" src=\"images/loftHeater_off_small.jpg\" ></a></p>");
			}
		
	%>
<br>
<!-- End Loft Devices -->
<h3 id="RedBackgroundWhiteText">Outdoor Devices</h3>
<!-- Outdoor Devices -->
<br>
<%
	//Outdoor light	
	if (devicesAndStates.contains("lightOut:on")) {

			out.println("<div align=\"center\"><a href=\"outdoorLight.jsp\" target=\"content\"><img border=\"0\" src=\"images/lamp-outdoor-on-small.jpg\" ></a></p>");
		} else {
			out.println("<div align=\"center\"><a href=\"outdoorLight.jsp\" target=\"content\"><img border=\"0\" src=\"images/lamp-outdoor-off-small.jpg\" ></a></p>");
			}
		
	%>

<!-- End Outdoor Devices -->
<!-- Refresh the page button -->
<a href="javascript:document.location.reload();"
ONMOUSEOVER="window.status='Refresh'; return true"
ONMOUSEOUT="window.status='Refresh to get actual device states'">
<img src="images/Reload-icon-small.png" 
width="55" height="55" border="0" /></a>
<!-- End Refresh the page button -->
</div>
</body>
</html>