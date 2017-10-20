package modelo;
import java.sql.*;

public class pacientesBD 
{
    private ResultSet resultadoBusqueda, verMulti, resultadoVer, resultadoPaciente;
    private Connection variableConexion;
    private String servidorBD,userBD,passwordBD;
    private boolean conectado,registrado;
    
    public boolean enchufar()
    {
        try 
        {
           Class.forName("org.gjt.mm.mysql.Driver");
            try 
            {
                servidorBD="jdbc:mysql://localhost/hospital";
                userBD="root";
                passwordBD="";
                variableConexion=DriverManager.getConnection(servidorBD, userBD, passwordBD);
                conectado=true;
            } 
            catch (Exception e) 
            {
                variableConexion=null;
                conectado=false;
            }
        }
        catch (ClassNotFoundException e) 
        {
            variableConexion=null;
            conectado=false;
        }
        return conectado;
    }
    public void desenchufar()
    {
        try 
        {
          if(variableConexion!=null)
              variableConexion.close();
        } 
        catch (Exception e) 
        {
            
        }
    }
    public ResultSet verMulti(String tabla1, String tabla2)
    {
        try 
        {
            String sqlVer="SELECT * FROM "+tabla1+","+tabla2+" where idDomicilioPac=idDomicilio";
            Statement verTabla=variableConexion.createStatement();
            verMulti=verTabla.executeQuery(sqlVer);
            
        } 
        catch (Exception e) 
        {
            verMulti=null;
        }
        return verMulti;
    }
      public ResultSet ver(String tabla)
    {
        try 
        {
            String sqlVer="select *from " + tabla;
            Statement verTabla=variableConexion.createStatement();
            resultadoVer=verTabla.executeQuery(sqlVer);
            
        } 
        catch (Exception e) 
        {
            resultadoVer=null;
        }
        return resultadoVer;
    }
         public boolean registrarpPaciente(String nombre, String foto, 
                 String fecha, String sexo, String curp, String calle,
                 String num, String colonia, String telefono,
                 String municipio, String estado, String pais)
    {
        try 
        {
            String sql="insert into pacientes values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement dato = variableConexion.prepareStatement(sql);
            dato.setInt(1,0);
            dato.setString(2, nombre.toUpperCase());
            dato.setString(3, foto);
            dato.setString(4, fecha);
            dato.setString(5, sexo);
            dato.setString(6, curp.toUpperCase());
            dato.setString(7, calle.toUpperCase());
            dato.setString(8, num);
            dato.setString(9, colonia.toUpperCase());
            dato.setString(10, telefono);
            dato.setString(11, municipio.toUpperCase());
            dato.setString(12, estado.toUpperCase());
            dato.setString(13, pais.toUpperCase());

            dato.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
         public ResultSet buscarPacientes(String busqueda){
        try {
           
            Statement objStaVerPacientes=variableConexion.createStatement();
            resultadoPaciente=objStaVerPacientes.executeQuery(busqueda);
        } catch (Exception e) {
            resultadoPaciente=null;
        }
        return resultadoPaciente;
    }
}
