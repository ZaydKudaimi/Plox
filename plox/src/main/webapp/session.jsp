<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creating Session</title>
</head>
<body>
<%

String email = request.getParameter("email");
String password = request.getParameter("password");

session.setAttribute("isAdmin", false);
session.setAttribute("sessid", null);
session.setAttribute("sessemail", null);


try { 
	java.sql.Connection con; 
	Class.forName("com.mysql.cj.jdbc.Driver"); 

	con = DriverManager.getConnection("jdbc:mysql://ploxfinaldb-do-user-13036958-0.b.db.ondigitalocean.com:25060/defaultdb?autoReconnect=true&useSSL=false", "doadmin", "AVNS_W5T6PFxSzJBltRHm6b4");
	Statement stmt = con.createStatement();
	ResultSet res1 = stmt.executeQuery("SELECT * FROM defaultdb.account WHERE email = '" + email + " AND password =" + password + ";");
	
	if (res1.next()) {
		int id = res1.getInt("accountId");
		request.setAttribute("EMAIL", res1.getString("email"));
		

		
		
		session.setAttribute("sessid", id);
		session.setAttribute("sessemail", email);
		
		
	 }
	
	
	con.close(); 
	}catch(SQLException e) { 
		out.println("SQLException caught: " +e.getMessage()); 
	} 
	String redirectURL = "http://165.232.142.252:8080/plox/dashboard.jsp";


	
    response.sendRedirect(redirectURL);
%>
</body>
</html>