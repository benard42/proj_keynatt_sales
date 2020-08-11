<%@page import ="java.io.*,javax.servlet.*" %>
<%@page import= "javax.servlet.http.*,java.sql.*,java.security.*" %>
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
		<div class="content">
			<section>
				<h3>Enter The Details Of The Account To Be Deleted</h3>
				<form method="post" action="delete.jsp" name="" width="60%" style=" border-radius:10px; padding:15px; background:khaki">
                      <tr><td>
					<label>First Name:</td><td><input type="text" name="fname" placeholder="first name"></label><br><br></td>
					
					<td><label>user name:</td><td><input type="text" name="uname" placeholder="user name"></label><br></td><tr>
					<tr colspan="2"><td><input type="submit" name="delete" value="Delete"></td>	</tr>	

				</form>
					<%
String first_name=request.getParameter("fname");

String username=request.getParameter("uname");
 if (username!=null){
 
        try{
         Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdatabase", "root", "");
           Statement st=con.createStatement();
           int y = st.executeUpdate("DELETE FROM `salespersons` WHERE  FirstName='"+first_name+"' && Username='"+username+"' ");
		   if(y>0){
        out.println("Data is successfully DELETED!");
		   }else{
			  out.println("Data NOT DELETED successfully ");  
		   }
        }
        catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
 }
        %>
				
				
				<h5>Go To <a href="users.jsp">Users</a></h5>
			</section>
		
		</div>
	</div>

</body>
</html>