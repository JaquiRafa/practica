<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.DocBD"%>
<jsp:include page="encabezadoDoc.jsp"/>
<body class="blurBg-true" >
        <form action="#" class="formoid-solid-blue" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:300px;min-width:150px" method="GET">
            <div class="title"><h2>Nuevo Doctor</h2></div>
            <div class="element-input">
                <label class="title">
                    <span class="required"></span>
                </label><div class="item-cont">
                   
                   
                    <input class="large" type="text" name="cedula"   required="required" maxlength="7" placeholder="Cedula" onkeypress="return validarNumeros(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" name="nombreDoc" required="required" maxlength="30" placeholder="Nombre del Doctor" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" name="curpDoc" required="required" maxlength="18" placeholder="Curp"><span class="icon-place"></span>
                    <input class="large" type="text" name="fotoDoc" required="required" placeholder="Foto"><span class="icon-place"></span>
                    <select name="idEspecialidad" >
                   <option value="">Elige Espcialidad</option>
                    <%
                        DocBD bd = new DocBD();
        Object[] fila = new Object[3];
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
                      
                      <option value="<%=fila[0]%>"><%=fila[1]%></option>
                    
                      <%
                }
            }
        }
                      %>
                   </select>
                       
                       
                    <select name="sexoDoc" ><option  value=""  >Elija Sexo</option><option value="H">H</option><option value="M">M</option></select>
                    
                    <div class="element-date"><label class="title">Fecha de Naciemiento</label><input class="medium" data-format="yyyy-mm-dd" type="date" name="fechaNacDoc" placeholder="yyyy-mm-dd"/></div>
                    
                    <input class="large" type="text" name="nacionalidadDoc" required="required" placeholder="Nacionalidad" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                
                    <input class="large" type="text" name="calle" placeholder="Calle" onkeypress="return validarLetras(event)"/><span class="icon-place" ></span>
                    <input class="large" type="text" name="noExterior" maxlength="3" placeholder="No. Exterior" onkeypress="return validarNumeros(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" name="colonia" placeholder="Colonia" onkeypress="return validarLetras(event)"/><span class="icon-place" ></span>
                    <input class="large" type="text" name="telefono" maxlength="10" placeholder="Telefono" onkeypress="return validarNumeros(event)"/><span class="icon-place" ></span>
                    <input class="large" type="text" name="municipio" placeholder="Municipio" onkeypress="return validarLetras(event)"/><span class="icon-place" ></span>
                    
                    
                    <input class="large" type="text" name="estado"  placeholder="Estado" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" name="pais" placeholder="Pais" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                
                    
                </div>
            </div>
            <div class="submit">
                
                <input type="submit" value="Registrar"/>
                
            </div>
        </form>
        <%
         if (request.getParameter("cedula") != null) {
        DocBD coneBD=new DocBD();
        if(coneBD.conectar())
        
        {
            if(coneBD.registrarDoc(
                    request.getParameter("cedula"),
                    request.getParameter("nombreDoc"),
                    request.getParameter("curpDoc"),
                    request.getParameter("fotoDoc"),
                    Integer.parseInt(request.getParameter("idEspecialidad")),
                    
                    request.getParameter("sexoDoc"),
                    request.getParameter("fechaNacDoc"),
                    request.getParameter("nacionalidadDoc"),
                    request.getParameter("calle"),
                    request.getParameter("noExterior"),
                    request.getParameter("colonia"),
                    request.getParameter("telefono"),
                    request.getParameter("municipio"), 
                    request.getParameter("estado"),
                    request.getParameter("pais")
                    
            ))
            {
                
            %>
            <script>
                alertify.success("Registro exitoso ;)");
            </script>
            <%
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
    </body>

    <jsp:include page="pieDoc.jsp"/>