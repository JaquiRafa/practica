
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<html>
    <head>
        
        <title>Hospital</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="../../css/template/main.css" />
        <link href="../../css/template/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/template/ie8.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/alertas/alertify.core.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/alertas/alertify.default.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/formoid/formoid-flat-green.css" rel="stylesheet" type="text/css"/>

        <link href="../../css/query/bootstrapventana.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/query/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/query/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <script src="../../js/template/jquery.min.js"></script>
    <script src="../../js/template/jquery.dropotron.min.js"></script>
    <script src="../../js/template/skel.min.js"></script>
    <script src="../../js/template/skel-viewport.min.js"></script>
    <script src="../../js/template/util.js"></script>
    <script src="../../js/template/main.js"></script>
    <script src="../../js/alertas/alertify.js" type="text/javascript"></script>
    <script src="../../js/query/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="../../js/query/jquery-ui.js" type="text/javascript"></script>

  
<script type="text/javascript">
       
          
      function validarLetras(e) { // 1
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla==8) return true; // backspace
        if (tecla==32) return true; // espacio
        if (e.ctrlKey && tecla==86) { return true;} //Ctrl v
        if (e.ctrlKey && tecla==67) { return true;} //Ctrl c
        if (e.ctrlKey && tecla==88) { return true;} //Ctrl x
     
        patron = /[a-zA-Z]/; //patron
     
        te = String.fromCharCode(tecla);
        return patron.test(te); // prueba de patron
      }
    </script>
<script type="text/javascript">
      function validarNumeros(e) { // 1
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla==8) return true; // backspace
        if (tecla==32) return false; // espacio
        if (e.ctrlKey && tecla==86) { return true;} //Ctrl v
        if (e.ctrlKey && tecla==67) { return true;} //Ctrl c
        if (e.ctrlKey && tecla==88) { return true;} //Ctrl x
     
        patron = /[0-9]/; //patron
     
        te = String.fromCharCode(tecla);
        return patron.test(te); // prueba de patron
      }
    </script>
  <body class="homepage">
        <div id="page-wrapper">
            <nav id="nav">
                <ul>
                    <li><a href="../doctor.jsp">Inicio</a></li>
                    
                    <li>
                        <a href="#">Registros</a>
                        <ul>
                           
                            
                            <li><a href="frmHospi.jsp">Hospitalizacion</a></li>
                        </ul>
                    </li>
                    
                    <li><a href="../../login.jsp?cerrar='true'">Cerrar sesión</a></li>
                    <li><a href="verHospitalizacion.jsp">Tabla Hospitalizacion</a></li>
                </ul>
            </nav>
            <br><br>
            <center>               
                <div id="main-wrapper">
                   
