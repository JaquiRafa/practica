<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.accesoBD"%>
<jsp:include page="encabezado.jsp"/>
<%
    Object[] fila = new Object[4];
    if (request.getParameter("id")!= null) 
    {
       accesoBD conBD=new accesoBD();
       int claveSintoma = Integer.parseInt(request.getParameter("id"));
       ResultSet resultadoBusqueda;
       
       if(conBD.enchufar())
       {
           resultadoBusqueda = conBD.buscarSintomas("Select *from " + "sintomaspac where idSP= '" + claveSintoma + "'");
           if(resultadoBusqueda != null)
           {
               resultadoBusqueda.next();
               fila[0] = resultadoBusqueda.getInt("idSP");
               fila[1] = resultadoBusqueda.getString("nombreSP");
               fila[2] = resultadoBusqueda.getString("descripcionSP");
               fila[3] = resultadoBusqueda.getInt("idexpediente");
               conBD.desenchufarConexion();
            }
       }
        else
        {
              %>
         <script>
             alertify.error("Error al conectarse");
         </script>    
         <%
        }
    }

%>
<body>   
    <form action="guardarCambiosSintomas.jsp" class="formoid-solid-orange" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:480px;min-width:150px" method="post">
            <div class="title"><h2>Edita sintoma</h2></div>
            <div class="element-input">
                <label class="title">
                    <span class="required">*</span>
                </label>
                <div class="item-cont">
                    <input class="large" type="text" readonly="true" value="<%=fila[0]%>" name="idSP" required="required" placeholder="Clave Sintoma" onkeypress="return validarNumeros(event)"/>
                    <span class="icon-place"></span>
                     <input class="large" type="text" value="<%=fila[1]%>" name="nombreSP" required="required" placeholder="Nombre de Sintoma" onkeypress="return validarLetras(event)"/>
                    <span class="icon-place"></span>
                    <input class="large" type="text" value="<%=fila[2]%>" name="descripcionSP" required="required" placeholder="descripcion" onkeypress="return validarLetras(event)"/>
                    <span class="icon-place"></span>
                   <input class="large" type="text" readonly="true" value="<%=fila[3]%>" name="idExpediente" required="required" placeholder="Clave expediente" onkeypress="return validarNumeros(event)"/>
                    <span class="icon-place"></span>
                </div>
            </div>
            <div class="submit"><input type="submit" value="Editar"/></div>
        </form>
</body>
<jsp:include page="piePagina.jsp"/>