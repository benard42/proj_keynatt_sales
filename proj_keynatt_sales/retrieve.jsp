<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" session="true"%>


<!DOCTYPE html>
<html>
<head>
	<title></title>
		
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<center><h2 style="color:green">SALES PERSON VIEW</h2>
	<table border="0">		
        <tr class="notfound">
		<td><a href="enter-sales.jsp"><h6>Input Iems</h6></a></td>
			<td><a href="calculateSales.jsp"><h6>Enter Daily Sales</h6>	</a>
			<td><a href="retrieve.jsp"><h6>Retrieve Items</h6></a></td>
			<td><a href="salespersonDailySales.jsp"><h6>Check Own Sales</h6>
			</td></tr></table></center>
						<%
					String ss = (String)session.getAttribute("Branch");
					%>
                 <center><h1 style="color:pink">Branch:<%=ss%></h1></center>
			
			
			
			<% 
			Blob image = null;
			Connection con = null;
			byte[] imgData = null ;
			Statement stmt = null;
			ResultSet rs = null;
			
			%>
			
		 
					<% 
				  	Class.forName("com.mysql.jdbc.Driver");  
						String urll = "jdbc:mysql://localhost:3306/shopdatabase"; String unam = "root"; String ps ="";  
					   con=DriverManager.getConnection(urll,unam,ps);
					
					  String qry1 ="select * from bags WHERE Branch='"+ss+"'";
					  Statement sts = con.createStatement();
					 ResultSet rs1 = sts.executeQuery(qry1);  
					%>
							<center><table border ="0" bachground:pink>	
							<tr style="background:#A0522D"><td>
							<label>Branch:</label>
							</td><td><label>Bag Name:</label>
							</td><td><label>Bag ID:</label>
							</td><td><label>Quantity:</label>
							</td><td><label>price:</label>
							</td><td><label>Description</label></td>
							<!--<td><label>Image:</label></td></tr> -->		
						<%   
						while(rs1.next()){	 
						%> 
						 <tr  style="background:#8DBC8F;"> 
							<td>  <span >  <%= rs1.getString(1) %></span> </td>  
							<td>  <span >  <%= rs1.getString(2) %></span> </td> 
							<td> <span > <%=rs1.getString(3) %>	</span>  </td> 
							<td>  <span>  <%= rs1.getString(4) %></span> </td> 
							<td> <span > <%=rs1.getString(5) %>	</span>  </td>  
							<td> <span> <%=rs1.getString(7) %>	</span>  </td> 
							 
			 				</tr>
						<%}%></table></center>
</table></center>
</body>
</html>