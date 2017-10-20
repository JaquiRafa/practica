<%@page import="modelo.DocBD"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page="encabezadoHos.jsp"/>

<table class="bordered-table zebra-striped" id="registro">
    <thead>
    <th>ID</th>
    <th>Numero Cama</th>
    <th>Fecha Entrada</th>
    <th>Fecha Salida</th>
    <th>Descripcion</th>
    <th>Expediente</th>
   <!-- <th>Ver Datos Paciente</th>-->
    <th>Editar</th>
    <th>Eliminar</th>
</thead>
<script>
        function eliminacionH(clave)
        {
            alertify.confirm("¿Seguro que deseas borrar la clave "+clave+"?", function (respuesta)
            {
              if(respuesta)
              location.href="borrarHospitalizacion.jsp?clave="+clave;
            });
        }
    </script>

<tbody>
    <%
        DocBD bd = new DocBD();
        //creamos un arreglo de tipo object
        Object[] fila = new Object[7];
        //creamos una variable de tipo resultset
        //que guardara los resultados ya consultados de la base
        ResultSet respuesta;
        //pregunto si el select *from tabla lo hizo bien
        if (bd.conectar()) 
        {
            if (bd.verHosp() != null)
            {
            //si no es nullo, entonces almacenamos
                //la consulta en respyesta
                respuesta = bd.verHosp();
            //recorremos las filas ya consultadas
                 
                //a traves del .next
                while (respuesta.next()) 
                {
                //almacenamos en el vector el valor 
                    //de cada elemento de una fila
                    fila[0] = respuesta.getInt("idHospitalizacion");
                    fila[1] = respuesta.getInt("noCama");
                    fila[2] = respuesta.getString("fechaHraEnt");
                    fila[3] = respuesta.getString("fechaHraSal");
                    fila[4] = respuesta.getString("motivo");
                    fila[5] = respuesta.getInt("idExpediente");
    %>
    <tr>
       <td><%=fila[0]%> </td>
        <td><%=fila[1]%> </td> 
        <td><%=fila[2]%> </td>
        <td><%=fila[3]%> </td>
         <td><%=fila[4]%> </td>
          <td><%=fila[5]%> </td>
        <!-- <td><button class='btn btn-default' title='Ver datos' ><i class="glyphicon glyphicon-edit"></i></button></td> -->
         <td><button class='btn btn-default' title='Editar' onclick="location.href = 'editaHospitalizacion.jsp?id=<%=fila[0]%>'"><i class="glyphicon glyphicon-edit"></i></button></td> 
         <td><a href="#" class='btn btn-default' title='Borrar' onclick="eliminacionH(<%=fila[0]%>)"><i class="glyphicon glyphicon-trash"></i> </a></td>
       
        
    </tr>
    <%

                }
            }
        }

    %>

</tbody>
</table>
    <jsp:include page="pieHos.jsp"/>