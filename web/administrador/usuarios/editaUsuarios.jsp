<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezadoUsuario.jsp"/>

<%
    Object[] fila = new Object[4];
    String tipo = "";
    if (request.getParameter("id") != null) {
        conexionBD conBD = new conexionBD();
        int id = Integer.parseInt(request.getParameter("id"));
        ResultSet resultadoBusqueda;

        if (conBD.enchufar()) {
            resultadoBusqueda = conBD.buscar("Select *from usuarios where idUsuario= '" + id + "'");
            if (resultadoBusqueda != null) {
                resultadoBusqueda.next();
                fila[0] = resultadoBusqueda.getInt("idUsuario");
                fila[1] = resultadoBusqueda.getString("usuario");
                fila[2] = resultadoBusqueda.getString("contrasena");
                fila[3] = resultadoBusqueda.getInt("tipo");
                conBD.desenchufar();

                if (fila[3].equals(1)) {
                    tipo = "Administrador";
                } else if (fila[3].equals(2)) {
                    tipo = "Doctor";
                } else {
                    tipo = "Paciente";
                }
            }
        } else {
%>
<script>
    alertify.error("Error al conectarse");
</script>    
<%
        }
    }


%>
<br><br>
<div class="container">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4><i class='glyphicon glyphicon-edit'></i>Edición de usuario</h4>
        </div>
        <div class="panel-body">
            <div class="modal-body">
                <form class="form-horizontal" action="guardaEditaUsuario.jsp">
                    <input type="hidden" name="id" value="<%=fila[0]%>">
                    <div id="resultados_ajax"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Usuario</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="usuario" value="<%=fila[1]%>"required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Contraseña</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" name="pass" value="<%=fila[2]%>" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Tipo de usuario</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="tipo" required>
                                <option value="<%=tipo%>"><%=tipo%></option>
                                <option value="1">Administrador</option>
                                <option value="2">Doctor</option>
                                <option value="3">Paciente</option>
                            </select>
                        </div>
                    </div>


                    <div class="btn-group pull-right">
                        <button type="submit" >Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="pieUsuario.jsp"/>