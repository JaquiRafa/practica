<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.DocBD"%>

<jsp:include page="encabezadoHos.jsp"/>
<%
          Object[] fila=new Object[5];
         if (request.getParameter("id") != null) {
        DocBD coneBD=new DocBD();
        int idHospitalizacion;
        int clave=Integer.parseInt(request.getParameter("id"));
        ResultSet resultadoBusqueda;
        
        if(coneBD.conectar())
        
        {
            resultadoBusqueda=coneBD.buscarDoc("Select *from " +
                    "hospitalizacion where idHospitalizacion='"+clave+"'");
                    
                    
            if(resultadoBusqueda!=null)
            {
                
                resultadoBusqueda.next();
                fila[0]=resultadoBusqueda.getInt("idHospitalizacion");
                fila[1]=resultadoBusqueda.getInt("noCama");
                fila[2]=resultadoBusqueda.getString("fechaHraEnt");
                fila[3]=resultadoBusqueda.getString("fechaHraSal");
                fila[4]=resultadoBusqueda.getInt("idExpediente");
                coneBD.desconectar();

                
            
           
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
        <link href="css/formoid-flat-green.css" rel="stylesheet" type="text/css"/>
        <script src="js/formoid-flat-green.js" type="text/javascript"></script>
        <script src="js/jquery.min.js" type="text/javascript"></script>
<body class="blurBg-true" >
<center>
    <form action="guardaCambiosHospitalizacion.jsp" class="formoid-flat-green" style="background-color:#00cc99;font-size:14px;font-family:'Lato', sans-serif;color:#1e1e1e;max-width:500px;min-width:100px" method="post"><div class="title"><h2>Hospitalizacion</h2></div>
        <div class="element-input"><input class="large" type="hidden" value="<%=fila[0]%>" required="required" onkeypress="return validarNumeros(event)" name="id" /></div>
        <div class="element-input"><label class="title">Numero Cama</label><input class="large" type="text" value="<%=fila[1]%>" required="required" onkeypress="return validarNumeros(event)" name="noCama" /></div>
	<div class="element-date"><label class="title">Fecha Entrada </label><input class="large" data-format="yyyy-mm-dd" type="date" value="<%=fila[2]%>"required="required"  name="fechaHraEnt" pld"aceholder="yyyy-mm-dd"/></div>
	<div class="element-date"><label class="title">Fecha Salida</label><input class="large" data-format="yyyy-mm-dd" type="date" value="<%=fila[3]%>" required="required" name="fechaHraSal" placeholder="yyyy-mm-dd"/></div>
        <div class="element-input"><label class="title">Expediente</label><input class="large" type="text" readonly="true" value="<%=fila[4]%>" required="required" onkeypress="return validarNumeros(event)" name="idExpediente" /></div>
                
<div class="submit"><input type="submit" value="Guardar"/></div></form>
    </center>
        
    </body>
    <jsp:include page="pieHos.jsp"/> 
