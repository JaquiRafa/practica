<%@page import="modelo.DocBD"%>

<jsp:include page="encabezadoEsp.jsp"/>
<body class="blurBg-true" >
        <form action="#" class="formoid-solid-blue" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:300px;min-width:150px" method="GET">
            <div class="title"><h2>Nueva Especialidad</h2></div>
            <div class="element-input">
                <label class="title">
                    <span class="required"></span>
                </label><div class="item-cont">
                   
                    
                    <input class="large" type="text" name="nombreEsp" required="required" placeholder="Nombre de especialidad" onkeypress="return validarLetras(event)"/><span class="icon-place"></span>
                    <input class="large" type="text" name="costoCons" required="required" placeholder="Costo de Especialidad" onkeypress="return validarNumeros(event)"/><span class="icon-place"></span>
                </div>
            </div>
            <div class="submit">
                
                <input type="submit" value="Registrar"/>
                
            </div>
        </form>
        <%
         if (request.getParameter("nombreEsp") != null) {
        DocBD coneBD=new DocBD();
        if(coneBD.conectar())
        
        {
            if(coneBD.registrarEspecialidad(
                    request.getParameter("nombreEsp"),
                    Double.parseDouble("costoCons")))
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
    <jsp:include page="pieEsp.jsp"/> 
