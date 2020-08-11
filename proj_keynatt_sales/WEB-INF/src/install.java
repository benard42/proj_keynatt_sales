package shop;
import java.io.*;
import java.util.Date;
import java.util.Calendar;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.security.*;
import java.sql.*;

//javac -classpath "../lib/tomcat-servlet-api-9.0.4.jar" install.java -d "../classes"

public class install extends HttpServlet { 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    	//==================
		Date now = new Date(); //curdate
		SimpleDateFormat simpleDateformat = new SimpleDateFormat("EEEE"); // the day of the week abbreviated
		String day = simpleDateformat.format(now); 
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        int numday = calendar.get(Calendar.DAY_OF_WEEK); // the day of the week in numerical format
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = new Date();
		String datee = dateFormat.format(date1);  
		//==================
     
    	response.setContentType("text/html"); 
    	PrintWriter writer = response.getWriter(); 
    	try{  
    	Class.forName("com.mysql.jdbc.Driver");  
    	String urll="jdbc:mysql://localhost:3306"; String usnm = "root"; String psw = ""; 
    	Connection con = DriverManager.getConnection(urll,usnm,psw);  
    	String createdb = "create database shopdatabase";
    	String usedb = "use shopdatabase";
    	String bagstb = "create table bags (Branch varchar(40), BagName varchar(40), BagID varchar(40), Quantity int default 0, price int, ImgRef MEDIUMBLOB, ShortDescription LONGTEXT)";
    	String salestb = "create table Sales (Date varchar(20), Branch varchar(40), BagName varchar(40), BagID varchar(40), SaleQntty int, TotalAmount int, SalesPerson varchar(40), Week int, Day varchar(20) )";
		String salesprstb = "create table Salespersons(FirstName varchar(40), LastName varchar(40), Username varchar(40), Phone varchar(20), Password varchar(100), Address varchar(40), RefreeName varchar(40), DateJoined varchar(20) )";  
    	String insrt = "INSERT INTO  Sales  ( Date ,  Branch ,  BagName ,  BagID ,  SaleQntty ,  TotalAmount ,  SalesPerson ,  Week ,  Day ) VALUES ('"+(datee)+"', 'NAK', 'Holiwood16', 'NAK-14', '2', '70000', 'brown', '2', 'Monday');"; 
		
    	 	
    	Statement st = con.createStatement();  
    	st.executeUpdate(createdb); 
    	st.executeQuery(usedb); 
		st.executeUpdate(salesprstb);
    	st.executeUpdate(bagstb); 
    	st.executeUpdate(salestb);  
    	st.executeUpdate(insrt);
    	 
    	writer.println("Done .");
    	
    	}catch(Exception ex) {ex.printStackTrace();}
    }


}
