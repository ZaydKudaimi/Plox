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
            <!--  <form action="/lognin" method="POST">
                 
                 
                 <div class="login-btn">
                     <input type="submit" style="background-color: hsl(351, 4%, 66%)"
                         value=" LogIn "></button>
                     
                 </div>
             
             </form> -->
         </li>
         <li>
             <form action="home.jsp" method="POST">
             
                 <div class="logout-btn">
                     <input type="submit" style="background-color: hsl(351, 4%, 66%)"
                         value=" LogOut ">
                 </div>        
             </form> 
         </li>
        </ul>
 <div class="dropdown">
          <button class="dropbtn"> <b>REPORT</b> 
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="master.jsp">MASTER REPORT</a>
            <a href="renting.jsp">RENTING REPORT</a>
            <a href="renthangar.jsp">LISTING REPORT</a>
          </div>
        </div>


      </div>
    </nav>

    <div class="container">
      <div class="main-content">
      <br><br>
      <img src="Hangar.png" class="dash-img" /> </div>
      <h5 class="center"> Image source: NASA<h5>
     
      
      <div class="aboutus">
      <br><br><br><p2>Plox is a software built to provide services to hangar-supplied companies.<p2><br>
      <p2> Nowadays, the idea of having an airplane is becoming more and more common as this is the fastest means of transportation.<p2><br> 
      <p2>In the future, having an airplane will not only be a dream as the technology makers are innovating non-stop to bring down the cost of having an airplane.<p2><br> 
      <p2> Storing an airplane is one of the costs, Plox is built to solve this problem.<p2><br>
      <p2> Plox connects hangars owners and airplanes through a web application platform.<p2>
     </div>
    </div>
	
    <script src="script.js"></script>


<p style="font-weight: bold; color: red;">
<% 
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	boolean loggedIn = false;
	out.println("");
	
	try { 
		java.sql.Connection con; 
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Plox?autoReconnect=true&useSSL=false", "root", "0906clcl");
	
		Statement stmt = con.createStatement();
	
		ResultSet res1 = stmt.executeQuery("SELECT * FROM plox.account WHERE email = '" + email + "' AND password ='" + password + "'");
		
		int thisId = -1;
		
		while(res1.next()){
			thisId = res1.getInt(1);
		}
	
		if (email != null){
			if (thisId <= 0 ){
				out.println("Login not found, enter login credentials again!");
				
			} else{
				out.println("Successfully Logged in to: " + email);
				loggedIn = true;
			}
		}
		
	
		con.close(); 
	}catch(SQLException e) { 
		out.println("SQLException caught: " +e.getMessage()); 
	} 
%>
</p>



<script>
//Accepts an html element
    function handleClick(node) {
      var value = node.getAttribute('class') || '';
      value = value === '' ? 'clicked' : '';
      node.setAttribute('class', value);
    }
    
    function handleSubmit() {
    	console.log("Submitted: " + email);
    }
    
    const formCheck = function(event) {
    	
    	const validation = (<%= loggedIn %>)
    	console.log(validation);
    	return true;
    	
    }
</script>



 <div id="wrapper">
      <div>
        <br><br><br><p1><b><br><br> Plox 2022</b></p1>
      </div>
    </div>
  </body>
</html>