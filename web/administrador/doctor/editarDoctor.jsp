<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.DocBD"%>
<jsp:include page="encabezadoDoc.jsp"/>
<%
      Object[] fila=new Object[17];
         if (request.getParameter("id") != null) {
        DocBD coneBD=new DocBD();
        int idDoctor=Integer.parseInt(request.getParameter("id"));
             ResultSet resultadoBusqueda;   
             
        if(coneBD.conectar())
        
        {
            resultadoBusqueda=coneBD.buscarDoc("Select *from doctores where idDoctor='"+idDoctor+"'");
            if(resultadoBusqueda!=null)
            {
                    resultadoBusqueda.next();
                    fila[0] = resultadoBusqueda.getInt("idDoctor");
                    fila[1] = resultadoBusqueda.getString("cedula");
                    fila[2] = resultadoBusqueda.getString("nombreDoc");
                    fila[3] = resultadoBusqueda.getString("curpDoc");
                    fila[4] = resultadoBusqueda.getString("fotoDoc");
                    fila[5] = resultadoBusqueda.getInt("idEspecialidad");

                    fila[7] = resultadoBusqueda.getString("sexoDoc");
                    fila[8] = resultadoBusqueda.getString("fechaNacDoc");
                    fila[9] = resultadoBusqueda.getString("nacionalidadDoc");
                    fila[10] = resultadoBusqueda.getString("calle");
                    fila[11] = resultadoBusqueda.getString("noExterior");
                    fila[12] = resultadoBusqueda.getString("colonia");
                    fila[13] = resultadoBusqueda.getString("telefono");
                    fila[14] = resultadoBusqueda.getString("municipio");
                    fila[15] = resultadoBusqueda.getString("estado");
                    fila[16] = resultadoBusqueda.getString("pais");
                     
                }

        }else{
            %>
            <script>
                alertify.error("Hubo un error al intentar conectarte a la BD wey");
            </script>
            <%
            coneBD.desconectar();
        }
                
         }
                       %>
<body class="blurBg-true" >
    <form action="guardacambiosDoctor.jsp" class="formoid-solid-blue" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:300px;min-width:150px" method="GET">
            <div class="title"><h2>Editar Doctor</h2></div>
            <div class="element-input">
                <label class="title">
                    <span class="required"></span>
                </label><div class="item-cont">
                   
                    <input class="large" type="text" name="idDoctor" readonly="true" value="<%=fila[0]%>" required="required" placeholder="ID"><span class="icon-place"></span>
                    <input class="large" type="text" name="cedula" maxlength="7" readonly="true" value="<%=fila[1]%>" required="required" placeholder="Cedula" onkeypress="return validarNumeros(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" name="nombreDoc" value="<%=fila[2]%>" required="required" placeholder="Nombre del Doctor" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" name="curpDoc" maxlength="18" value="<%=fila[3]%>" required="required" placeholder="Curp"><span class="icon-place"></span>
                    <input class="large" type="text" name="fotoDoc" value="<%=fila[4]%>"  placeholder="Foto"><span class="icon-place"></span>
                    <label class="title">Fecha de Naciemiento</label><input class="medium" value="<%=fila[8]%>" data-format="yyyy-mm-dd" type="date" name="fechaNacDoc"  placeholder="yyyy-mm-dd"/>
                  
                    <input class="large" type="text" name="nacionalidadDoc" value="<%=fila[9]%>" required="required" placeholder="Nacionalidad" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                
                    <input class="large" type="text" name="calle" value="<%=fila[10]%>" placeholder="Calle" onkeypress="return validarLetras(event)"/><span class="icon-place" ></span>
                    <input class="large" type="text" name="noExterior" maxlength="3" value="<%=fila[11]%>"  placeholder="No. Exterior" onkeypress="return validarNumeros(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" name="colonia" value="<%=fila[12]%>"  placeholder="Colonia" onkeypress="return validarLetras(event)"/><span class="icon-place" ></span>
                    <input class="large" type="text" name="telefono" maxlength="10" value="<%=fila[13]%>"  placeholder="Telefono" onkeypress="return validarNumeros(event)"/><span class="icon-place" ></span>
                    <input class="large" type="text" name="municipio" value="<%=fila[14]%>" placeholder="Municipio" onkeypress="return validarLetras(event)"/><span class="icon-place" ></span>
                    
                    
                    <input class="large" type="text" name="estado" value="<%=fila[15]%>"  placeholder="Estado" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" name="pais" value="<%=fila[16]%>" placeholder="Pais" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                
                    
                    
                </div>
            </div>
            <div class="submit">
                
                <input type="submit" value="Registrar"/>
                
            </div>
        </form>
       
    </body>

    <jsp:include page="pieDoc.jsp"/>