package dataBase;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBControl {
	
	
	private String serverName;
	private String userName;
	private String dbName;
	private String dbPass;
	
	public DBControl(String serverName, String dbName, String userName, String dbPass)
	
	{
		this.serverName="localhost";
		this.dbName="smarttown";
		this.userName="root";
		this.dbPass="";
		
		
		try {
			DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Ciudadano> R(String consulta)
	{
		
		Ciudadano ciudadano = null;
		ArrayList<Ciudadano> listCiudadanos = new ArrayList<Ciudadano>();
		Connection conexion = null;
		Statement s = null;
		try {
			conexion = (Connection) DriverManager.getConnection("jdbc:mysql://" +this.serverName+ "/" + this.dbName, this.userName, this.dbPass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			s = (Statement) conexion.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSet rs = null;
		try {
			rs = s.executeQuery(consulta);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(rs.next())
			{
				ciudadano= new Ciudadano();
				ciudadano.setIdCiudadano(rs.getInt("idCiudadano"));
				ciudadano.setDni(rs.getString("dni"));
				ciudadano.setNombre(rs.getString("nombre"));
				ciudadano.setApellidos(rs.getString("apellidos"));
				ciudadano.setEdad(rs.getInt("edad"));
				ciudadano.setLugarNacimiento(rs.getString("lugarNacimiento"));
				ciudadano.setOcupacion(rs.getString("ocupacion"));
				
				listCiudadanos.add(ciudadano);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			conexion.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return listCiudadanos;
	}
	
	
}
	
	
	
	
	
	
