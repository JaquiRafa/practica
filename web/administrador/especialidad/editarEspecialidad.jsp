<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.DocBD"%>

<jsp:include page="encabezadoEsp.jsp"/>
 <%
        Object[] fila=new Object[3];
         if (request.getParameter("id") != null) {
        DocBD coneBD=new DocBD();
        int idEspecialidad=Integer.parseInt(request.getParameter("id"));
             ResultSet resultadoBusqueda;   
             
        if(coneBD.conectar())
        
        {
            resultadoBusqueda=coneBD.buscarEspecialidad("Select *from especialidades where idEspecialidad='"+idEspecialidad+"'");
            if(resultadoBusqueda!=null)
            {
              resultadoBusqueda.next();
              fila[0]=resultadoBusqueda.getInt("idEspecialidad");
              fila[1]=resultadoBusqueda.getString("nombreEsp");
              fila[2]=resultadoBusqueda.getDouble("costoCon");
              coneBD.desconectar();
           
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
        <form action="guardaCambiosEspacialidad.jsp" class="formoid-solid-blue" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:300px;min-width:150px" method="GET">
            <div class="title"><h2>Edita especialidad</h2></div>
            <div class="element-input">
                <label class="title">
                    <span class="required"></span>
                </label><div class="item-cont">
                   
                    <input class="large" type="text" readonly="true" value="<%=fila[0]%>" name="idEspecialidad" required="required" placeholder="Clave de specialidad" onkeypress="return validarNumeros(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" value="<%=fila[1]%>" name="nombreEsp" required="required" placeholder="Nombre de especialidad" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" value="<%=fila[2]%>" name="costoCon" required="required" placeholder="Nombre de especialidad" onkeypress="return validarNumeros(event)"/><span class="icon-place"></span>
                    
                </div>
            </div>
            <div class="submit">
                
                <input type="submit" value="Actualizar"/>
                
            </div>
        </form>
       
    </body>
    <jsp:include page="pieEsp.jsp"/> 

