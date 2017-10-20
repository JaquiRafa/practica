<%-- 
    Document   : verTratamiento
    Created on : 5/04/2017, 11:13:37 PM
    Author     : garduño
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.accesoBD"%>
<jsp:include page="encabezado.jsp"/>
<table class="bordered-table zebra-striped" id="registro">
    <thead>
   
    <th>Tratamiento</th>
    <th>Medicamento</th>
    <th>Dosis</th>
    <th>Duracion</th>
    <th>Expediente</th>
    <th>Editar</th>
    
    
</thead>
<tbody>
    <%
        accesoBD bd = new accesoBD();
        Object[] fila = new Object[5];
        //creamos una variable de tipo resultset
        //que guardara los resultados ya consultados
        //de la calse
        ResultSet respuesta;
        if (bd.enchufar()) {
            if(bd.verTratamiento()!=null)
            {
                     respuesta = bd.verTratamiento();
                while (respuesta.next()) {
                    fila[0] = respuesta.getInt("idTratamiento");
                    fila[1] = respuesta.getString("medicamento");
                    fila[2] = respuesta.getString("dosis");
                    fila[3] = respuesta.getString("duracion");
                    fila[4] = respuesta.getInt("idExpediente");
    %>
    <tr>
        <td><%=fila[0]%></td>
        <td><%=fila[1]%></td>
        <td><%=fila[2]%></td>
        <td><%=fila[3]%></td>
        <td><%=fila[4]%></td>
        <td><a href="editaTrtamiento.jsp?id=<%=fila[0]%>"><img src="image/edit-user.png" alt="Modificar Tratamiento"/></a></td>
        
    </tr>
    <%
                
            }

            //pregunto si el secect *from tabla lo hizo bien
            
            }
        }
    %>     
</tbody>
</table>
<jsp:include page="piedepagina.jsp"/>

