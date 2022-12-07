<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*" %> 

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv=""X-UA-Compatible" content = "IE=edge">
    <meta name="viewport content =" width="device-width," initial-scale="1.0" />
    <title>Plox</title>
    <link rel="stylesheet" href="style.css" />
    <script
      src="https://kit.fontawesome.com/cea7d28c84.js"
      crossorigin="anonymous"
    ></script>
  </head>


<nav>
      <div class="nav-left">
        <img src="plox_name3.png" class="logo" />
        <div class="about-msg">
           <h1> Where Your Air Car Sleeps </h1>
        </div>
       
      </div>

      <div class="nav-right">


        <ul>
         
         <li>
              <form action="home.jsp" method="POST">
             
                 <div class="logout-btn">
                     <input type="submit" style="background-color: hsl(351, 4%, 66%)"
                         value=" LogOut ">
                 </div>        
             </form>    
         </li>
          <li>
         <form action="dashboard.jsp" method="POST">
             
                 <div class="Home-btn">
                     <input type="submit" style="background-color: hsl(351, 4%, 66%)"
                         value="HOME ">
                 </div>        
             </form>   
          </li>
        </ul>
        
        <div class="dropdown">
          <button class="dropbtn"> <b>REPORT</b> 
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="dashboard.jsp">MASTER REPORT</a>
            <a href="renting.jsp">RENTING REPORT</a>
            <a href="renthangar.jsp">LISTING REPORT</a>
          </div>
        </div>


      </div>
    </nav>
    <div class="container">
      <div class="main-content"></div>
    </div>
<br><br><h3 class ="center">Renting Report For Hangar Owners</h3><br><br>

<table style="width: 100%;" class="greenTable" border="1">
             <tr>
                <td>Hangar ID</td>
                <td>Name</td>
                <td>City</td>
                <td>Address</td>
                <td>Dimension</td>
                <td>Enclosure type</td>
                <td>Price</td>
                <td>Duration</td>
                <td>Heating</td>
                <td>Water and Electricity</td>
                <td>Technician</td>
                <td>First Name</td>
                <td>Last Name</td>
                
</tr>
<%

 	try { 
		java.sql.Connection con; 
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Plox?autoReconnect=true&useSSL=false", "root", "0906clcl");
		Statement stmt = con.createStatement();
		int accountId = -1;
		ResultSet res1 = stmt.executeQuery("SELECT accountId FROM plox.account WHERE accountId=" + session.getAttribute("sessId") + "");
		
 		if(res1.next()) {
 			accountId = res1.getInt("accountId");
 			
 		}
 		/* String subq1 = "SELECT Rented_By FROM renting WHERE Rented_By = '" + res1 + "'"; */
		ResultSet master = stmt.executeQuery("SELECT  h.hangar_id, h.name, h.city, h.address, h.Dimension, h.Enclosure_Type, h.Price, h.Available_Duration, h.Heating, h.Water_and_Electricity, h.Technician, u.First_Name, u.Last_Name, u.address FROM Hangar h JOIN Rental_Period rp ON h.Rented_By = rp.Rentee_User JOIN User u ON rp.Rentee_User = u.User_ID WHERE h.Rented_By is not null  AND h.Owned_By = '2'");
		
	%>
	
 			
        <!-- <table style="width: 100%;" class="greenTable" border="1">
             <tr>
                <td>Hangar ID</td>
                <td>Name</td>
                <td>City</td>
                <td>Address</td>
                <td>Dimension</td>
                <td>Enclosure type</td>
                <td>Price</td>
                <td>Duration</td>
                <td>Heating</td>
                <td>Water and Electricity</td>
                <td>Technician</td>
                <td>Rented By</td>
                
</tr> -->
	<% 

	while (master.next()){
 		
 		%>
		<tr>
			<td><% out.println(master.getInt("Hangar_ID")); %></td>
 			<td><% out.println(master.getString("Name")); %></td>
 			<td><% out.println(master.getString("City")); %></td>
 			<td><% out.println(master.getString("Address")); %></td>
 			<td><% out.println(master.getString("Dimension")); %></td>
 			<td><% out.println(master.getString("Enclosure_Type")); %></td>
 			<td><% out.println(master.getInt("Price")); %></td>
 			<td><% out.println(master.getInt("Available_Duration")); %></td>
 			<td><% out.println(master.getString("Heating")); %></td>
 			<td><% out.println(master.getString("Water_and_Electricity")); %></td>
 			<td><% out.println(master.getString("Technician")); %></td>
 			<td><% out.println(master.getString("First_Name")); %></td>
 			<td><% out.println(master.getString("Last_Name")); %></td>
		</tr>
		
	<%
 			}
	
	
 		
	 	
 		
		
		con.close(); 
		}catch(SQLException e) { 
			out.println("SQLException caught: " +e.getMessage()); 
		} 
%>
</table>
  
	<div id="wrapper">
      <div>
        <br><br><br><br><br><br><br><br><p1><b> Plox 2022</b></p1>
      </div>
    </div>
  </body>
</html>
	