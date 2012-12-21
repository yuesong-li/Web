<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="comms.Client"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Author Version 1.0 Mark Powell 25/10/2012-->
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/javascript; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="css/style.css">
<title>Smart House</title>
<!-- This javascript is used to time a refresh of the control panel-->
<script type="text/javascript">
	function setupRefresh() {
		setInterval("refreshFrame();", 50);
	}
	function refreshFrame() {
		parent.menu.location.reload();
	}
</script>
</head>
<body onload="refreshFrame()">

	<%
		String devicesAndStates = "";
		System.out.println("got to indooerLight");
		//Ignore this below if it is a redirect from ServerComms
		if (request.getAttribute("devicesAndStates") != null) {
			System.out.println("got to indooerLight first if");
			devicesAndStates = (String) request
					.getAttribute("devicesAndStates");
			if (devicesAndStates.contains("reload")) {
				System.out.println(" indoorLight second if");
				//out.println(" devicesAndStates is "+devicesAndStates);
			}
		} else {
			System.out.println(" indoorLight else");
			Client client = new Client();
			client = (Client) session.getAttribute("client");
			devicesAndStates = client.getDeviceState();

			//out.println("indoorLight.jsp -  devicesAndStates is "+devicesAndStates);
		}
	%>


	<div class="lightImages">
		<%
			if (devicesAndStates.contains("lightIn:on")) {

				out.println("<div align=\"center\"><img src=\"images/indoor-lamp-on-big.jpg\" >");
			} else {
				out.println("<div align=\"center\"><img src=\"images/indoor-lamp-off-big.jpg\" >");
			}
		%>
	</div>

	<p></p>
	<div class="OnOffBbuttonContainer" align="center">
		<table width="180" border="0">
			<tr>
				<td align="center"><form name="turnIndoorLightOn" method="post"
						action="ServerComms">
						<input type="hidden" name="changeDeviceState" value="lightIn:on">
						<input type="hidden" name="pageToUpdate" value="indoorLight.jsp">
						<label> <input name="ButtonValue" type="submit"
							id="IndoorlightOnButton" value="On"
							style="height: 35px; width: 60px"> <!-- onclick="setupRefresh()" -->
							 <!-- onclick="parent.frames['menu'].location.reload()"> -->
						</label>
					</form></td>
				<td align="center"><form name="turnIndoorLightOff"
						method="post" action="ServerComms">
						<input type="hidden" name="changeDeviceState" value="lightIn:off">
						<input type="hidden" name="pageToUpdate" value="indoorLight.jsp">

						<input type="submit" name="ButtonValue" id="lightOffButton"
							value="Off" style="height: 35px; width: 60px">
						<!--onclick="parent.frames['menu'].location.reload()"  -->


						</label>

					</form></td>
			</tr>
		</table>

	</div>
	<!-- End OnOffBbuttonContainer Div -->
</body>
</html>