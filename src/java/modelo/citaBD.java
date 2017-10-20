package modelo;
import java.sql.*;
public class citaBD
{
    private ResultSet resultadoEspecialidad, resultadoVer, resultadoBusqueda,resultadoPaciente, resultadoExpediente,
            resultadofolio;
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

    public boolean registrarEspecialidad(int idEspecialidad, String nombreEsp, double costoCon)
    {
        try 
        {
            String sqlInsertarEspecialidad="insert into especialidades values (?,?,?)";
            PreparedStatement objPrepaStaEspecialidad=variableConexion.prepareStatement(sqlInsertarEspecialidad);
            objPrepaStaEspecialidad.setInt(1,0);
            objPrepaStaEspecialidad.setString(2, nombreEsp);
            objPrepaStaEspecialidad.setDouble(3, costoCon);
            
            objPrepaStaEspecialidad.executeUpdate();
            registrado=true;
        } 
        catch (Exception e) 
        {
            registrado=false;
        }
      return registrado;  
    }
    
    
     public boolean registrarCita( String fechaCita, String horaCita,  int folio,  String estadoCita,int idDoctor ){
        try {
            //declaramos una variable que almacena
            //la sentecia del incert de tipo string 
            String sqlInsertarCita="insert into citas values (?,?,?,?,?,?)";
            PreparedStatement objPrepaStaCita=variableConexion.prepareStatement(sqlInsertarCita);
           objPrepaStaCita.setInt(1,0);
           objPrepaStaCita.setString(2,fechaCita);
           objPrepaStaCita.setString(3, horaCita);
           objPrepaStaCita.setInt(4,folio );
           objPrepaStaCita.setString(5,estadoCita);
           objPrepaStaCita.setInt(6,idDoctor);

           //esta instruccion es la que se ejecuta en la base de datos
            objPrepaStaCita.executeUpdate();
            registrado=true;
        } catch (Exception e) {
            registrado=false;
        }
        return registrado;
        
    }
    
    
    
     public boolean registrarSalario(double salarioNeto, String fechaInicio, String fechaFin, int idDoctor)
    {
        try 
        {
            String sqlSalario="insert into salarios values (?,?,?,?,?)";
            PreparedStatement salario = variableConexion.prepareStatement(sqlSalario);
            salario.setInt(1,0);
            salario.setDouble(2, salarioNeto);
            salario.setString(3, fechaInicio);
            salario.setString(4, fechaFin);
            salario.setInt(5, idDoctor);
            
            salario.executeUpdate();
            registrado=true;
        } 
        catch (Exception e) 
        {
            registrado=false;
        }
      return registrado;  
    }
    public ResultSet verEspecialidad()
    {
        try 
        {
            String selectConsulta="select *from especialidades";
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
    
     public ResultSet consultageneralDoctores(){
        try {
            String selectConsulta="Select *from Doctores";
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerEspecialidad.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
          public ResultSet consultageneralPacientes(){
        try {
            String selectConsulta="Select *from Pacientes";
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerEspecialidad.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
          
         public ResultSet verExpediente(){
        try {
            String selectConsulta="Select  expediente.idExpediente, tratamiento.medicamento, sintomaspac.nombreSP, citas.idCita from expediente, tratamiento, sisntomaspac, cita  INNER JOIN expediente.idCita=Cita.idCita ";
            Statement objStaVerExpediente=variableConexion.createStatement();
            resultadoExpediente=objStaVerExpediente.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoExpediente=null;
        }
        return resultadoExpediente;
    }
        
    public ResultSet verPacientes(){
        try {
            String selectConsulta="Select  * from pacientes ";
            Statement objStaVerPacientes=variableConexion.createStatement();
            resultadoPaciente=objStaVerPacientes.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoPaciente=null;
        }
        return resultadoPaciente;
    }
       public ResultSet verPacienteNoFolio(int folio){
          try {
            String selectConsulta="Select  * from pacientes folio= '"+folio+"'";
            Statement objStaVerPacientes=variableConexion.createStatement();
            resultadofolio=objStaVerPacientes.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadofolio=null;
        }
        return resultadofolio;
  
    }
       public ResultSet vercitasRepetidas(String busqueda)
     {
        try
        {
            Statement objStaVerExpediente=variableConexion.createStatement();
            resultadoExpediente=objStaVerExpediente.executeQuery(busqueda);
        } catch (Exception e) {
            resultadoExpediente=null;
        }
        return resultadoExpediente;
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
    
    public int buscaUsuario(String user, String password)
    {
        try 
        {
            String sqlBuscar = "Select *from usuario where user='"+user+"' and password='"+password+"'";
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
}
