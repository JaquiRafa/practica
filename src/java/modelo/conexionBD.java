package modelo;
import java.sql.*;

public class conexionBD 
{
     private ResultSet resultadoBusqueda, resultadoVer;
    private Connection variableConexion;
    private String servidorBD,userBD,passwordBD;
    private boolean conectado,registrado;
    private int tipoUsuario;
    
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
    
       public int buscaUsuario(String user, String password)
    {
        try 
        {
            String sqlBuscar = "Select *from usuarios where usuario='"+user+"' and contrasena='"+password+"'";
            Statement buscar = variableConexion.createStatement();
            ResultSet resultado = buscar.executeQuery(sqlBuscar);
            int totalUsuarios = 0;
            if(resultado != null)
            {
                while (resultado.next()) 
                {                    
                    totalUsuarios++;
                    tipoUsuario=resultado.getInt("tipo");
                }
                if(totalUsuarios !=1)
                {
                    tipoUsuario = -1;
                }
            }
        } 
        catch (Exception e)
        {
            tipoUsuario = -1;
        }
        return tipoUsuario;
    }
        public ResultSet buscar(String busqueda)
    {
        try 
        {
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoBusqueda = objStaVerEspecialidad.executeQuery(busqueda);
            
        } 
        catch (Exception e) 
        {
            resultadoBusqueda=null;
        }
        return resultadoBusqueda;
    }
    public boolean registrarSesion (String fecha, String hora, int id)
    {
        try 
        {
            String sqlSesion="insert into sesiones values (?,?,?,?)";
            PreparedStatement sesion=variableConexion.prepareStatement(sqlSesion);
            sesion.setInt(1,0);
            sesion.setString(2, fecha);
            sesion.setString(3, hora);
            sesion.setInt(4, id);

            sesion.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
    public boolean registrarUsuario(String usario, String password, int tipo)
    {
        try 
        {
            String sqlUsuario="insert into usuarios values (?,?,?,?)";
            PreparedStatement user=variableConexion.prepareStatement(sqlUsuario);
            user.setInt(1,0);
            user.setString(2, usario);
            user.setString(3, password);
            user.setInt(4, tipo);

            user.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
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
         public boolean ejecutarSentencia(String sql)
    {
        try 
        {
           Statement stEjecutar=variableConexion.createStatement();
           stEjecutar.executeUpdate(sql);
           registrado = true;
        }
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
    public ResultSet sesionFecha(String fecha)
    {
        try 
        {
            String sqlfecha="select *from sesiones where fechaSesion='"+ fecha +"'";
            Statement verTabla=variableConexion.createStatement();
            resultadoVer=verTabla.executeQuery(sqlfecha);
            
        } 
        catch (Exception e) 
        {
            resultadoVer=null;
        }
        return resultadoVer;
    }
     public ResultSet usuario(int idUser)
    {
        try 
        {
            String sqlfecha="select *from usuarios where idUsuario="+ idUser;
            Statement verTabla=variableConexion.createStatement();
            resultadoVer=verTabla.executeQuery(sqlfecha);
            
        } 
        catch (Exception e) 
        {
            resultadoVer=null;
        }
        return resultadoVer;
    }
}
