<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String user=request.getParameter("username");
String pass=request.getParameter("password");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smarttown","root", "");
	
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios WHERE username='" + user + "' AND password='" + pass + "'");
    if (rs.next()) 
    {
      response.sendRedirect("Home.jsp");
    } else {
      out.println("Login incorrecto");
    }
    conn.close();
  } catch(Exception e) {
    out.println(e);
  }
%>


</body>
</html>