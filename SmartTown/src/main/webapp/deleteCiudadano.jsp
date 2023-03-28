<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Ciudadano</title>
</head>
<body>
<%@ page import = "java.sql.*"  %>
<%

	String id = request.getParameter("id");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection myConnection = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/smarttown","root","");
	Statement myStatement = myConnection.createStatement();
	String query ="DELETE FROM ciudadanos WHERE idCiudadano="+id+";";
	myStatement.executeUpdate(query);
	
	out.println("Ciudadano borrado");
	response.sendRedirect("Home.jsp");


%>
</body>
</html>