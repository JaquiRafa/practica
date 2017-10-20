package modelo;

import java.sql.*;

public class ExpBD
{
    private ResultSet resultadoEspecialidad,resultadoExpediente,resultadoTratamiento,resultadoSintoma;
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
public int buscaUsuario(String user,String password)
{
    try 
    {
        String sqlBuscar="select *from where user='"+user+"' and "+ "password='"+password+"'";
        Statement buscar=variableConexion.createStatement();
        ResultSet resultado=buscar.executeQuery(sqlBuscar);
        int totalUsuarios=0;
        if(resultado!=null)
        {
            while (resultado.next()) 
            {                
                totalUsuarios++;
                tipoUsuario=resultado.getInt("tipo");
            }
            if(totalUsuarios!=1)
            {
                tipoUsuario=-1;
            }
        }
    } 
    catch (Exception e) 
    {
        tipoUsuario=-1;
    }
    return tipoUsuario;
}

    public boolean registrarEspecialidad(int claveEspecialidad,String nombreEspecialidad)
    {
        try 
        {
            String sqlInsertarEspecialidad="insert into especialidad values (?,?,?)";
            PreparedStatement objPrepaStaEspecialidad=variableConexion.prepareStatement(sqlInsertarEspecialidad);
            objPrepaStaEspecialidad.setInt(1,0);
            objPrepaStaEspecialidad.setInt(2, claveEspecialidad);
            objPrepaStaEspecialidad.setString(3, nombreEspecialidad.toUpperCase());
            
            objPrepaStaEspecialidad.executeUpdate();
            registrado=true;
        } 
        catch (Exception e) 
        {
            registrado=false;
        }
      return registrado;  
    }
    
    public boolean registrarExpediente(String fecha,double peso, double talla, String sangre, double temperatura, int folio, int idCita)
    {
        try 
        {
            String sqlInsertarExpediente="insert into expediente values(?,?,?,?,?,?,?,?)";
            PreparedStatement objPrepaStaExpediente=variableConexion.prepareStatement(sqlInsertarExpediente);
            objPrepaStaExpediente.setInt(1,0);
            objPrepaStaExpediente.setString(2, fecha);
            objPrepaStaExpediente.setDouble(3, peso);
            objPrepaStaExpediente.setDouble(4, talla);
            objPrepaStaExpediente.setString(5, sangre);
            objPrepaStaExpediente.setDouble(6,temperatura);
            objPrepaStaExpediente.setInt(7, folio);
            objPrepaStaExpediente.setInt(8, idCita);
            

            
            objPrepaStaExpediente.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado=false;
            System.out.println("error: "+e.getMessage());
        }
        return registrado;
    }
     public ResultSet buscarExpediente(String busqueda)
    {
        try 
        {
            Statement objStaVerExpediente=variableConexion.createStatement();
            resultadoExpediente=objStaVerExpediente.executeQuery(busqueda);
            
        } 
        catch (Exception e) 
        {
            resultadoExpediente=null;
        }
        return resultadoExpediente;
    }
    
    public ResultSet ver(String tabla)
    {
        try {
            String selectConsulta="Select *from " + tabla;
            Statement objStaVerTratamiento=variableConexion.createStatement();
            resultadoTratamiento=objStaVerTratamiento.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoTratamiento=null;
        }
        return resultadoTratamiento;
    }    
     public ResultSet verExpediente()
    {
        try 
        {
            String selectConsulta="select *from expediente";
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerEspecialidad.executeQuery(selectConsulta);
            
        } 
        catch (Exception e) 
        {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
     public boolean registrarSintomas(String nombre, String descripcion, int idExpediente)
    {
        try 
        {
            String sqlInsertarSintoma="insert into sintomaspac values(?,?,?,?)";
            PreparedStatement objPrepaStaSintoma=variableConexion.prepareStatement(sqlInsertarSintoma);
            
            objPrepaStaSintoma.setInt(1, 0);
            objPrepaStaSintoma.setString(2, nombre.toUpperCase());
            objPrepaStaSintoma.setString(3, descripcion.toUpperCase());
            objPrepaStaSintoma.setInt(4, idExpediente);
            
           objPrepaStaSintoma.executeUpdate();
            registrado=true;
        } 
        catch (Exception e) 
        {
            registrado=false;
        }
      return registrado;  
    }
    public ResultSet verSintomas()
    {
        try 
        {
            String selectConsulta="select *from sintomaspac";
            Statement objStaVerSintomas=variableConexion.createStatement();
            resultadoSintoma=objStaVerSintomas.executeQuery(selectConsulta);
            
        } 
        catch (Exception e) 
        {
            resultadoSintoma=null;
        }
        return resultadoSintoma;
    }
    
    public ResultSet buscarSintomas(String busqueda)
    {
        try 
        {
            Statement objStaVerSintomas=variableConexion.createStatement();
            resultadoSintoma=objStaVerSintomas.executeQuery(busqueda);
            
        } 
        catch (Exception e) 
        {
            resultadoSintoma=null;
        }
        return resultadoSintoma;
    }
     public boolean registrarTratamientos( String medicamento, String dosis, String duracion, int idExpediente) {
        try {
            //declaramos una variable que almacena+
            
            //la sentecia del incert de tipo string
            String sqlInsertarTratamiento = "insert into tratamientos values (?,?,?,?,?)";
            PreparedStatement objPrepaStaTratamientos = variableConexion.prepareStatement(sqlInsertarTratamiento);
            objPrepaStaTratamientos.setInt(1, 0);//e guarda idTratamiento
            objPrepaStaTratamientos.setString(2, medicamento.toUpperCase());
            objPrepaStaTratamientos.setString(3, dosis.toUpperCase());
            objPrepaStaTratamientos.setString(4, duracion.toUpperCase());
            objPrepaStaTratamientos.setInt(5, idExpediente);
            
            //esta instruccion es la que se ejecuta en la base de datos
            objPrepaStaTratamientos.executeUpdate();
            registrado = true;
        } catch (Exception e) {
            registrado = false;
        }
        return registrado;

    }

    public ResultSet verTratamiento() {
        try {
            String selectConsulta = "Select *from tratamientos";
            Statement objStaVerTratamiento = variableConexion.createStatement();
            resultadoTratamiento = objStaVerTratamiento.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoTratamiento = null;
        }
        return resultadoTratamiento;
    }
    public ResultSet buscarTratamiento(String busqueda) {
        try {

            Statement objStaVerTratamiento = variableConexion.createStatement();
            resultadoTratamiento = objStaVerTratamiento.executeQuery(busqueda);
        } catch (Exception e) {
            resultadoTratamiento = null;
        }
        return resultadoTratamiento;
    }
   public ResultSet verEspecialidad()
    {
        try 
        {
            String selectConsulta="select *from especialidad";
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerEspecialidad.executeQuery(selectConsulta);
            
        } 
        catch (Exception e) 
        {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
    
    public ResultSet buscarEspecialidad(String busqueda)
    {
        try 
        {
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerEspecialidad.executeQuery(busqueda);
            
        } 
        catch (Exception e) 
        {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
    public ResultSet buscar(String busqueda)
    {
        try 
        {
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerEspecialidad.executeQuery(busqueda);
            
        } 
        catch (Exception e) 
        {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
    public void desenchufarConexion()
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
}
