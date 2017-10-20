package modelo;
import java.sql.*;

public class DocBD {
    
    private ResultSet resultadoEspecialidad, resultadoHosp, resultadoBusqueda, resultadoExpediente;
 
    private Connection variableConexion;
    
    private String servidorBD,userBD,passwordBd;
    private boolean conectado, registrado;
    private int tipoUsuario;
    
    public boolean conectar(){
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            try {
                servidorBD="jdbc:mysql://localhost/hospital";
                userBD="root";
                passwordBd="";
                variableConexion=DriverManager.getConnection(servidorBD, userBD, passwordBd);
                conectado=true;
                
            } catch (Exception e) {
                variableConexion=null;
                conectado=false;
            }
        } catch (ClassNotFoundException e) {
            variableConexion=null;
            conectado=false;
            
        }
        return conectado;
    }
    public int buscaUsuario(String user, String password){
        try {
            String sqlBuscar="select *from where user='"+user+"' and password='"+password+"'";
            Statement buscar=variableConexion.createStatement();
            ResultSet resultado=buscar.executeQuery(sqlBuscar);
            int totalUsuarios=0;
            if (resultado!=null) {
                while (resultado.next()) {                    
                    totalUsuarios++;
                    tipoUsuario=resultado.getInt("tipo");
                }
                if (totalUsuarios!=1) {
                    tipoUsuario=-1;
                }
                
            }
            
        } catch (Exception e) {
            tipoUsuario=-1;
        }
        return tipoUsuario;
    }
    //creamos el metodo que creara la incersion
    public boolean registrarEspecialidad(String nombreEsp,double costoCons){
        try {
            
            String sqlInsertarEspecialaidad="insert into especialidades values (?,?,?)";
            PreparedStatement objPrepaStaEspecialidad=variableConexion.prepareStatement(sqlInsertarEspecialaidad);
            objPrepaStaEspecialidad.setInt(1,0); 
            objPrepaStaEspecialidad.setString(2, nombreEsp.toUpperCase());
            objPrepaStaEspecialidad.setDouble(3, costoCons);
            
            objPrepaStaEspecialidad.executeUpdate();
            registrado=true;
        } catch (Exception e) {
            registrado=false;
        }
        return registrado;
        
    }
          public boolean registrarDoc(
             String cedula,
             String nombreDoc,
             String curpDoc,
             String fotoDoc,
             int idEspecialidad,

             String sexoDoc,
             String fechaNacDoc,
             String nacionalidadDoc,
             
             String calle,
             String noExterior, 
             String colonia,
            String telefono,
            String municipio,
            String estado, 
            String pais
             
     ){
        try {
            //declaramos una variable que almacena
            //la sentecia del incert de tipo string
            String sqlInsertarDoc="insert into doctores values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement objPrepaStaDoc=variableConexion.prepareStatement(sqlInsertarDoc);
            objPrepaStaDoc.setInt(1,0);
            objPrepaStaDoc.setString(2, cedula);
            objPrepaStaDoc.setString(3, nombreDoc.toUpperCase());
            objPrepaStaDoc.setString(4, curpDoc.toUpperCase());
            objPrepaStaDoc.setString(5, fotoDoc.toUpperCase());
            objPrepaStaDoc.setInt(6, idEspecialidad);
//            objPrepaStaDoc.setInt(7, IdDomicilio);
            objPrepaStaDoc.setString(7, sexoDoc.toUpperCase());
            objPrepaStaDoc.setString(8, fechaNacDoc.toUpperCase());
            objPrepaStaDoc.setString(9, nacionalidadDoc.toUpperCase());
            objPrepaStaDoc.setString(10, calle.toUpperCase());
            objPrepaStaDoc.setString(11, noExterior);
            objPrepaStaDoc.setString(12, colonia.toUpperCase());
            objPrepaStaDoc.setString(13, telefono);
            objPrepaStaDoc.setString(14, municipio.toUpperCase());
            objPrepaStaDoc.setString(15, estado.toUpperCase());
            objPrepaStaDoc.setString(16, pais.toUpperCase());
            //esta instruccion es la que se ejecuta en la base de datos
            objPrepaStaDoc.executeUpdate();
            registrado=true;
        } catch (Exception e) {
            registrado=false;
        }
        return registrado;
        
    }
           public boolean registrarUsuario(String usario, String password, int tipo){
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
          public boolean registrarHospitalizacion(int noCama, String fechaHraEnt, String fechaHraSal, String motivo, int idExpediente)
    {
        try 
        {
          //declaramos una variable que almacenara
            //la sentencia del insert del tipo String
            String sqlInsertHospitalizacion="insert into hospitalizacion values (?,?,?,?,?,?)";
            PreparedStatement objPrepaStaHosp=variableConexion.prepareStatement(sqlInsertHospitalizacion);
            objPrepaStaHosp.setInt(1, 0);
            objPrepaStaHosp.setInt(2, noCama);
            objPrepaStaHosp.setString(3, fechaHraEnt);
            objPrepaStaHosp.setString(4, fechaHraSal);
            objPrepaStaHosp.setString(5, motivo);
            objPrepaStaHosp.setInt(6, idExpediente);
            //esta instruccion es la que se ejecuta en la base de datos
            objPrepaStaHosp.executeUpdate();
            registrado=true;
        } 
        catch (Exception e) 
        {
            registrado=false;
        }
    
        return registrado;
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
    public boolean registrarDom(
            String calle,
            int noExterior, 
            String colonia, 
            int tel,
            String municipio,
            String estado, 
            String pais)
    {
        try {
            //declaramos una variable que almacena
            //la sentecia del incert de tipo string
            String sqlInsertarDom="insert into domicilio values (?,?,?,?,?,?,?,?)";
            PreparedStatement objPrepaStaDom=variableConexion.prepareStatement(sqlInsertarDom);
            objPrepaStaDom.setInt(1,0);
            objPrepaStaDom.setString(2, calle.toUpperCase());
            objPrepaStaDom.setInt(3, noExterior);
            objPrepaStaDom.setString(4, colonia.toUpperCase());
            objPrepaStaDom.setInt(5, tel);
            objPrepaStaDom.setString(6, municipio.toUpperCase());
            objPrepaStaDom.setString(7, estado.toUpperCase());
            objPrepaStaDom.setString(8, pais.toUpperCase());
            //esta instruccion es la que se ejecuta en la base de datos
            objPrepaStaDom.executeUpdate();
            registrado=true;
        } catch (Exception e) {
            registrado=false;
        }
        return registrado;
        
    }
    public ResultSet verEspecialidad(){
        try {
            String selectConsulta="Select *from especialidades";
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerEspecialidad.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
    
        public ResultSet verDom(){
        try {
            String selectConsulta="Select *from domicilio";
            Statement objStaVerDom=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerDom.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
        public ResultSet verDoctores(){
        try {
            String selectConsulta="Select doctores.idDoctor,doctores.cedula,doctores.nombreDoc,doctores.curpDoc,"
                    + "doctores.idEspecialidad,doctores.sexoDoc,doctores.fechaNacDoc,"
                    + "doctores.nacionalidadDoc,doctores.calle,doctores.noExterior,doctores.colonia,doctores.municipio,doctores.estado,especialidades.idEspecialidad,"
                    + "especialidades.nombreEsp "
                    + "from doctores,especialidades where doctores.idEspecialidad=especialidades.idEspecialidad";
            Statement objStaVerDom=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerDom.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
        public ResultSet verHosp()
    {
        try 
        {
           String selectConsulta="Select *from hospitalizacion"; 
           Statement objStaVerHosp=variableConexion.createStatement();
           resultadoHosp=objStaVerHosp.executeQuery(selectConsulta);
        } 
        catch (Exception e) 
        {
           resultadoHosp=null; 
        }
        return  resultadoHosp;
    }
         
        public ResultSet consultarInternados() {
        try {

            String selectConsulta ="select expediente.folio,hospitalizacion.idHospitalizacion,hospitalizacion.noCama,"
                    + "hospitalizacion.motivo,hospitalizacion.fechaHraEnt,hospitalizacion.fechaHraSal from expediente,hospitalizacion where"
                    + "hospitalizacion.idExpediente = expediente.idExpediente";
            Statement objStaVerHosp = variableConexion.createStatement();
            resultadoHosp = objStaVerHosp.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoHosp = null;
        }
        return resultadoHosp;
    }
    public void desconectar(){
        try {
            if(variableConexion!=null)
               variableConexion.close();
            
        } catch (Exception e) {
            
        }
    }
    public boolean ejecutarSentencia(String sql){
        try {
            Statement stEjecutar=variableConexion.createStatement();
            stEjecutar.executeUpdate(sql);
            registrado=true;
        } catch (Exception e) {
            registrado=false;
        }
        return registrado;
    }
        public ResultSet buscarEspecialidad(String busqueda){
        try {
           
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerEspecialidad.executeQuery(busqueda);
        } catch (Exception e) {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
        public ResultSet buscarDoc(String busqueda){
        try {
           
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoEspecialidad=objStaVerEspecialidad.executeQuery(busqueda);
        } catch (Exception e) {
            resultadoEspecialidad=null;
        }
        return resultadoEspecialidad;
    }
   public ResultSet verExpediente(){
        try {
            String selectConsulta="Select *from expediente";
            Statement objStaVerExpediente=variableConexion.createStatement();
            resultadoExpediente=objStaVerExpediente.executeQuery(selectConsulta);
        } catch (Exception e) {
            resultadoExpediente=null;
        }
        return resultadoExpediente;
    }
    
    
}
