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
		String newState = "";
		if (request.getAttribute("newLightState") != null) {
			newState = (String) request.getAttribute("newLightState");
		}
		//out.println(" new state is "+newState);
	%>

	<div class="divTopBar">
		<div align="center">
			<img alt="Smart House" src="images/smartHouseLogo.jpg">
		</div>
	</div>
	<div class="lightImages">
		<%
			if (newState.equals("on")) {

				out.println("<div align=\"center\"><img src=\"images/lightBulbOnSmall.jpg\" width=\"151\" height=\"224\">");
			} else {
				out.println("<div align=\"center\"><img src=\"images/lightBulbOffSmall.jpg\" width=\"151\" height=\"224\">");
			}
		%>
	</div>
	<div class="OnOffBbuttonContainer" align="center">
		<table width="200" border="0">
			<tr>
				<td align="center"><form name="turnLightOn" method="post"
						action="ServerComms">
						<label> <input name="lightStateButtonValue" type="submit"
							id="lightOnButton" value="on" style="height: 35px; width: 60px">
						</label>
					</form>
				</td>
				<td align="center"><form name="turnLightOff" method="post"
						action="ServerComms">
						<label> <input name="lightStateButtonValue" type="submit"
							id="lightOffButton" value="off" style="height: 35px; width: 60px">>
						</label>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<!-- End OnOffBbuttonContainer Div -->
</body>
</html>