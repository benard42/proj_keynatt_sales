<%@page import ="java.io.*,javax.servlet.*" %>
<%@page import= "javax.servlet.http.*,java.sql.*,java.security.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="sales-main-container">
		<div class="header">
			<div class="image">
				<img src="img.jpg" alt="sales Icon">
			</div>
			
		
		</div>
		
		<div class="sales-login-content">
			
			<section class="login-section">
				<h3>Enter Bag Items Into The System</h3>
				<form method="post" action="#">
                         <center>
					<label>Branch:<input type="text" name="Branch" placeholder="Branch"></label><br>
					<label>BagName:<input type="text" name="BagName" placeholder="BagName"></label><br>
					<label>BagID:<input type="text" name="BagID" placeholder="BagID"></label><br>
					<label>Quantity:<input type="number" name="Quantity" placeholder="Quantity"></label>
					<label>price:<input type="number" name="price" placeholder="price"></label><br>
					<label>ImgRef:<input type="file" name="ImgRef"><br>
					<label>ShortDescription:<input type="ShortDescription" name="ShortDescription" placeholder="ShortDescription"></label><br>
					
								
					<input type="submit" name="submit" value="Enter"></center>
                 <a href="sales-login.jsp"><li>back</li></a><br>
				 
				 
				</form>
			</section>
		
		</div>
	</div>
	 	 			<%

        String  branch = request.getParameter("Branch");
        String  bagname = request.getParameter("BagName");
        String bagid = request.getParameter("BagID");
        String  quantity = request.getParameter("Quantity"); 
        String price = request.getParameter("price");
        String image = request.getParameter("ImgRef"); 
        String desc = request.getParameter("ShortDescription"); 
         
		if(bagname!=null){
         
        try{ 
     
        Class.forName("com.mysql.jdbc.Driver"); 
	
			String urll = "jdbc:mysql://localhost:3306/shopdatabase"; String unam = "root"; String ps ="";  
			
          Connection  con=DriverManager.getConnection(urll,unam,ps);
				String qry ="insert into bags values('"+branch+"',','"+bagname+"','"+bagid+"', '"+quantity+"','"+price+"''"+image+"','"+desc+"') ";
        		Statement st = con.createStatement();  
		    	int y = st.executeUpdate(qry);
		    	out.println("<p>INSERTED SUCCESSFULLY.</p>"); 
		    	
		      if(y>0){    
				  out.println("<h3> sucessfully registered.</h3>"); 
				  
		      }else{   
				  out.println("<p>Failed to execute update !!.</p>"); 
				  
		      } 
		      
        }catch(Exception se){ se.printStackTrace(); }
         
    
    
  }
        %>
		

</body>
</html>