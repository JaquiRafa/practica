<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.DocBD"%>
<jsp:include page="encabezadoEsp.jsp"/>
<table class="bordered-table zebra-striped" id="registro">
    <thead>
    <th>Clave especialidad</th>
    <th>Nombre especialidad</th>
    <th>Costo</th>
    <th>Eliminar</th>
    <th>Editar</th>
</thead>
<script>
        function confirmarEliminacion(clave){
            alertify.confirm("¿estas seguro de borrar la clave "+clave+"?",function (respuesta)
            {
                if(respuesta)
                    location.href="borrarEspecialidad.jsp?clave="+clave;
            });
        }
    </script>
<tbody>
    <%
        DocBD bd = new DocBD();
        Object[] fila = new Object[4];
        //creamos una variable de tipo resultset
        //que guardara los resultados ya consultados
        //de la calse
        ResultSet respuesta;
        if (bd.conectar()) {

            //pregunto si el secect *from tabla lo hizo bien
            if (bd.verEspecialidad() != null) { 
                respuesta = bd.verEspecialidad();
                while (respuesta.next()) {
                    fila[0] = respuesta.getInt("idEspecialidad");   
                    fila[1] = respuesta.getString("nombreEsp");
                    fila[2] = respuesta.getInt("costoCon");
    %>
    <tr>
        <td><%=fila[0]%></td>
        <td><%=fila[1]%></td>
        <td><%=fila[2]%></td>
        <td><button class='btn btn-default' title='Editar' onclick="location.href = 'editarEspecialidad.jsp?id=<%=fila[0]%>'"><i class="glyphicon glyphicon-edit"></i></button></td> 
        <td><a href="#" class='btn btn-default' title='Borrar' onclick="confirmarEliminacion(<%=fila[0]%>)"><i class="glyphicon glyphicon-trash"></i> </a></td>
        </tr>
    <%
                }
            }
        }
    %>     
</tbody>
</table>
    <jsp:include page="pieEsp.jsp"/>
