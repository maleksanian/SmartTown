<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear Ciudadano</title>
</head>
<body>
<%@ page import = "java.sql.*"  %>
<%

	
	String dni = request.getParameter("dni");
	String name = request.getParameter("name");
	String surname = request.getParameter("surname");
	String age = request.getParameter("age");
	String birthplace = request.getParameter("birthplace");
	String work = request.getParameter("work");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection myConnection = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/smarttown","root","");
	Statement myStatement = myConnection.createStatement();
	String query ="INSERT INTO ciudadanos (dni, nombre, apellidos, edad, lugarNacimiento, ocupacion) VALUES ('" + dni + "','" + name + "','" + surname + "','" + age + "','" + birthplace + "','" + work + "')";
	myStatement.executeUpdate(query);
	
	out.println("Ciudadano añadido!");



%>
</body>
</html>