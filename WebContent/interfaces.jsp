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

	<div class="divTopBar">
		<div align="center">
			<img alt="Smart House" src="images/smartHouseLogo.jpg" width="150"
				height="100">
		</div>
	</div>

	<div class="container">
		<div class="fake_img">
			<%
				if (devicesAndStates.contains("lightIn:on")) {
			%>
			<img alt="Smart House" src="images/lighton.png" width="90"
				height="100">
			<%
				} else if (devicesAndStates.contains("lightIn:off")) {
			%>
			<img alt="Smart House" src="images/lightoff.png" width="90"
				height="100">
			<%
				}
			%>
			<form name="turnLightInOn" method="post" action="ServerComms">
				<input name="button" type="submit" id="lightOnButton"
					value="lightIn:on" style="height: 20px; width: 40px">
			</form>
			<form name="turnLightInOff" method="post" action="ServerComms">
				<input name="button" type="submit" id="lightOffButton"
					value="lightIn:off" style="height: 20px; width: 40px">
			</form>
		</div>


		<div class="fake_img">
			<%
				/* Light outside */
				if (devicesAndStates.contains("lightOut:on")) {
			%>

			<img alt="Smart House" src="images/lightOn2.jpg" width="90"
				height="100">
			<%
				} else if (devicesAndStates.contains("lightOut:off")) {
			%>
			<img alt="Smart House" src="images/lightOff2.jpg" width="90"
				height="100">
			<%
				}
			%>
			<form name="turnLightOutOn" method="post" action="ServerComms">
				<input name="button" type="submit" id="lightOnButton2"
					value="lightIn:on" style="height: 20px; width: 40px">
			</form>
			<form name="turnLightOutOff" method="post" action="ServerComms">
				<input name="button" type="submit" id="lightOffButton2"
					value="lightOut:off" style="height: 20px; width: 40px">
			</form>
		</div>

		<div class="fake_img">
			<%
				if (devicesAndStates.contains("fan:on")) {
			%>
			<img alt="Smart House" src="images/fanon.png" width="90" height="100">
			<%
				} else if (devicesAndStates.contains("fan:off")) {
			%>
			<img alt="Smart House" src="images/fanoff.png" width="90"
				height="100">
			<%
				}
			%>
			<form name="turnFanOn" method="post" action="ServerComms">
				<input name="button" type="submit" id="fanOnButton" value="fan:on"
					style="height: 20px; width: 40px">
			</form>
			<form name="turnFanOff" method="post" action="ServerComms">
				<input name="button" type="submit" id="fanOffButton" value="fan:off"
					style="height: 20px; width: 40px">
			</form>
		</div>



		<div class="fake_img">
			<%
				if (devicesAndStates.contains("heaterRoom:on")) {
					%>
			<img alt="Smart House" src="images/alarmon.gif" width="90"
				height="100">
			<%
				} else if (devicesAndStates.contains("heaterRoom:on")) {
			%>
			<img alt="Smart House" src="images/alarmOff.gif" width="90"
				height="100">
			<%
			}
			%>
			<form name="turnRoomHeaterOn" method="post" action="ServerComms">
				<input name="button" type="submit" id="heaterRoomOnButton"
					value="heaterRoom:on" style="height: 20px; width: 40px">
			</form>
			<form name="turnRoomHeaterOff" method="post" action="ServerComms">
				<input name="button" type="submit" id="heaterRoomOffButton"
					value="heaterLoft:off" style="height: 20px; width: 40px">
			</form>
		</div>

	</div>

	<div class="OnOffBbuttonContainer" align="center">
		<table width="100" border="0">
			<tr>
				<td align="left"><form name="turnLightOn" method="post"
						action="ServerComms">
						<label> <input name="lightStateButtonValue" type="submit"
							id="lightOnButton" value="on" style="height: 20px; width: 40px">
						</label>
					</form></td>
				<td align="left">
					<form name="turnLightOff" method="post" action="ServerComms">
						<label> <input name="lightStateButtonValue" type="submit"
							id="lightOffButton" value="off" style="height: 20px; width: 40px" />
						</label>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<!-- End OnOffBbuttonContainer Div -->
</body>
</html>