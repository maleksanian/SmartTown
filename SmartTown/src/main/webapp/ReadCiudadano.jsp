<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en"><head>
    <meta charset="utf-8">
    <link rel="apple-touch-icon" sizes="76x76" href="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Smart Town</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link href="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/css/light-bootstrap-dashboard.css?v=2.0.1" rel="stylesheet">
    <link href="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/css/demo.css" rel="stylesheet">
    <link href="details1.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="" class="simple-text">
                        Smart Town
                    </a>
                </div>
                <ul class="nav">
                    <li>
                        <a class="nav-link" href="Login.html">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>Inicio</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="CreateCiudadano.html">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Crear usuario</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="ReadCiudadano.jsp">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Listar ciudadanos</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class=" container-fluid  ">
                    <a class="navbar-brand" href="#pablo"></a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="Login.html">
                                    <span class="no-icon">Cerrar sesión</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-plain table-plain-bg">
                                <div class="card-header ">
                                    <h4 class="card-title">Usuarios registrados</h4>
                                </div>
                                <div class="card-body table-full-width table-responsive">
                                    <%@ page import = "java.sql.*"  %>
                                    <div  class="updateRow"><form action="" method="post" name="UD">
                                    <label class="form-label" for="id" style="bold">Introduzca el ID a Editar</label>
      								<input type="text" id="id" name="id">
      								<p></p>
      								<label class="form-label" for="dni" style="font-size:70%;">DNI</label>
      								<input type="text" id="dni" name="dni">
      								<label class="form-label" for="name" style="font-size:70%;">Nombre</label>
      								<input type="text" id="name" name="name">
      								<label class="form-label" for="surname" style="font-size:70%;">Apellido</label>
      								<input type="text" id="surname" name="surname">
      								<label class="form-label" for="age" style="font-size:70%;">Edad</label>
      								<input type="text" id="age" name="age">
      								<label class="form-label" for="birthplace" style="font-size:70%;">Lugar de Nacimiento</label>
      								<input type="text" id="birthplace" name="birthplace">
      								
                                            
                                              <label class="form-label" for="work" style="font-size:70%;">Ocupación</label>
                                                <select name="work" id="work">
                                                    <option>Trabajador</option>
                                                    <option>Estudiante</option>
                                                    <option>Paro</option>
                                                    <option>Pensionista</option>
                                                    </select>
                                     <p></p>       
     								<button class="w3-btn" style="background-color:#cc99ff" onclick="callEdit()">Editar fila</button>
     								<button class="w3-btn" style="background-color:#cc99ff" onclick="callDelete()">Borrar fila</button>
    								</form></div>
    								<script>
												function callEdit()
															{
 																document.UD.action ="updateCiudadano.jsp";
															}
												function callDelete()
															{
																document.UD.action = "deleteCiudadano.jsp";
															}
									</script>
                                    
                                    <table class="table table-hover">
                                        <thead>
                                            <th>ID</th>
                                            <th>DNI</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Edad</th>
                                            <th>Lugar de nacimiento</th>
                                            <th>Ocupación</th>
                                        </thead>
                                        <tbody>
                                            <%
                                        try{
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection myConnection = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/smarttown","root","");
                                            Statement myStatement = myConnection.createStatement();
                                            String query ="SELECT * FROM ciudadanos";
                                            ResultSet rs = myStatement.executeQuery(query);
                                            while(rs.next())
                                            {
                                        %>
                                        <tr>

                                        <td><%=rs.getString("idCiudadano") %></td>
                                        <td><%=rs.getString("dni") %></td>
                                        <td><%=rs.getString("nombre") %></td>
                                        <td><%=rs.getString("apellidos") %></td>
                                        <td><%=rs.getString("edad") %></td>
                                        <td><%=rs.getString("lugarNacimiento") %></td>
                                        <td><%=rs.getString("ocupacion") %></td>

                                        </tr>
                                        <% 

                                            }
                                        }catch(Exception e){
                                            e.printStackTrace();
                                            }
                                            



                                        %>

                                        </tbody>
                                    </table>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container">
                    <nav>
                        <ul class="footer-menu">
                        </ul>
                        <p class="copyright text-center">
                            ©
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            <a href="">Smart Town</a>
                        </p>
                    </nav>
                </div>
            </footer>
        </div>
    </div>
</body>

<script src=".https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Chartist Plugin  -->
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/plugins/chartist.min.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/light-bootstrap-dashboard.js?v=2.0.1" type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/demo.js"></script>


</body></html>
  
</body>
</html>