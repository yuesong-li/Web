<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Author Version 1.0 Mark Powell 25/10/2012-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="css/style.css">

<title>Smart House</title>
<style type="text/css">

body{
margin: 0;
padding: 0;
border: 0;
overflow: hidden;
height: 100%; 
max-height: 100%; 
}

#framecontentLeft, #framecontentTop{
position: absolute; 
top: 0; 
left: 0; 
width: 200px; /*Width of left frame div*/
height: 100%;
overflow: hidden; /*Disable scrollbars. Set to "scroll" to enable*/
background-color: navy;
color: white;
}

#framecontentTop{ 
left: 200px; /*Set left value to WidthOfLeftFrameDiv*/
right: 0;
width: auto;
height: 180px; /*Height of top frame div*/
overflow: hidden; /*Disable scrollbars. Set to "scroll" to enable*/
background-color: navy;
color: white;
}

#maincontent{
position: fixed; 
left: 200px; /*Set left value to WidthOfLeftFrameDiv*/
top: 120px; /*Set top value to HeightOfTopFrameDiv*/
right: 0;
bottom: 0;
overflow: auto; 
background: #fff;
}

.innertube{
margin: 15px; /*Margins for inner DIV inside each DIV (to provide padding)*/
}

* html body{ /*IE6 hack*/
padding: 120px 0 0 200px; /*Set value to (HeightOfTopFrameDiv 0 0 WidthOfLeftFrameDiv)*/
}

* html #maincontent{ /*IE6 hack*/
height: 100%; 
width: 100%; 
}

* html #framecontentTop{ /*IE6 hack*/
width: 100%;
}

</style>

<script type="text/javascript">
/*** Temporary text filler function. Remove when deploying template. ***/
var gibberish=["This is just some filler text", "Welcome to Dynamic Drive CSS Library", "Demo content nothing to read here"]
function filltext(words){
for (var i=0; i<words; i++)
document.write(gibberish[Math.floor(Math.random()*3)]+" ")
}
</script>

</head>

<body>

<div id="framecontentLeft">
<div class="innertube">

<h3>Sample text here</h3>

</div>
</div>

<div id="framecontentTop">
<div class="innertube">

<div class="divTopBar">
		<div align="center">
			<img alt="Smart House" src="images/smartHouseLogo.jpg">
		</div>
	</div>
</div>
</div>


<div id="maincontent">
<div class="innertube">

<h1>Dynamic Drive CSS Library</h1>
<p><script type="text/javascript">filltext(255)</script></p>
<p style="text-align: center">Credits: <a href="http://www.dynamicdrive.com/style/">Dynamic Drive CSS Library</a></p>

</div>
</div>


</body>
</html>
