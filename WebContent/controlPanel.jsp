<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="comms.Client"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Author Version 1.0 Mark Powell 25/10/2012-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="css/style.css">
<SCRIPT>
	function aReload() {
		location.reload(true);
	}

	function startReload() {
		setTimeout("aReload()", 1000);
	}
	function playSound(soundfile) {
		document.getElementById("alarm").innerHTML = "<embed src=\""+soundfile+"\" hidden=\"true\" autostart=\"true\" loop=\"false\" />";
	}
	function changeImage(a, soundfile) {
		document.getElementById("img").src = a;
		document.getElementById("alarm").innerHTML = "<embed src=\""+soundfile+"\" hidden=\"true\" autostart=\"true\" loop=\"false\" />";
	}
</SCRIPT>
<title>Smart House</title>
</head>
<body id="borderRight">
	<span id="alarm"></span>
	<!-- onLoad="startReload();"  -->
	<%
		//response.setHeader("refresh", "5;url=controlPanel.jsp");
	%>
	<%
		Client client = new Client();
		client = (Client) session.getAttribute("client");
		String devicesAndStates = "";
		String tempRoomJustNum = "";
		String tempLoftJustNum = "";
		if (client.getInitialStatesFromServerStartUpString().contains(
				"lightIn")) {
			devicesAndStates = client
					.getInitialStatesFromServerStartUpString();
			String[] devicesAndStatesArray = devicesAndStates.split(",");
			String tempRoomFull = devicesAndStatesArray[5]; //Get indoor room temperature
			String[] tempRoomArray = tempRoomFull.split(":");
			tempRoomJustNum = tempRoomArray[1];
			//Get temp loft
			String tempLoftFull = devicesAndStatesArray[6]; //Get indoor room temperature
			String[] tempLoftArray = tempLoftFull.split(":");
			tempLoftJustNum = tempLoftArray[1];
			System.out.println("tr = " + tempRoomArray[1]);
			//We then set it to empty as we only needed to use it on first load
			client.emptyTheInitialStates();
		} else {

			devicesAndStates = client.getDeviceState();
			String[] devicesAndStatesArray = devicesAndStates.split(",");
			String tempRoomFull = devicesAndStatesArray[5]; //Get indoor room temperature
			String[] tempRoomArray = tempRoomFull.split(":");
			tempRoomJustNum = tempRoomArray[1];
			//Get temp loft
			String tempLoftFull = devicesAndStatesArray[6]; //Get indoor room temperature
			String[] tempLoftArray = tempLoftFull.split(":");
			tempLoftJustNum = tempLoftArray[1];
			System.out.println("tr = " + tempRoomArray[1]);
		}

		//out.println(" new state is "+newState);
	%>
	<div class="divRightBar">
		<h2 id="WhiteBackgroundRedText">Control Panel</h2>
		<h3 id="RedBackgroundWhiteText">Indoor Devices</h3>
		<h3 id="borderTemp">
			Temperature:
			<%=tempRoomJustNum%>
			&deg;C
		</h3>



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

				out.println("<div align=\"center\"><a href=\"indoorFan.jsp\" target=\"content\"><img border=\"0\" src=\"images/fan_rotate_small_on.gif\" ></a></p>");
			} else {
				out.println("<div align=\"center\"><a href=\"indoorFan.jsp\" target=\"content\"><img border=\"0\" src=\"images/fan_rotate_small_off.jpg\" ></a></p>");
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
		<!-- Outdoor temp -->
		<h3 id="borderTemp">
			Temperature:
			<%=tempLoftJustNum%>
			&deg;C
		</h3>
		<br>
		<!-- End Outdoor temp -->
		<!--Outdoor light  -->
		<%
			if (devicesAndStates.contains("lightOut:on")) {

				out.println("<div align=\"center\"><a href=\"outdoorLight.jsp\" target=\"content\"><img border=\"0\" src=\"images/lamp-outdoor-on-small.jpg\" ></a></p>");
			} else {
				out.println("<div align=\"center\"><a href=\"outdoorLight.jsp\" target=\"content\"><img border=\"0\" src=\"images/lamp-outdoor-off-small.jpg\" ></a></p>");
			}
		%>

		<!-- End Outdoor Devices -->
		<!-- Start Fire Alarm  -->


		<div id="smokeAlarmImage">
			<h3 id="RedBackgroundWhiteText">Alarm</h3>
			<img id="img" src='images/smokedetectorSmalloff.gif'
				onclick='changeImage("images/smokedetectorSmall.gif" ); '
				onmouseout="playSound('alarmsound.mp3');">
		</div>

		<!-- End Fire Alarm  -->
		<!-- Refresh the page button  not used but kept for possible testing needs-->
		<!--  <a href="javascript:document.location.reload();"
			ONMOUSEOVER="window.status='Refresh'; return true"
			ONMOUSEOUT="window.status='Refresh to get actual device states'">
			<img src="images/Reload-icon-small.png" width="55" height="55"
			border="0" />
		</a>-->
		<!-- End Refresh the page button -->
	</div>
</body>
</html>