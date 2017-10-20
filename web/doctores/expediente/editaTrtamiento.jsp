<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.accesoBD"%>
<%@page import="modelo.resolver"%>
<jsp:include page="encabezado.jsp"/>
<%
          Object[] fila=new Object[5];
         if (request.getParameter("id") != null) {
        accesoBD coneBD=new accesoBD();
        
        int clave=Integer.parseInt(request.getParameter("id"));
        ResultSet resultadoBusqueda;
        
        if(coneBD.enchufar())
        
        {
            resultadoBusqueda=coneBD.buscarTratamiento("Select *from " +
                    "tratamientos where idTratamiento='"+clave+"'");
                    
                   
            if(resultadoBusqueda!=null)
            {
                resultadoBusqueda.next();
                fila[0]=resultadoBusqueda.getInt("idTratamiento");
                fila[1]=resultadoBusqueda.getString("medicamento");
                fila[2]=resultadoBusqueda.getString("dosis");
                fila[3]=resultadoBusqueda.getString("duracion");
                fila[4]=resultadoBusqueda.getInt("idExpediente");
                coneBD.desenchufarConexion();
             }

        }else{
            %>
            <script>
                alertify.error("Hubo un error al intentar conectarte a la BD wey");
            </script>
            <%
            
        }
                
         }
        %>
<body class="blurBg-true" >
<center>
        <form action="guardaCambiosTratamiento.jsp" class="formoid-solid-blue" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:300px;min-width:150px" method="GET">
            <div class="title"><h2>Editar Tratamiento</h2></div>
            <div class="element-input">
                <label class="title">
                    <span class="required"></span>
                </label>
                <input class="large" type="text"  type="hidden" value="<%=fila[0]%>" name="idTratamiento" required="required" placeholder="" onkeypress="return validarNumeros(event)"/><span class="icon-place"></span>
                    <input class="large" type="text"  value="<%=fila[1]%>" name="medicamento" required="required" placeholder="Medicamento" /><span class="icon-place"></span>
                    <input class="large" type="text" value="<%=fila[2]%>" name="dosis" required="required" placeholder="dosis" /><span class="icon-place"></span>
                    <input class="large" type="text" value="<%=fila[3]%>" name="duracion" required="required" placeholder="duracion" /><span class="icon-place"></span>
                    <input class="large" type="text" readonly="true" value="<%=fila[4]%>" name="idExpediente" required="required" placeholder="idExpediente" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                
            </div>
            <div class="submit">
                
                <input type="submit" value="Guardar"/>
                
            </div>
        </form>
    </center>
        
    </body>
  <jsp:include page="piedepagina.jsp"/> 
