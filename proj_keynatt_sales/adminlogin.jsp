 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String uname=request.getParameter("uname");
session.putValue("uname",uname);
String password=request.getParameter("pass");
String username = "keyenet";
String pass ="1234";

   if(uname.equals(username)&&pass.equals(password)){
	  response.sendRedirect("Register_1.jsp");  
   }else{
	      out.println("INVALID PASSWORD OR USER NAME");
   }

%> 
