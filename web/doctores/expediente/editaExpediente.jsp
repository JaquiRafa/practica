<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.accesoBD"%>
<%
    Object[] fila = new Object[8];
    if (request.getParameter("id")!= null) 
    {
       accesoBD conBD=new accesoBD();
       int idExpediente = Integer.parseInt(request.getParameter("id"));
       ResultSet resultadoBusqueda;
       
       if(conBD.enchufar())
       {
           resultadoBusqueda = conBD.buscarExpediente("Select *from " + "expediente where idExpediente= '" + idExpediente + "'");
           if(resultadoBusqueda != null)
           {
               resultadoBusqueda.next();
               fila[0] = resultadoBusqueda.getInt("idExpediente");
               fila[1] = resultadoBusqueda.getString("fecha");
               fila[2] = resultadoBusqueda.getInt("folio");
               fila[3] = resultadoBusqueda.getInt("idCita");
               fila[4] = resultadoBusqueda.getDouble("peso");
               fila[5] = resultadoBusqueda.getDouble("talla");
               fila[6] = resultadoBusqueda.getString("tipoSangre");
               fila[7] = resultadoBusqueda.getDouble("temperatura");
               
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
<jsp:include page="encabezado.jsp"/>
<a href="menuDoctor.jsp"></a>
<body>
    <form action="" class="formoid-solid-orange" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:480px;min-width:150px" method="post">
        <div class="title"><h2>Modificacion de Expediente</h2></div>
        <div class="element-input">
            
            <input type="hidden" name="folio" value="<%=fila[0]%>">
            <div class="item-cont">
                <input class="large" type="text" name="nombre" value="<%=fila[1]%>"required="required" placeholder="Paciente" onkeypress="return validarLetras(event)" readonly="true"/>
                <span class="icon-place"></span>    
            </div>

            <div class="item-cont">
                <input class="large" type="text" name="peso" required="required" placeholder="Peso del Paciente" onkeypress="return validarNumeros(event)"/>
                <span class="icon-place"></span>
            </div>
            <div class="item-cont">
                <input class="large" type="text" name="talla" required="required" placeholder="Talla del Paciente" onkeypress="return validarNumeros(event)"/>
                <span class="icon-place"></span>
            </div>

            <div><label class="title">
                    <span class="required"></span></label>
                <div class="item-cont"><div class="large"><span>
                            <select name="sangre" required="required">
                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                                <option value="R+">R+</option>
                                <option value="R-">R-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                            </select><i></i>
                            <span class="icon-place"></span></span>
                    </div>
                </div>
            </div>
            <div class="item-cont">
                <input class="large" type="text" name="temperatura" required="required" placeholder="Temperatura del Paciente" onkeypress="return validarNumeros(event)"/>
                <span class="icon-place"></span>    
            </div>
        </div>
        <div class="submit"><input type="submit" value="Registrar"/></div>
    </form>
</body>
<jsp:include page="piePagina.jsp"/>
                      
