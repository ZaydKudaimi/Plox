<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handle Confirmation</title>
</head>
<body>
<%


int hangarid = Integer.parseInt(request.getParameter("id"));
out.println(hangarid);



try { 
	java.sql.Connection con; 
	Class.forName("com.mysql.jdbc.Driver"); 

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Plox?autoReconnect=true&useSSL=false", "root", "Root123@");

	int accountId = -1;
	Statement stmt = con.createStatement();
	ResultSet res1 = stmt.executeQuery("SELECT accountId FROM plox.account WHERE accountId=" + session.getAttribute("sessId") + "");
	while(res1.next()) {
			accountId = res1.getInt("accountId");
	stmt.executeUpdate("UPDATE Hangar SET Rented_By = '"+ accountId+"' WHERE Hangar_ID=" + hangarid + ";");
	
		
		
	 
	
	
	con.close(); 
	}
}catch(SQLException e) { 
		out.println("SQLException caught: " +e.getMessage()); 
	} 
	String redirectURL = "http://localhost:8080/plox/renthangar.jsp";

    response.sendRedirect(redirectURL);
%>
</body>
</html>