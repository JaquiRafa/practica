<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.accesoBD"%>
<jsp:include page="encabezado.jsp"/>
<%
    Object[] fila = new Object[2];
    if (request.getParameter("folio") != null) {
        accesoBD conBD = new accesoBD();
        int folio = Integer.parseInt(request.getParameter("folio"));
        ResultSet buscaFolio;

        if (conBD.enchufar()) {
            buscaFolio = conBD.buscar("Select *from " + "pacientes where folio= '" + folio + "'");
            if (buscaFolio != null) {
                buscaFolio.next();
                fila[0] = buscaFolio.getInt("folio");
                fila[1] = buscaFolio.getString("nombre");

                conBD.desenchufarConexion();
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

<body>

    <form action="#" class="formoid-solid-orange" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:480px;min-width:150px" method="post">
        <div class="title"><h2>Nuevo Expediente</h2></div>
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
<%
    if (request.getParameter("sangre")!= null) 
    {
        Calendar c = Calendar.getInstance(); //
        String dia, mes, annio, fecha;
        int mesTem, idCita;
       accesoBD conBD=new accesoBD();
       if(conBD.enchufar())
       {  
            mesTem = c.get(Calendar.MONTH);
            mesTem = mesTem + 1;
            dia = Integer.toString(c.get(Calendar.DATE));
            mes = Integer.toString(mesTem);
            annio = Integer.toString(c.get(Calendar.YEAR));
            fecha = ""+annio+"-"+mes+"-"+dia;
            idCita = 1;

           if(conBD.registrarExpediente(fecha, Integer.parseInt(request.getParameter("folio")), idCita, Double.parseDouble(request.getParameter("peso")), Double.parseDouble(request.getParameter("talla")),
                   request.getParameter("sangre"), Double.parseDouble(request.getParameter("temperatura"))))
                %>
                <script>
                    alertify.success("Registro exitoso");
                </script>    
                <%
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
<form action="../reporteExpediente">
    <input type="submit" value="Generar Reporte de Expediente" />
</form>    
</body>
<jsp:include page="piePagina.jsp"/>