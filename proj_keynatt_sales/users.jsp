<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<html>
<head><title>users</title>

<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
	
				
				<center><h2 style="color:#FF00FF">KEYENET ADMIN PORTAL</h2></center>
			
			
		</div><center><table border="0">
		<div class="notfound">
		   <tr class="notfound"><td >
				<a href="Register_1.jsp"><li>HOME</li></a><br></td>
				<td><a href="create.jsp"><li>create Account</li></a><br?
				<td><a href="delete.jsp"><li>Delete Accounts</li></a><br></td>
				
				<td><a href="products.jsp"><li>Products</li></a><br></td>
				
				<td><a href="users.jsp"><li>Sales Persons</li></a></td>
				<td><a href="overallsales.jsp"><li>Sales</li></a></td><tr>
			      
		</div>
		</table></center>
<% 
			
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
	
			%>
			
			<!-- ===================================  -->   
					<% 
				  	Class.forName("com.mysql.jdbc.Driver");  
						String urll = "jdbc:mysql://localhost:3306/shopdatabase";
						String unam = "root"; String ps ="";  
					     con=DriverManager.getConnection(urll,unam,ps);
	 
					  String qry1 ="select * from salespersons WHERE 1";
					  Statement sts = con.createStatement();
					 ResultSet rs1 = sts.executeQuery(qry1);  
					%> 
					
					<h2> REGISTERED SALES PERSONS</h2>
							<table>	
							<tr style="background:powderblue"><td>
							<label>Branch:</label>
							</td><td><label>First Name:</label>
							</td><td><label>Last Name:</label>
							</td><td><label>User Name:</label>
							</td><td><label>Phone:</label>
							</td><td><label>Password</label></td>
							<td><label>Address</label></td></tr> 		
						<%   
						while(rs1.next()){	 
						%> 
						 <tr> 
							<td>  <span style="color:purple;">  <%= rs1.getString(7) %></span> </td>  
							<td>  <span style="color:purple;">  <%= rs1.getString(1) %></span> </td> 
							<td> <span style="color:purple;"> <%=rs1.getString(2) %>	</span>  </td> 
							<td>  <span style="color:purple;">  <%= rs1.getString(3) %></span> </td> 
							<td> <span style="color:purple;"> <%=rs1.getString(4) %>	</span>  </td>  
							<td> <span style="color:purple;"> <%=rs1.getString(5) %>	</span>  </td> 
							 <td> <span style="color:purple;"> <%=rs1.getString(6) %>	</span>  </td> 
			 				</tr>
						<%}%>

</body>
</html>