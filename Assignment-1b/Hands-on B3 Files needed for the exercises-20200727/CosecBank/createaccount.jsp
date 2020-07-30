<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.security.*" %>
<%
boolean end = false;
try {
  // Step 1.- Load the JDBC driver
   Class.forName("com.mysql.jdbc.Driver").newInstance();
  String urlDB = "jdbc:mysql://localhost:3306/CosecBank";
  // Step 2.- Create a Connection object
  Connection con = DriverManager.getConnection(
    urlDB,"root", "");

  System.out.println("got connection");

   // Step 3. Create new user to be inserted in DDBB

  Statement s = con.createStatement();
  request.setCharacterEncoding("UTF-8");
int countIdUser =1;
  ResultSet rs3 = s.executeQuery("SELECT COUNT(*) AS count FROM users");
	while(rs3.next()){
	    countIdUser = rs3.getInt("count")+1;
	}


  ResultSet rs4 = s.executeQuery("SELECT * FROM users WHERE name='"+request.getParameter("name")+"'");
	if (rs4.isBeforeFirst()) {   
		end=true;
	}else{

		  String name=request.getParameter("name");
		  String surname = request.getParameter("surname");

		  //This is just to prevent XSS attacks
		 /* if(request.getParameter("name").indexOf("<script>")!=-1 || request.getParameter("name").indexOf("</script>")!=-1){
			name = name.replaceAll("<script>","");
			name = name.replaceAll("</script>","");
		  }else if(request.getParameter("surname").indexOf("<script>")!=-1 || request.getParameter("surname").indexOf("</script>")!=-1){
			surname = surname.replaceAll("<script>","");
			surname = surname.replaceAll("</script>","");
		  }*/

	
		String pass=request.getParameter("password");
	
		  String insert =
		    "INSERT INTO users ( idUsers, name, surname, password) VALUES ('" +
		    String.valueOf(countIdUser)+
		    "', '" +
		    name+
		    "', '" +
		    surname+
		    "','" +
		    pass+
		    "')";
		   s.executeUpdate(insert);

	}

  s.close();
  con.close();
}
catch (ClassNotFoundException e1) {
  // JDBC driver class not found, print error message to the console
  out.println(e1.toString());
  //end
}
catch (SQLException e2) {
  // Exception when executing java.sql related commands, print error message to the console
  out.println(e2.toString());
  //end
}
catch (Exception e3) {
  // other unexpected exception, print error message to the console
  out.println(e3.toString());
  //end
}

if(!end){
        %>
<jsp:forward page="index.jsp?message=Account created, you may login now! "/>
<% } else { %>
<jsp:forward page="index.jsp?message=Chosen name is not available"/>
<% } %>
