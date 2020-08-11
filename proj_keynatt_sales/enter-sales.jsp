<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>



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
			<td><a href="#"><h6>Retrieve Items</h6></a></td>
			<td><a href="#"><h6>Check Own Sales</h6>
			</td></tr></table></center><br><br><br>

<div style="width:70%; ">  
				<center><h3>Register New Bags Stock</h3></center>
				 <form method="post" action="uploadServlet" enctype="multipart/form-data">
        	<center><table name="" width="90%" style=" border-radius:10px; padding:2px; background:khaki">
        		<tr style="background:linen">
					<td>Branch</td><td><input type="text" name="branch" /></td>  
				</tr>
				<tr>
					<td>Bag Name:</td><td><input type="text" name="bagname" /></td>  
				</tr>
        		<tr style="background:linen">
					<td>BagID</td><td><input type="text" name="bagid" /></td>  
				</tr>
				<tr>
					<td>Quantity:</td><td><input type="text" name="qty" /></td>  
				</tr>
				<tr style="background:linen">
					<td>Price</td><td><input type="text" name="prc" /></td>  
				</tr>
				<tr>
					<td>Image</td><td><input type="file" name="photo" /></td>  
				</tr>
				<tr style="background:linen">
					<td>Description:</td><td><input type="text" size="20" width="300%" name="desc" /></td>   
				</tr>
				
				<tr style="background:linen">
					<td></td><td>
					
					<input id="btnn" type="submit" value="SAVE" />
					
					
					<!--jsp set property-->
					
					
					</td>   
				</tr>
			</table> </center>
        </form> 
    
        
		</div>
	
	</div>

</body>
</html>
