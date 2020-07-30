<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.security.*" %>
<%@ page import = "java.sql.PreparedStatement" %>

<%
String userName="";
	java.util.Vector<java.util.Hashtable> usersData=null;
try {
  // Step 1.- Load the JDBC driver
   Class.forName("com.mysql.jdbc.Driver").newInstance();
  String urlDB = "jdbc:mysql://localhost:3306/CosecBank";
  // Step 2.- Create a Connection object
  Connection con = DriverManager.getConnection(
    urlDB,"root", "");

  System.out.println("got connection yeah");

   // Step 3. Create new user to be inserted in DDBB

  Statement s = con.createStatement();
  request.setCharacterEncoding("UTF-8");

  userName = request.getParameter("name");
  String password = request.getParameter("password");

  ResultSet result = s.executeQuery("SELECT name,surname FROM users WHERE password='"+request.getParameter("password")+"'");
	if(result!=null){
	   ResultSet result1 = s.executeQuery("SELECT name,surname FROM users WHERE name='"+request.getParameter("name")+"'");
    
	if(result1!=null){
       	usersData = new java.util.Vector<java.util.Hashtable>();
            while(result1.next()){
	
				java.util.Hashtable<String,String> rowUser = new java.util.Hashtable<String,String>();
		        rowUser.put("name",result1.getString("name"));
				rowUser.put("surname",result1.getString("surname"));
				usersData.add(rowUser);
		
            }
	}else{
		//authentication fail
		System.out.println("nothing got it from db");
	}

       
	
%>
		
<html>

<head>

  <meta charset="UTF-8">

  <title>COSEC BANK</title>

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />

</head>

<body>


<div id="login">
  <h1>Users data</h1>
<table>
  <tr>
    <td>Surname, Name</td>

  </tr>
 
  
	 <%
		
		for(int i=0;i<usersData.size();i++){
			String nameUser = (String)usersData.get(i).get("name");
			String surnameUser = (String)usersData.get(i).get("surname");
			%>
			<tr>
                            <td><%=surnameUser%>,<%=nameUser%></td>
			</tr>
			<%
			
		}
	%>
	
   
</table>
</div>





<div id="login">
	<form method="post" action="index.jsp" name="clientsData" id="clientsData">
     <input type="submit" value="Exit" />
  </form>
  
<div id="footer">
	<div >
	  <div > COSEC - BANK </div>
	</div>
</div>
</body>

</html>

<%		

   }
  con.close();
}catch (ClassNotFoundException e1) {
  // JDBC driver class not found, print error message to the console
  out.println("ERROR 1a: "+e1.toString());
  //end
}
catch (SQLException e2) {
  // Exception when executing java.sql related commands, print error message to the console
  out.println("ERROR 2a: "+e2.toString());
  //end
}
catch (Exception e3) {
  // other unexpected exception, print error message to the console
  out.println("ERROR 3a: "+e3.toString());
  //end
}
%>
