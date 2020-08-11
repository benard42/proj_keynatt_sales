<%@page import="java.sql.*,java.util.*"%>
<%
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String username=request.getParameter("username");
String password=request.getParameter("password");
String address=request.getParameter("address");
String Phone=request.getParameter("Phone");
String reference=request.getParameter("reference");
String Branch=request.getParameter("Branch");

        try{
         Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdatabase", "root", " ");
           Statement st=con.createStatement();
           int i=st.executeUpdate("insert into salespersons(FirstName,LastName,Username,Phone,Password,Address,RefreeName,DateJoined) values('"+first_name+"','"+last_name+"','"+username+"','"+Phone+"','"+password+"','"+address+"',"+reference+",'"+Branch+")");
        out.println("Data is successfully inserted!");
        }
        catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
        %>