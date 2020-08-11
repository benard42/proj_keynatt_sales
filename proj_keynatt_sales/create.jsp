<%@page import="shop.bean"%> 
<%@ page language="Java" import="java.sql.*" %>


<html>
<head><title>users</title>

<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
	
				
				<center><h2 style="color:#FF00FF">KEYENET ADMIN PORTAL</h2></center>
			
			
		</div><center><table border="0">
		<div class="notfound">
		   <tr class="notfound"><td >
				<a href="Register_1.jsp"><li>HOME</li></a><br><br></td>
				<td><a href="create.jsp"><li>create Account</li></a><br><br>
				<td><a href="delete.jsp"><li>Delete Accounts</li></a><br><br></td>
				
				<td><a href="products.jsp"><li>Products</li></a><br><br></td>
				
				<td><a href="users.jsp"><li>Sales Persons</li></a></td>
				<td><a href="overallsales.jsp"><li>Sales</li></a></td><tr>
				
			
		</div>
		</table></center>

 
<div style="width:80%; ">  
				<center><h3>SALES PERSON REGISTRATION</h3></center>
				
				<form method="POST" action="create.jsp" >  
        	<table name="" width="100%" style=" border-radius:10px; padding:2px; background:khaki">
        		<tr style="background:linen">
					<td>First Name:</td><td><input type="text" name="firstname" /></td>  
				</tr>
				<tr>
					<td>Last Name:</td><td><input type="text" name="lastname" /></td>  
				</tr>
        		<tr style="background:linen">
					<td>User Name</td><td><input type="text" name="username" /></td>  
				</tr>
				<tr>
					<td>Reference Name:</td><td><input type="text" name="ref" /></td>  
				</tr>
				<tr style="background:linen">
					<td>Phone Number</td><td><input type="text" name="phone" /></td>  
				</tr>
				<tr>
					<td>Address</td><td><input type="text" name="address" /></td>  
				</tr>
				<tr style="background:linen">
					<td>Password:</td><td><input type="password" name="pass" /></td>   
				</tr>
				
				<tr style="background:limegreen">
					<td></td><td><input id="btnn" type="submit" value="REGISTER" />
					
	 <jsp:useBean id="obj" class="shop.bean" scope="page">
			
			
			<jsp:setProperty name="obj" property="*"/>
			
			
		</jsp:useBean>				
					
					
					
					
					
					</td>   
				</tr>
			</table>
        <!--<input id="btnn" type="button" value="check" /> -->
        </form>  
        <% obj.insert();%>
        
		</div>
		
	</div>

</body>
</html>
