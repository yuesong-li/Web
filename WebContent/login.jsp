<!-- Author Mark Powell -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String login = request.getParameter("login");
	String password = request.getParameter("password");
	if (login.equals("admin") && password.equals("guess")) {
		// Valid login
		session.setAttribute("authorized", "yes");
		out.println("<html>");
		out.println("<head>");
		out.println("<link REL=\"StyleSheet\" TYPE=\"text/css\" HREF=\"css/style.css\">");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class=\"divTopBar\">");
		out.println("<div align=\"center\"><img alt=\"Smart House\" src=\"images/smartHouseLogo.jpg\">");
		out.println("</div>");
		out.println("</div>");
		out.println("<h3>Login Confirmation</h3>");
		out.println("<h4>Please click the link to go to the control panel</h4>");
		out.println("<br><br>");
		out.println("<a href=ServerComms>Go to the control panel</a>");
		out.println("</body>");
		out.println("</html>");

	} else {
		// Invalid login
		session.setAttribute("authorized", "no");
		out.println("<html>");
		out.println("<head>");
		out.println("<link REL=\"StyleSheet\" TYPE=\"text/css\" HREF=\"css/style.css\">");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class=\"divTopBar\">");
		out.println("<div align=\"center\"><img alt=\"Smart House\" src=\"images/smartHouseLogo.jpg\">");
		out.println("</div>");
		out.println("</div>");
		out.println("<h1>Login Denied!</h1>");
		out.println("<br><br>");
		out.println("<a href=index.html>Try again</a>");
		out.println("</body>");
		out.println("</html>");
	}
%>





