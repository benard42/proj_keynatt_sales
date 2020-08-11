<%@ page session="true"%>
<%@ page language="Java" import="java.sql.*" %>
<%@ page language="Java" import="java.util.Date" %>
<%@ page language="Java" import="java.text.SimpleDateFormat" %>
 <%@ page language="Java" import="java.util.Calendar"%>
 <%@ page language="Java" import="java.text.DateFormat"%>
 
 
 
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
		
		<div class="sales-login-content">
		<div>
				<center><h3>SELL BAG</h3></center>
				<form method="post" action="calculateSales.jsp">
				<table name="" width="90%" style=" border-radius:10px; padding:2px; background:khaki">
					
					<tr> <td>Bag Name:</td> <td><input type="text" name="bagname" placeholder="bag name"></td> </tr> 
					<tr> <td>Seller :</td> <td><input type="text" name="person" placeholder="Sales Person"></td> </tr>
					<tr> <td>Branch:</td> 
					<td>
						<select name="branch" style="width:30%">
							<option>nakawa</option>
							<option>kawempe</option>
							<option>mengo</option>
						</select>
					</td> </tr>
					<tr> <td>Quantity:</td> <td><input type="number" name="quantity" placeholder="quantity"></td> </tr>
					<tr> <td></td> <td><input type="submit" name="submit" value="SAVE"></td> </tr> 
				</table>
				</form>
			</div>
	</div>
	<div class="footer"></div>
	
					<%
					String ss = (String)session.getAttribute("Branch");
					%> 
					
<%
     String branch = request.getParameter("branch");
	 String bagname = request.getParameter("bagname");
	 String person = request.getParameter("person");
	 String quantity = request.getParameter("quantity");
	 if(branch != null){
	 int qty = Integer.parseInt(quantity);
	   //==================DATE PICKERS
		Date nw = new Date(); //curdate
		SimpleDateFormat simpleDateformat = new SimpleDateFormat("EEEE"); // the day of the week abbreviated
		String day = simpleDateformat.format(nw); 
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(nw);
        int numday = calendar.get(Calendar.DAY_OF_WEEK); // the day of the week in numerical format
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = new Date();
		String datee = dateFormat.format(date1);  
		//==================
    Class.forName("com.mysql.jdbc.Driver");  
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdatabase","root","");
		  
		   String qry ="select * from bags WHERE Branch = '"+branch+"' &&  BagName = '"+bagname+"' ";
		   
        		Statement st = con.createStatement(); 
        		 ResultSet rs = st.executeQuery(qry);  
				
				String bagID = "";
				String month = "4";
				int price = 10;
        	if(rs.next()){
                bagID = rs.getString(3);
				price = rs.getInt(5);  
			}
			String qry2 ="select * from sales WHERE Branch = '"+branch+"' && Date = '"+datee+"' ";
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery(qry2); 
			
			int week=9;
			String dbdate = "";
			if(rs2.next()){
                dbdate = rs2.getString(1);
				week = rs2.getInt(8);  
			}
			int totalamnt = (qty * price); 
				if(numday==2){
					if(dbdate!=null){week++;}else{    }
				}
			
		  String sql = "insert into sales(Date,Branch,BagName,BagID,SaleQntty,TotalAmount,SalesPerson,week,day,Month) values('"+datee+"','"+branch+"','"+bagname+"','"+bagID+"',"+qty+",'"+totalamnt+"','"+person+"','"+week+"','"+day+"','"+month+"')";
			Statement s = con.createStatement(); 
			s.executeUpdate(sql); 
			
			String qnt = "select Quantity from bags where Branch = '"+branch+"' && BagName ='"+bagname+"'";
			Statement stt = con.createStatement();
			ResultSet rs3 = stt.executeQuery(qnt);  
			int dbquantity=0;
			if(rs3.next()){  dbquantity = rs3.getInt(1);  }  
			
			String sqlx = "update Bags set Quantity = "+(dbquantity-qty)+" where Branch = '"+branch+"' && BagName ='"+bagname+"' "; 
			Statement stx = con.createStatement(); 
			stx.executeUpdate(sqlx); 
			s.close ();
			}
%>
</body>
</html>
