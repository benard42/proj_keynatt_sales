<%@ page language="Java" import="java.sql.*,java.io.*" session="true"%>
<%@ page language="Java" import="java.security.*"%>

<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style.css">
	
</head>

 <%
   String name = request.getParameter("username");
	 String passwordToHash = request.getParameter("password");
	 if(name==null && passwordToHash==null){
%>

<body>
	<div class="main-container">
		<div class="saes-header">
			
			
			<center>
				
				<p>Welcome to the sales page</p>
				<h3>Please Login To Access The system as a salesperson</h3>
			</center>
			
		</div>
		<form action="sales-page.jsp" method="post">
        <center>
       	<table name="" width="100%" style=" border-radius:10px; padding:2px; background:khaki">

				
				
				<tr>
					<td>User Name</td>
					<td><input type="text" name="username" /></td>
				</tr>
					<tr>
					<td>Password</td>
					<td><input type="password" name="password" /></td>
				</tr>
				
				
				</table></center>
			<input type ="submit" value="LOGIN"></form>
		
			</a>
			
					
			</div>
		
		</div>
	</div>
	

</body>
<%
  }else{
  %>
  
  <%!
  public byte[] getSalt(){  
		byte[] salt = new byte[8];     
       return salt; 
       }   
        
  
  public static String get_SHA_1_SecurePassword(String passwordToHash, byte[] salt)
	{ String generatedPassword = null;
			try {
			    MessageDigest md = MessageDigest.getInstance("SHA-1");
			    md.update(salt);
			    byte[] bytes = md.digest(passwordToHash.getBytes());
			    StringBuilder sb = new StringBuilder();
			    for(int i=0; i< bytes.length ;i++){ sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));  }           
			    generatedPassword = sb.toString();
			}catch (NoSuchAlgorithmException e) { e.printStackTrace();}
			return generatedPassword;
	}
  %>
  
  <%
    byte[] salt = getSalt();
        String pass1 = get_SHA_1_SecurePassword(passwordToHash, salt);
   Class.forName("com.mysql.jdbc.Driver"); 
			 
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdatabase","root","");
          
          String qry ="select * from person WHERE Username = '"+name+"' and Password='"+pass1+"' ";
        		Statement st = con.createStatement();
        		 ResultSet rs = st.executeQuery(qry); 
        	
        	
        	if(rs.next())
			{	
				String branch = rs.getString("RefreeName"); 
				String lname = rs.getString("LastName"); 
				String fname = rs.getString("FirstName"); 
				String fullname = fname+" "+lname; 
				 session.setAttribute("Branch",branch);
				 session.setAttribute("Name",fullname);
				 response.sendRedirect("sales-login.jsp");	
			}else{ 
			out.println("Access denied !!");
			}

	}		
%>
</html>