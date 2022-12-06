<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content = "IE=edge">
    <meta name="viewport content =" width="device-width," initial-scale="1.0" />
    <title>Plox</title>
    <link rel="stylesheet" href="style.css" />
    <script
      src="https://kit.fontawesome.com/cea7d28c84.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body>
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
             <form action="/lognin" method="POST">
                 
                 
                 <div class="login-btn">
                     <input type="submit" style="background-color: hsl(351, 4%, 66%)"
                         value=" LogIn "></button>
                     
                 </div>
             
             </form>
         </li>
         <li>
             <form action="/logout" method="POST">
             
                 <div class="logout-btn">
                     <input type="submit" style="background-color: hsl(351, 4%, 66%)"
                         value=" LogOut "></button>
                 </div>        
             </form>
         </li>
        </ul>
 <div class="dropdown">
          <button class="dropbtn"> <b>REPORT</b> 
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="#">MASTER REPORT</a>
            <a href="#">RENTING REPORT</a>
            <a href="#">LISTING REPORT</a>
          </div>
        </div>


      </div>
    </nav>

    <div class="container">
      <div class="main-content"></div>
    </div>

<p>
<%
	
	int hangarid;
	hangarid = Integer.parseInt(request.getParameter("id"));
	
	String address = request.getParameter("address");
	String city = request.getParameter("city");

	


 	try { 
		java.sql.Connection con; 
		Class.forName("com.mysql.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Plox?autoReconnect=true&useSSL=false", "root", "Root123@");
		Statement stmt = con.createStatement();
		request.setAttribute("NAME", session.getAttribute("sessname"));
		request.setAttribute("EMAIL", session.getAttribute("sessemail"));
		
	String defaultSearch = "SELECT * FROM Hangar;";
 		ResultSet res2 = null;
 		
 		request.setAttribute("Address", address);
		request.setAttribute("City", city);
		con.close(); 
		}catch(SQLException e) { 
			out.println("SQLException caught: " +e.getMessage()); 
		} 
%>
</p>

	<h1>Confirm Booking</h1>
	
	
	<a href="handleconfirmation.jsp?id=<%=hangarid %>" ><button>Confirm Parking</button></a>
	
	
	
</body>


</html>
