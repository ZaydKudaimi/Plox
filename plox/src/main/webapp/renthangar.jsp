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
            <a href="master.jsp">MASTER REPORT</a>
            <a href="renting.jsp">RENTING REPORT</a>
            <a href="renthangar.jsp">LISTING REPORT</a>
          </div>
        </div>


      </div>
    </nav>

    <div class="container">
      <div class="main-content"></div>
    </div>


	<br><br><h3 class ="center"> Search Hangars</h3><br><br>

	<div class="search">
	<form action="" method="post" id="hangarSearch" >
  	
  	<input type="text" id="search" name="search" placeholder="Search">

  	<input type="submit" value="Submit" id="submitBtn">
</form>
</div><br><br>

<table class="greenTable" border="1">
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
		<td>Rent this</td>
</tr>
	
<%	String search = request.getParameter("search");
	
	
	boolean searchFlag = false;
	
	if (search != null && search != ""){
		searchFlag = true;
	}
	
	
	
 	// Begin try block for Database Connection
 	try { 
 		
 		//Initialize db connection variables
 		java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 
 		ResultSet res1;
 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Plox?autoReconnect=true&useSSL=false", "root", "0906clcl");
 		Statement stmt = con.createStatement();
 		
 		
 		String defaultSearch = "SELECT * FROM Hangar;";
 		String searchAvailable = "SELECT * FROM plox.Hangar WHERE Rented_BY IS NULL";
 		
 		if (searchFlag){
 			res1 = stmt.executeQuery("SELECT * FROM Hangar WHERE City='" + search + "' OR Address='" + search + "' AND Rented_BY IS NULL ;");
 		}
 		else {
 			res1 = stmt.executeQuery(searchAvailable);
 		}
 		
 		
 		while(res1.next()) {
 			
 			int hangarid = res1.getInt("Hangar_ID");	
 			String address = res1.getString("Address");
 			String city = res1.getString("City");
 			
 			%>
 			<tr>
 			<td><% out.println(res1.getInt("Hangar_ID")); %></td>
 				<td><% out.println(res1.getString("Name")); %></td>
 			<td><% out.println(res1.getString("City")); %></td>
 			<td><% out.println(res1.getString("Address")); %></td>
 			<td><% out.println(res1.getString("Dimension")); %></td>
 			<td><% out.println(res1.getString("Enclosure_Type")); %></td>
 			<td><% out.println(res1.getInt("Price")); %></td>
 			<td><% out.println(res1.getInt("Available_Duration")); %></td>
 			<td><% out.println(res1.getString("Heating")); %></td>
 			<td><% out.println(res1.getString("Water_and_Electricity")); %></td>
 			<td><% out.println(res1.getString("Technician")); %></td>
 				<td> 
 					<a href="confirmation.jsp?id=<%=hangarid%>&Address=<%=address%>&City=<%=city%>"><button type="button" >Reserve</button></a>
 					
 				</td>
 			
 			<% 
 		}
 		%>
 		
</table>
	<input type="hidden" id="hiddenField"/>
	
	<div id="modal">
	
		<div id="modal-content">

		</div>
		
		
	
	</div>
	
	
<!-- 	<a href="dashboard.jsp"><button>Back</button></a> -->
	<br>
	
	
	<script>
		function doSomething(){
			document.getElementById("test").innerHTML = "Goodbye";
		}
		
		function handleClick(event){
			console.log(event.target.value);
			const thisRow = event.target.parentElement.parentElement;
			const thisNum = thisRow.childNodes[1].innerHTML;
			const thisStreet = thisRow.childNodes[3].innerHTML;
			const thisCity = thisRow.childNodes[5].innerHTML;
			console.log(thisRow);
			console.log(thisStreet);
			const modal = document.getElementById("modal");
			const modalContent = document.getElementById("modal-content");

			const span1 = document.createElement("span");
			span1.innerHTML = thisNum;
			
			const span2 = document.createElement("span");
			span2.innerHTML = thisAddress;
			
			const span3 = document.createElement("span");
			span3.innerHTML = thisCity;
			
			const span4 = document.createElement("span");
			span4.innerHTML = "SUCCESSFULLY BOOKED";
				
			modalContent.appendChild(span1);
			modalContent.appendChild(span2);
			modalContent.appendChild(span3);
			modalContent.appendChild(span4);
			modal.style.display = "block";
			
			
			
			
			
			
		}
		
		
		
		function closeModal() {
			document.getElementById("modal-content").innerHTML = "";
			document.getElementById("modal").style.display = "none";
		}
		
	</script>
	<%con.close(); 
 		}catch(SQLException e) { 
 			out.println("SQLException caught: " +e.getMessage()); 
 		}  %>
 		<div id="wrapper">
      <div>
        <br><br><br><br><br><br><br><br><p1><b> Plox 2022</b></p1>
      </div>
    </div>
</body>


</html>