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
		String userName = "nothing";
		if (request.getAttribute("username") != null) {
			userName = (String) request
					.getAttribute("username");
		}
		//out.println(" Got to main_fram devices =  "+devicesAndStates);
%>
<!--
======================================================================================================
This template is available for free download from the Quackit website.

If you have found it to be useful, please consider linking from your website to http://www.quackit.com

Thanks!
======================================================================================================

Note the following:
1. Each frame has it's own 'frame' tag.
2. Each frame has a name (eg, name="menu"). This is used for when you need to load one frame from another. For example, your left frame might have links that, when clicked on, loads a new page in the right frame. This is acheived by using 'target="content"' within your links/anchor tags.
3. Each 'frame' tag has a 'src' attribute. This is where you specify the name of the file to be loaded into that frame when the page first loads.
4. You can change the size of the frames by changing the value of the 'cols' and/or 'rows' attribute. A value of "200" sets the frame at 200 pixels. An asterisk (*) specifies that the frame should use up whatever space is left over from the other frames. You can also use percentage values if desired (i.e. 20%,80%)
5. To specify a border, set 'frameborder' and 'border' to "1". I included both attributes for maximum browser compatibility.
6. The 'framespacing' attribute doesn't work in all browsers, but you can set any numeric value you like here.
7. To learn more about HTML frames, check out: http://www.quackit.com/html/tutorial/html_frames.cfm
-->

<frameset cols="200,*" frameborder="0" border="0" framespacing="0">
	<frame name="menu" src="ControlPanel" marginheight="0" marginwidth="0" scrolling="auto" noresize>
<frameset rows="230,*" frameborder="0" border="0" framespacing="0">
  	<frame name="topNav" src="top_bar.html">
	<frame name="content" src="content.html" marginheight="0" marginwidth="0" scrolling="auto" noresize>
</frameset>

<noframes>
<p>This section (everything between the 'noframes' tags) will only be displayed if the users' browser doesn't support frames. You can provide a link to a non-frames version of the website here. Feel free to use HTML tags within this section.</p>
</noframes>

</frameset>
</html>