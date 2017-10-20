<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.DocBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE HTML>
<jsp:include page="encabezadoDoc.jsp"/>
<table class="bordered-table zebra-striped" id="registro">
    <thead>
    <th>ID</th>
    <th>Cedula</th>
    <th>Nombre</th>
    <th>CURP</th>    
    <th>Especialidad</th>
    <th>Domicilio</th>
    <th>Sexo</th>
    <th>Fecha de Nacimiento</th>
    <th>Nacionalidad</th>
    <th>Eliminar</th>
    <th>Editar</th>
</thead>
<script>
        function confirmarDoctor(clave){
            alertify.confirm("¿estas seguro de borrar la clave "+clave+"?",function (respuesta)
            {
                if(respuesta)
                    location.href="borrarDoctor.jsp?clave="+clave;
            });
        }
    </script>
<tbody>
    <%
        DocBD bd = new DocBD();
        Object[] fila = new Object[14];
        //creamos una variable de tipo resultset
        //que guardara los resultados ya consultados
        //de la calse
        
        
        ResultSet respuesta;
        String juntar="";
        if (bd.conectar()) {

            //pregunto si el secect *from tabla lo hizo bien
            if (bd.verDoctores()!= null) {
                respuesta = bd.verDoctores();
                
                while (respuesta.next()) {
                    fila[0] = respuesta.getInt("doctores.idDoctor");
                    fila[1] = respuesta.getString("doctores.cedula");
                    fila[2] = respuesta.getString("doctores.nombreDoc");
                    fila[3] = respuesta.getString("doctores.curpDoc");
                   
                    fila[4] = respuesta.getString("especialidades.nombreEsp");
                    
                    fila[6] = respuesta.getString("doctores.sexoDoc");                    
                    fila[7] = respuesta.getString("doctores.fechaNacDoc");
                    fila[8] = respuesta.getString("doctores.calle");
                    fila[9] = respuesta.getString("doctores.noExterior");
                    fila[10] = respuesta.getString("doctores.colonia");
                    fila[11] = respuesta.getString("doctores.municipio");
                    fila[12] = respuesta.getString("doctores.estado");
                    fila[13] = respuesta.getString("doctores.nacionalidadDoc");
                    juntar= fila[8]+" "+fila[9]+" "+fila[10]+" "+fila[11]+" "+fila[12];
    %>
    <tr>
        <td><%=fila[0]%></td>
        <td><%=fila[1]%></td>
        <td><%=fila[2]%></td>
        <td><%=fila[3]%></td>
        <td><%=fila[4]%></td>
        <td><%=juntar%></td>
        <td><%=fila[6]%></td>
        <td><%=fila[7]%></td>
        <td><%=fila[13]%></td>
        <td><button class='btn btn-default' title='Editar' onclick="location.href = 'editarDoctor.jsp?id=<%=fila[0]%>'"><i class="glyphicon glyphicon-edit"></i></button></td> 
        <td><a href="#" class='btn btn-default' title='Borrar' onclick="confirmarDoctor(<%=fila[0]%>)"><i class="glyphicon glyphicon-trash"></i> </a></td>
       
    </tr>
    <%
                }
            }
        }
    %>     

</tbody>
</table>
   
    <jsp:include page="pieDoc.jsp"/>
