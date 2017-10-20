<%@page import="modelo.conexionBD"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page="encabezadoUsuario.jsp"/>
<div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4><i class='glyphicon glyphicon-list'></i> Registro de sesiones iniciadas</h4>
        </div>
        <div class="panel-body">
            <table class="bordered-table zebra-striped" id="registro">
                <thead>
                <th>ID</th>
                <th>Fecha de sesión</th>
                <th>Hora de sesión</th>
                <th>Clave de usuario</th>
                <th>Acciones</th>
                </thead>
                <tbody>
                    <%
                        conexionBD bd = new conexionBD();
                        String tabla = "sesiones";
                        Object[] fila = new Object[4];
                        ResultSet respuesta;
                        if (bd.enchufar()) {
                            if (bd.ver(tabla) != null) {
                                respuesta = bd.ver(tabla);
                                while (respuesta.next()) {
                                    fila[0] = respuesta.getInt("idSesion");
                                    fila[1] = respuesta.getString("fechaSesion");
                                    fila[2] = respuesta.getString("horaSesion");
                                    fila[3] = respuesta.getString("idUsuario");
                    %>
                    <tr>
                        <td><%=fila[0]%></td>
                        <td><%=fila[1]%></td>
                        <td><%=fila[2]%></td>
                        <td><%=fila[3]%></td>
                        <td>
                            <form action="/hospital/sesiones">
                                <input type="submit" value="Generar Reporte" /> 
                                <input type="hidden" name="fecha" value="<%=fila[1]%>">
                            </form> 
                        </td>
                    </tr>
                    <%
                                }
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="pieUsuario.jsp"/>