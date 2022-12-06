<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>Plox Signup Screen</h1>

<form action="" method="post" id="signup" onsubmit="submitHandler()">
  <label for="fname">First Name:</label>
  <input type="text" id="fname" name="fname"><br><br>
 
  <label for="lname">Last name:</label>
  <input type="text" id="lname" name="lname"><br><br>
  
  <label for="email">Email: </label>
  <input type="text" id="email" name="email"><br><br>
  
  <label for="password">Password: </label>
  <input type="password" id="password" name="password"><br><br>
  
  <label for="address">Address: </label>
  <input type="text" id="email" name="email"><br><br>
  
   <label for="city">City: </label>
  <input type="text" id="email" name="email"><br><br>
  <input type="submit" value="Submit" id="submitBtn">
</form>
<br>
<br>
<a href="home.jsp"><button>Back</button></a>


<p id="feedback">

	
	<%
		String firstname = request.getParameter("fname");
		String lastname = request.getParameter("lname"); 
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		out.println("");
		 try { 
			java.sql.Connection con; 
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plox?autoReconnect=true&useSSL=false", "root", "Root123@");
		
			Statement stmt = con.createStatement();
		
			ResultSet res1 = stmt.executeQuery("SELECT accountId FROM plox.account WHERE email = '" + email + "';");
		
		
			if (email != null && email != ""){
				if (res1.next() == true){
					out.println("that email already exists");
				} else{
					String newVals = "0, '" + email + "', MD5('" + password + "')";
 					con.createStatement().executeUpdate("INSERT INTO plox.account VALUES(" + newVals + ");");
 					String getAcctId = "(SELECT accountId FROM account WHERE email='" + email + "')";
 					con.createStatement().executeUpdate("INSERT INTO plox.User  VALUES(" + getAcctId +", '" + firstname + "', '"+ lastname +"', '"+ address +"', '"+ city +"');");
					out.println("successfully created new account");	
				}
			}
			
			
		
			con.close(); 
		}catch(SQLException e) { 
			out.println("SQLException caught: " +e.getMessage()); 
		}  
		 
	%>
</p>

<script>

	const submitHandler = () => {
		
		document.getElementById("feedback").style.display = "block";
		
		setTimeout(() => {}, 10000);
		
	}
	
</script>
<div id="wrapper">
      <div>
        <p1><b> Plox 2022</b></p1>
      </div>
    </div>
  </body>
</html>
