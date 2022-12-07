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
             <!-- <form action="/lognin" method="POST">
                 
                 
                 <div class="login-btn">
                     <input type="submit" style="background-color: hsl(351, 4%, 66%)"
                         value=" LogIn "></button>
                     
                 </div>
             
             </form> -->
         </li>
         <li>
         
             
             
             
            <!--  <a href="dashboard.jsp"><button>Back</button></a> -->
             
             
             
             
             
             
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
      <div class="main-content">
      
      <!-- <form name="loginForm" id="loginId" method="post" action="session.jsp"  >
  <fieldset>
    <label>LOGIN</label><br>
    
    <label for="email">EMAIL  : </label>
    <input id="email" type="text" name="email" />
    <br>
    <label for="password">PASSWORD :</label>
    <input id="password" type="password" name="password" />
    <br>
    <input type="submit" value="Login" ></input><br>
  </fieldset>
 </form> -->
 
 
 <div class="login-page">
  <div class="form">
    
    <form name="loginform" id="loginId" method="post" action="session.jsp">
      <input id="email" type="text" name="email" placeholder="username"/>
      <input id="password" type="password" name="pssword" placeholder="password"/>
      <input type="submit" value="Login"></input>
      
    </form>
  </div>
</div>
 
 
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
        <br><br><br><br><br><br><br><p1><b> Plox 2022</b></p1><br><br>
      </div>
    </div>
  </body>
</html>