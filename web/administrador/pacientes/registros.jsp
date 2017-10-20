<%@page import="modelo.pacientesBD"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE HTML>
<jsp:include page="encabezadoPaciente.jsp"/>
<div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="btn-group pull-right">
                <button type='button' id="nuevo"><span class="glyphicon glyphicon-plus" ></span> Nuevo paciente</button>
            </div>
            <h4><i class='glyphicon glyphicon-list'></i> Registro de pacientes</h4>
        </div>
        <div class="panel-body">
            <table class="bordered-table zebra-striped" id="registro">
                <thead>
                   
                <th>Folio</th>
                <th>Paciente</th>
                <th>Foto</th>
                <th>Nacimiento</th>
                <th>Sexo</th>
                <th>CURP</th>

                <th>Calle</th>
                <th>No.ext</th>
                <th>Colonia</th>
                <th>Telefono</th>
                <th>Municipio</th>
                <th>Estado</th>
                <th>Pais</th>
                <th>Acciones</th>
                </thead>
                <tbody>
                    <%
                        pacientesBD bd = new pacientesBD();
                        String tabla = "pacientes";
                        Object[] fila = new Object[13];
                        ResultSet respuesta;
                        if (bd.enchufar()) {
                            if (bd.ver(tabla) != null) {
                                respuesta = bd.ver(tabla);
                                while (respuesta.next()) {
                                    fila[0] = respuesta.getInt("folio");
                                    fila[1] = respuesta.getString("nombrePac");
                                    fila[2] = respuesta.getString("fotoPac");
                                    fila[3] = respuesta.getString("fechaNacPac");
                                    fila[4] = respuesta.getString("sexoPac");
                                    fila[5] = respuesta.getString("curpPac");
                                    fila[6] = respuesta.getString("calle");
                                    fila[7] = respuesta.getString("noExterior");
                                    fila[8] = respuesta.getString("colonia");
                                    fila[9] = respuesta.getString("telefono");
                                    fila[10] = respuesta.getString("municipio");
                                    fila[11] = respuesta.getString("estado");
                                    fila[12] = respuesta.getString("pais");
                    %>
                    <tr>
                        <td><%=fila[0]%></td>
                        <td><%=fila[1]%></td>
                        <td><%=fila[2]%></td>
                        <td><%=fila[3]%></td>
                        <td><%=fila[4]%></td>
                        <td><%=fila[5]%></td>
                        <td><%=fila[6]%></td>
                        <td><%=fila[7]%></td>
                        <td><%=fila[8]%></td>
                        <td><%=fila[9]%></td>
                        <td><%=fila[10]%></td>
                        <td><%=fila[11]%></td>
                        <td><%=fila[12]%></td>
                        <td>
                            <a class='btn btn-default' title='Editar' onclick="location.href = 'editar.jsp?folio=<%=fila[0]%>'"><i class="glyphicon glyphicon-edit"></i></a> 
                            <a href="#" class='btn btn-default' title='Borrar' onclick="elimina(<%=fila[0]%>)"><i class="glyphicon glyphicon-trash"></i> </a>
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
</div><br><br><br><br><br><br>
<div id="alta">
    <jsp:include page="alta.jsp"/>  
</div>
    <jsp:include page="piePaciente.jsp"/>