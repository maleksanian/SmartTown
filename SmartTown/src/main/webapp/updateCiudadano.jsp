<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Ciudadano</title>
</head>
<body>
<%@ page import = "java.sql.*"  %>
<%

	String id = request.getParameter("id");
	String dni = request.getParameter("dni");
	String name = request.getParameter("name");
	String surname = request.getParameter("surname");
	String age = request.getParameter("age");
	String birthplace = request.getParameter("birthplace");
	String work = request.getParameter("work");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection myConnection = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/smarttown","root","");
	Statement myStatement = myConnection.createStatement();
	String query ="UPDATE ciudadanos SET dni='"+dni+"', nombre='"+name+"', apellidos='"+surname+"', edad='"+age+"', lugarNacimiento='"+birthplace+"', ocupacion='"+work+"' WHERE idCiudadano="+id+";";
	myStatement.executeUpdate(query);
	
	out.println("Ciudadano editado");
	response.sendRedirect("Home.jsp");
%>




</body>
</html>