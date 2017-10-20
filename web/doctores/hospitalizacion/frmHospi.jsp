<%@page import="modelo.pacientesBD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.DocBD"%>
<jsp:include page="encabezadoHos.jsp"/>


<body>
    <form class="formoid-flat-green" style="background-color:#00cc99;font-size:14px;font-family:'Lato', sans-serif;color:#000;max-width:500px;min-width:100px" method="post"><div class="title"><h2>Hospitalizacion</h2></div>
   
        <div class="element-multiple"><label class="title">Folio Paciente</label><div class="large">
                <select name="folio" required="required">
                    <option value="folio"></option>
               
                    
                     <%
                       pacientesBD cnBD = new pacientesBD();
                        if (cnBD.enchufar()) {
                            //declarMOS  UNA VARIABLE QUE RESIBIRA LOS DATOS DE LA CONSULTA
                            ResultSet resultado;
                            //declaramos un vextor de tipo object que permitira recorer fila por fila
                            Object[] fila = new Object[2];
                            resultado = cnBD.buscarPacientes("select *from expediente");
                            String da = "";
                            if (resultado != null) {
                                //recorremos el resultado de la consulta
                                while (resultado.next()) {
                                    //metemos las filas de la tabla en el object

                                    fila[1] = resultado.getString("folio");
                                    da = "" + fila[1];
                                    
                    %>
                    <option value="<%=fila[1]%>"><%=da%></option> 
                    <%
                                }
                            }
                        }
                    %>
                  
                </select> </div></div>
                
                
        <div class="element-input">
        <label class="title"><span class="required" >Numero de cama</span></label>
        <div class="item-cont">
            <input class="null" type="number" name="noCama" required="required" placeholder="Numero de Cama" maxlength="2" onkeypress="validarNumeros()(event)"/>
            <span class="icon-place"></span>
        </div>
        </div>
        
        <div class="element-input"><div class="item-cont"><label class="title">Fecha Entrada</label>
            <input class="null" type="date" name="fechaHraEnt" required="required"/>
            <span class="icon-place"></span></div>
         </div>
         <div class="element-input"><div class="item-cont"><label class="title">Fecha Salida</label>
            <input class="null" type="date" name="fechaHraSal" required="required"/>
            <span class="icon-place"></span></div>
         </div>
        
        
        <div class="element-multiple"><label class="title">Expediente</label><div class="large">
                <select name="idExpediente" required="required">
                    <option value="idExpediente"></option>
                    <%
                        DocBD coneBD = new DocBD();
                        if (coneBD.conectar()) {
                            //declarMOS  UNA VARIABLE QUE RESIBIRA LOS DATOS DE LA CONSULTA
                            ResultSet resultado;
                            //declaramos un vextor de tipo object que permitira recorer fila por fila
                            Object[] fila = new Object[2];
                            resultado = coneBD.buscarEspecialidad("select *from expediente");
                            String da = "";
                            if (resultado != null) {
                                //recorremos el resultado de la consulta
                                while (resultado.next()) {
                                    //metemos las filas de la tabla en el object

                                    fila[1] = resultado.getString("idExpediente");
                                    da = "" + fila[1];
                    %>
                    <option value="<%=fila[1]%>"><%=da%></option> 
                    <%
                                }
                            }
                        }
                    %>
                </select> </div></div>
       <div class="element-input">
        <label class="title"><span class="required" >Motivos de Hospitalización</span></label>
        <div class="item-cont">
            <input class="null" type="text" name="motivo" required="required" placeholder="Descripcion" onkeypress="validarLetras()(event)"/>
            <span class="icon-place"></span>
        </div>
        </div>
        <div class="submit"><input type="submit" value="Guardar"/></div></form>

</body>

<%
    if (request.getParameter("noCama") != null) {

        if (coneBD.conectar()) {
            if (coneBD.registrarHospitalizacion(Integer.parseInt(request.getParameter("noCama")),
                    request.getParameter("fechaHraEnt"),
                    request.getParameter("fechaHraSal"),
                    request.getParameter("motivo"),
                    Integer.parseInt(request.getParameter("idExpediente")))) {

%>
<script>
    alertify.success("Registro exitoso");
</script>
<%                }

} else {
%>
<script>
    alertify.error("Hubo Un Error");
</script>
<%
            coneBD.desconectar();
        }

    }
%>

<jsp:include page="pieHos.jsp"/>