<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.ExpBD"%>
<jsp:include page="encabezadoExp.jsp"/>
<table class="bordered-table zebra-striped" id="registro">
    <thead>
    <th>Clave sintoma</th>
    <th>Nombre sintoma</th>
    <th>Descripcion sintoma</th>
    <th>clave expediente</th>
       
    <th>Editar</th>
</thead>
<tbody>
    <%
        ExpBD bd = new ExpBD();
        Object[] fila = new Object[4];
        ResultSet respuesta;
        if (bd.enchufar()) 
        {
            if (bd.verSintomas() != null) //al no ser nulo almecena en respuesta
            {
                respuesta = bd.verSintomas();
                while (respuesta.next()) 
                {
                    
                    fila[0] = respuesta.getInt("idSP");
                    fila[1] = respuesta.getString("nombreSP");
                    fila[2] = respuesta.getString("descripcionSP");
                    fila[3] = respuesta.getInt("idExpediente");
                    %>
                    <tr>
                        <td><%=fila[0]%></td>
                        <td><%=fila[1]%></td>
                        <td><%=fila[2]%></td>
                        <td><%=fila[3]%></td>
                       
                        <td><a href="editarSintoma.jsp?id=<%=fila[0]%>"><img src="images/edit-user.png" alt=""/></a></td>

                    </tr>
                    <%
                }
            }
        }
    %>
    </tbody>
</table>
    <form action="reporteEspecialidad">
        <input type="submit" value="Generar Reporte de Especialidad" />
    </form>    
    <jsp:include page="pieExp.jsp"/>