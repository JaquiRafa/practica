<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.accesoBD"%>

<jsp:include page="encabezado.jsp"/>
<body class="blurBg-true" >
<center>
        <form action="#" class="formoid-solid-blue" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:300px;min-width:150px" method="GET">
            <div class="title"><h2>Nuevo tratamiento</h2></div>
            <div class="element-input">
                <label class="title">
                    <span class="required"></span>
                </label><div class="item-cont">  
                    <div class="element-multiple"><label class="title">Medicamento</label><div class="large">
                    <input class="large" type="text" name="medicamento" required="required" placeholder="" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                    <div class="element-multiple"><label class="title">Dosis</label><div class="large">
                    <input class="large" type="text" name="dosis" required="required" placeholder="" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                    <div class="element-multiple"><label class="title">Duracion</label><div class="large">
                    <input class="large" type="text" name="duracion" required="required" placeholder="" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>   
                    
                  
                </div>
            </div>
            <div class="submit">
                
                <div class="element-multiple"><label class="title">Expediente</label><div class="large">
                        <select name="idExpediente" required="required">
                            <option value="idExpediente"></option>
                            <%
                                accesoBD coneBD = new accesoBD();
                                if(coneBD.enchufar()){
                                ResultSet resultado;
                                Object[] fila = new Object[2];
                                resultado = coneBD.buscarTratamiento("select *from expediente");
                                String datos = "";
                                if(resultado != null){
                                    while (resultado.next()){
                                        fila[1] = resultado.getString("idExpediente");
                                        datos = "" + fila[1];
                                        %>
                                        <option value="<%=fila[1]%>"><%=datos%></option>
                                        <%
                                    }
                                }
                                
                                }
                                %>
                </div>
                <input type="submit" value="Registrar"/>
                
            </div>
        </form>
    </center>
        <%
         if (request.getParameter("medicamento") != null) {
        
        if(coneBD.enchufar())
        
        {
           if(coneBD.registrarTratamientos (request.getParameter("medicamento"),
                   request.getParameter("dosis"),request.getParameter("duracion"),Integer.parseInt(request.getParameter("idExpediente"))))
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
            coneBD.desenchufarConexion();
        }
                
         }
        %>
    </body>
  <jsp:include page="piedepagina.jsp"/> 
