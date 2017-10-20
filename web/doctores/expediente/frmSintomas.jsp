<%@page import="modelo.accesoBD"%>
<jsp:include page="encabezado.jsp"/>
<link href="css/alertify.core.css" rel="stylesheet" type="text/css"/>
<link href="css/alertify.default.css" rel="stylesheet" type="text/css"/>
<script src="js/alertify.js" type="text/javascript"></script>
<body>

    <form action="#" class="formoid-solid-orange" style="background-color:blue;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:480px;min-width:150px">
        <div class="title"><h2>Nuevo Sintoma</h2></div>
        <div class="element-input">
            <label class="title">
                <span class="required">*</span>
            </label>
            <div class="item-cont">

                <input class="large" type="text" name="nombre" required="required" placeholder="Nombre Sintoma" onkeypress="return validarLetras(event)"/>
                <span class="icon-place"></span>
                <input class="large" type="text" name="descripcion" required="required" placeholder="descripcion Sintoma" onkeypress="return validarLetras(event)"/>
                <span class="icon-place"></span>
                <input class="large" type="text" name="idExpediente" required="required" placeholder="Clave expediente" onkeypress="return validarNumeros(event)"/>
                <span class="icon-place"></span>

            </div>
        </div>
        <div class="submit"><input type="submit" value="Registrar"/></div>
    </form>

    <%
        if (request.getParameter("nombre") != null) {
            accesoBD conBD = new accesoBD();
            int temporal = 1;
            if (conBD.enchufar()) {

                if (conBD.registrarSintomas(request.getParameter("nombre"),
                        request.getParameter("descripcion"),
                        Integer.parseInt(request.getParameter("idExpediente")))) {
    %>
    <script>
        alertify.success("Registro exitoso");
    </script>    
    <%
        conBD.desenchufarConexion();
    } else {
    %>
    <script>
        alertify.error("Error al registrar");
    </script>    
    <%
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
</body>
<jsp:include page="piePagina.jsp"/>