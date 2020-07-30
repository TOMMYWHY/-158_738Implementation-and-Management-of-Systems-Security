<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Register Form - COSEC BANK</title>

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />


</head>

<body>

  <span href="#" class="tag" id="toggle-login">Register</span>

<div id="login">
  <div id="triangle"></div>
  <h1>Register</h1>
  <form  action="createaccount.jsp" name="create" id="create" method="post">
	<input type="name" id="name" name="name" placeholder="Name"/>
	<input type="name" id="surname" name="surname" placeholder="Surname"/>
    <input type="password" id="password" name="password" placeholder="Password" />
	<input type="password" id="confirmpassword" name="confirmpassword" placeholder="Confirm password" />
    <input type="submit" value="Register" />
  </form>
</div>


<div id="login">
   <form method="post" action="index.jsp" name="create" id="create">
     <input type="submit" value="Exit" />
  </form>
</div>


<div id="footer">
	<div >
	  <div > COSEC - BANK </div>
	</div>
</div>
</body>

</html>
