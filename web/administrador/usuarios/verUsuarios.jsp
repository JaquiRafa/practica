
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE HTML>
<jsp:include page="encabezadoUsuario.jsp"/>
<div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="btn-group pull-right">
                <button type='button'id="nuevoUsuario"><span class="glyphicon glyphicon-plus" ></span> Nuevo usuario</button>
            </div>
            <h4><i class='glyphicon glyphicon-list'></i> Registro de usuarios</h4>
        </div>
        <div class="panel-body">
            <table class="bordered-table zebra-striped" id="registro">
                <thead>
                <th>ID</th>
                <th>Usuario</th>
                <th>Contraseña</th>
                <th>Tipo</th>
                <th>Acciones</th>
                </thead>
                <tbody>
                    <%
                        conexionBD bd = new conexionBD();
                        String tabla = "usuarios";
                        Object[] fila = new Object[4];
                        ResultSet respuesta;
                        if (bd.enchufar()) {
                            if (bd.ver(tabla) != null) {
                                respuesta = bd.ver(tabla);
                                while (respuesta.next()) {
                                    fila[0] = respuesta.getInt("idUsuario");
                                    fila[1] = respuesta.getString("usuario");
                                    fila[2] = respuesta.getString("contrasena");
                                    fila[3] = respuesta.getString("tipo");
                    %>
                    <tr>
                        <td><%=fila[0]%></td>
                        <td><%=fila[1]%></td>
                        <td><%=fila[2]%></td>
                        <td><%=fila[3]%></td>
                        <td>
                            <button class='btn btn-default' title='Editar' onclick="location.href = 'editaUsuarios.jsp?id=<%=fila[0]%>'"><i class="glyphicon glyphicon-edit"></i></button> 
                            <a href="#" class='btn btn-default' title='Borrar' onclick="eliminaUsuario(<%=fila[0]%>)"><i class="glyphicon glyphicon-trash"></i> </a>
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
<div id="registroUsuario">
    <jsp:include page="altaUsuario.jsp"/>  
</div>
<div id="editaUsuario">
    <jsp:include page="editaUsuarios.jsp"/>  
</div>
    <jsp:include page="pieUsuario.jsp"/>