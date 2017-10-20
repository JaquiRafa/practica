<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>   
<%
    HttpSession sesion = request.getSession();
    String usuario, tipo;

    if (sesion.getAttribute("user") != null && sesion.getAttribute("pass") != null && sesion.getAttribute("tipo") != null) {
        usuario = sesion.getAttribute("user").toString();
        tipo = sesion.getAttribute("tipo").toString();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<html>
    <head>
        <title>Hospital</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="../css/template/main.css" />
        <link href="../css/template/ie8.css" rel="stylesheet" type="text/css"/>
        <link href="../css/alertas/alertify.core.css" rel="stylesheet" type="text/css"/>
        <link href="../css/alertas/alertify.default.css" rel="stylesheet" type="text/css"/>

        <link href="../css/query/bootstrapventana.css" rel="stylesheet" type="text/css"/>
        <link href="../css/query/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../css/query/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <script src="../js/template/jquery.min.js"></script>
    <script src="../js/template/jquery.dropotron.min.js"></script>
    <script src="../js/template/skel.min.js"></script>
    <script src="../js/template/skel-viewport.min.js"></script>
    <script src="../js/template/util.js"></script>
    <script src="../js/template/main.js"></script>
    <script src="../js/alertas/alertify.js" type="text/javascript"></script>
    <script src="../js/query/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="../js/query/jquery-ui.js" type="text/javascript"></script>

    <%} else {
    %>
    <script>
        location.replace("../login.jsp");
    </script> 
    <%
        }
    %>

    <body class="homepage">
        <div id="page-wrapper">
            <nav id="nav">
                <ul>
                    <li><a href="#">Inicio</a></li>
                    <li><a href="#">Datos personales</a></li>
                    <li><a href="#">Expediente médico</a></li>
                    <li><a href="#">Generar cita médica</a></li>
                    <li><a href="../login.jsp?cerrar='true'">Cerrar sesión</a></li>
                </ul>
            </nav>
            <center>               
                <div id="main-wrapper">
                    <br><br>
                    <div class="container">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4><i class='glyphicon glyphicon-edit'></i>Ingresa tu folio</h4>
                            </div>
                            <div class="panel-body">
                                <div class="modal-body">
                                    <form class="form-horizontal" action="#">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Folio: </label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="folio" placeholder="Folio asignado" onkeypress="return validarNumeros(event)" required>
                                            </div>
                                        </div>
                                        <div class="btn-group pull-right">
                                            <button type="submit" >Verificar</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <%
                Object[] fila = new Object[1];
                if (request.getParameter("folio") != null) 
                {
                    conexionBD conBD = new conexionBD();
                    int id = Integer.parseInt(request.getParameter("folio"));
                    ResultSet resultadoBusqueda;

                    if (conBD.enchufar()) 
                    {
                        resultadoBusqueda = conBD.buscar("Select *from pacientes where folio= '" + id + "'");
                        if (resultadoBusqueda != null) 
                        {
                            resultadoBusqueda.next();
                            fila[0] = resultadoBusqueda.getInt("folio");
                            sesion.setAttribute("folio", fila[0]);
                            conBD.desenchufar();
                            %>
                            <script>
                                alertify.success("Folio: " + <%=fila[0]%> + " encontrado");
                                setTimeout("location.href='menuPaciente.jsp'", 2000);
                            </script>
                            <%
                        }
                        else if (resultadoBusqueda == null)
                        {
                            %>
                               <script>
                                alertify.error("Folio: " + <%=fila[0]%> + " no registrado");
                                setTimeout("location.href='#", 2000);
                            </script>
                            <%
                        }
                    } 
                    else {
                    %>
                    <script>
                        alertify.error("Error al conectarse");
                    </script>    
                    <%
                            }
                        }
                    %>
                    <jsp:include page="piePagina.jsp"/>