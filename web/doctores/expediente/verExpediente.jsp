<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.accesoBD"%>
<jsp:include page="encabezado.jsp"/>
<table class="bordered-table zebra-striped" id="registro">
    <thead>
    <th>IdExpediente</th>
    <th>Fecha</th>
    <th>Peso</th>
    <th>Talla</th>
    <th>Temperatura</th>
    <th>Folio</th>
    <th>Tipo de Sangre</th>
    <th>Editar</th>
</thead>
<tbody>
    <%
        accesoBD bd = new accesoBD();
        Object[] fila = new Object[8];
        ResultSet respuesta;
        if (bd.enchufar()) 
        {
            if (bd.verExpediente()!= null) //al no ser nulo almecena en respuesta
            {
                respuesta = bd.verExpediente();
                while (respuesta.next()) 
                {
                    fila[0] = respuesta.getInt("idExpediente");
                    fila[1] = respuesta.getString("fecha");
                    fila[2] = respuesta.getDouble("peso");
                    fila[3] = respuesta.getDouble("talla");
                    fila[4] = respuesta.getDouble("temperatura");
                    fila[5] = respuesta.getInt("folio");
                    fila[6] = respuesta.getString("tipoSangre");
    %>
                    <tr>
                        <td><%=fila[0]%></td>
                        <td><%=fila[1]%></td>
                        <td><%=fila[2]%></td>
                        <td><%=fila[3]%></td>
                        <td><%=fila[4]%></td>
                        <td><%=fila[5]%></td>
                        <td><%=fila[6]%></td>
                        
                        <td><a href="editaExpediente.jsp?id=<%=fila[0]%>"><img src="images/edit-user.png" alt=""/></a></td>

                    </tr>
                    <%
                }
            }
        }
    %>
    </tbody>
</table>
    <form action="../reporteExpediente">
        <input type="submit" value="Generar Reporte de Expediente" />
    </form>    
<jsp:include page="piePagina.jsp"/>