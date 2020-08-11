<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" session="true"%>

<html>
<head><title>users</title>

<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
	
				
				<center><h2 style="color:#FF00FF">SALES PERSON VIEW</h2></center>
			
			
		</div><center><table border="0">
		<div class="notfound">
		   <tr class="notfound"><td >
				<a href="sales-login.jsp"><li>HOME</li></a><br><br></td>
				<td><a href="salespersonDailySales.jsp"><li>View Daily Sales</li></a><br><br>
				<td><a href="salespersonweeklysales.jsp"><li>View Weekly Sales</li></a><br><br></td>
				
				<td><a href="salespersonmonthlysales.jsp"><li>View Monthly Sales</li></a><br><br></td>
			
		</div>
		  
					<%
					 String name = (String)session.getAttribute("Name");
					String ss = (String)session.getAttribute("Branch");
					%>
                <table border="0" background="linen"> <tr><td><h1>Branch:<%=ss%></h1></td><td><h1>Current User:<%=name%></h1></td></tr></table>
			<% 
			
			
			try{
		     String url = "jdbc:mysql://localhost:3306/shopdatabase"; 
						String user = "root"; 
						String password = ""; 
						Class.forName("com.mysql.cj.jdbc.Driver");
            			Connection con = DriverManager.getConnection(url, user, password);
 						Statement st = con.createStatement();  
            			ResultSet rs = st.executeQuery("SELECT `Date`, `Branch`, `BagName`, `BagID`, sum(SaleQntty), sum(TotalAmount), `salesperson`, `Week`,`Day` FROM `Sales` WHERE Branch='"+ss+"' GROUP BY `week`");  
            			 %>
						 
						 <table border="0">
						 <tr> <th>Date</th> <th>Branch</th> <th>Bag Name</th> <th >Bag ID</th> <th >Sale Quantity</th> <th >Total Amount</th> <th >Sales Person</th>  <th >Week</th>  <th >Day</th> </tr>
            			<%
						
				     	while(rs.next()){ 
						     Date Date= rs.getDate(1);	
						     String Branch= rs.getString(2);			 				 
							 String BagName=rs.getString(3);
							 String BagID= rs.getString(4);			 				 
							 int SaleQntty=rs.getInt(5); 
							 int TotalAmount= rs.getInt(6);  
							 String SalesPerson= rs.getString(7);
							 int Week= rs.getInt(8);
							 String Day= rs.getString(9); 
							 %>
							 
						 <tr> <td><%=Date%></td> <td><%=Branch%></td> <td><%=BagName%></td> <td><%=BagID%></td> <td><%=SaleQntty%></td> <td><%=TotalAmount%></td> <td><%=SalesPerson%></td> <td><%=Week%></td> <td><%=Day%></td> </tr>            
						  	
							<% 	 
							}  	 
			}catch(Exception x) {x.printStackTrace();} 
%>
</table></center>
</body>
</html>