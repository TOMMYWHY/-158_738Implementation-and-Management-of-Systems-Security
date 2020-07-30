<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>COSEC-BANK</title>

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />


</head>

<body>

  <span href="#" class="tag" id="toggle-login">Log in</span>

<div id="login">
  <div id="triangle"></div>
  <h1>Log in</h1>
    <form method="post" action="login.jsp" name="log" id="log">
    <input type="name" id="name"  name="name" placeholder="Name"/>
    <input type="password" id="password" name="password" placeholder="Password"/>
    <input type="submit" value="Log in" />
  </form>
</div>

<% if(request.getParameter("message")!=null){%>
		<div id="login">
	<%= request.getParameter("message")%>
		</div>
<% }%>
	
				  
<div id="login">
   <form method="post" action="register.jsp" name="reg" id="reg">
     <input type="submit" value="Register" />
  </form>
</div>

<div id="footer">
	<div >
	  <div > COSEC - BANK </div>
	</div>
</div>
</body>

</html>
