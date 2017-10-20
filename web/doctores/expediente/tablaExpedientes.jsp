<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.accesoBD"%>
<jsp:include page="encabezado.jsp"/>
<table class="bordered-table zebra-striped" id="registro">
    <thead>
    <th>Folio</th>
    <th>Paciente</th>
    <th>Foto</th>
    <th>Domicilio</th>
    <th>Fecha de nacimiento</th>
    <th>Sexo</th>
    <th>CURP</th>
    <th>Acciones</th>
</thead>
<tbody>
    <%
        accesoBD bd = new accesoBD();
        String tabla = "pacientes";
        Object[] fila = new Object[7];
        ResultSet respuesta;
        if (bd.enchufar()) 
        {
            if (bd.ver(tabla) != null)
            {
                respuesta = bd.ver(tabla);
                while (respuesta.next()) 
                {
                    fila[0] = respuesta.getInt("folio");
                    fila[1] = respuesta.getString("nombre");
                    fila[2] = respuesta.getString("foto");
                    fila[3] = respuesta.getInt("idDomicilio");
                    fila[4] = respuesta.getString("fecha");
                    fila[5] = respuesta.getString("sexo");
                    fila[6] = respuesta.getString("curp");
                    %>
                    <tr>
                        <td><%=fila[0]%></td>
                        <td><%=fila[1]%></td>
                        <td><%=fila[2]%></td>
                        <td><%=fila[3]%></td>
                        <td><%=fila[4]%></td>
                        <td><%=fila[5]%></td>
                        <td><%=fila[6]%></td>
                        
                        <td>
                        <a href="#" class='btn btn-default' title='Generar Expediente' onclick="location.href='frmExpediente.jsp?folio=<%=fila[0]%>'"><i class="glyphicon glyphicon-check"></i> </a>
                        </td>

                    </tr>
                    <%
                }
            }
        }
    %>
    </tbody>
</table>
       
<jsp:include page="piePagina.jsp"/>