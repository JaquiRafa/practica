<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<%@page session="true"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Inicio de Sesión</title>  

        <link href="css/login/reset.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/login/styles.css" rel="stylesheet" type="text/css"/>

        <link href="css/alertas/alertify.core.css" rel="stylesheet" type="text/css"/>
        <link href="css/alertas/alertify.default.css" rel="stylesheet" type="text/css"/>
    </head>
    <script src="js/alertas/jquery.min.js" type="text/javascript"></script>
    <script src="js/alertas/alertify.js" type="text/javascript"></script>
    <body>

        <div class="login">
            <header class="login-header"><span class="text">INICIAR</span><span class="loader"></span></header>
            <form class="login-form" action="#">
                <input type="text" placeholder="Usuario" class="login-input" name="usuario" required=""/>
                <input type="password" placeholder="Password" class="login-input" name="password" required=""/>
                <button type="submit" class="login-btn">Entrar</button>	
            </form>
        </div>

    </body>
    
    <%
    if(request.getParameter("usuario") != null)
    {
        String usuario, password, fecha, hora;
        int id, mesTem;
        usuario = request.getParameter("usuario");
        password = request.getParameter("password");
        Calendar c = Calendar.getInstance(); //
        String dia, mes, annio, hrs, min, seg;
      
        conexionBD bd = new conexionBD();
        HttpSession sesion = request.getSession();
        ResultSet busqueda;
        
        if(bd.enchufar())
        {
            int tipo=bd.buscaUsuario(usuario, password);
            switch (tipo) 
            {
                    case 1:
                        busqueda = bd.buscar("Select *from usuarios where usuario='"+ usuario +"'");
                        busqueda.next();
                        id = busqueda.getInt("idUsuario");
                        
                        sesion.setAttribute("user", usuario);
                        sesion.setAttribute("pass", password);
                        sesion.setAttribute("tipo", "1");
                        
                        mesTem = c.get(Calendar.MONTH);
                        mesTem = mesTem + 1;
                        dia = Integer.toString(c.get(Calendar.DATE));
                        mes = Integer.toString(mesTem);
                        annio = Integer.toString(c.get(Calendar.YEAR));
                        fecha = ""+annio+"-"+mes+"-"+dia;
                        
                        hrs = Integer.toString(c.get(Calendar.HOUR_OF_DAY));
                        min = Integer.toString(c.get(Calendar.MINUTE));
                        seg = Integer.toString(c.get(Calendar.SECOND));
                        hora = ""+hrs+":"+min+":"+seg;
                        
                        bd.registrarSesion(fecha, hora, id);
                        bd.desenchufar();;
                        response.sendRedirect("administrador/menuAdministrador.jsp");  
                        
                         break;
                    case 2:
                        busqueda = bd.buscar("Select *from usuarios where usuario='"+ usuario +"'");
                        busqueda.next();
                        id = busqueda.getInt("idUsuario");
                        
                        sesion.setAttribute("user", usuario);
                        sesion.setAttribute("pass", password);
                        sesion.setAttribute("tipo", "2");
                        
                        mesTem = c.get(Calendar.MONTH);
                        mesTem = mesTem + 1;
                        dia = Integer.toString(c.get(Calendar.DATE));
                        mes = Integer.toString(mesTem);
                        annio = Integer.toString(c.get(Calendar.YEAR));
                        fecha = ""+annio+"-"+mes+"-"+dia;
                        
                        hrs = Integer.toString(c.get(Calendar.HOUR_OF_DAY));
                        min = Integer.toString(c.get(Calendar.MINUTE));
                        seg = Integer.toString(c.get(Calendar.SECOND));
                        hora = ""+hrs+":"+min+":"+seg;
                        
                        bd.registrarSesion(fecha, hora, id);
                        bd.desenchufar();;
                        response.sendRedirect("doctores/menuDoctor.jsp");  
                        
                         break;
                    case 3:
                        busqueda = bd.buscar("Select *from usuarios where usuario='"+ usuario +"'");
                        busqueda.next();
                        id = busqueda.getInt("idUsuario");
                        
                        sesion.setAttribute("user", usuario);
                        sesion.setAttribute("pass", password);
                        sesion.setAttribute("tipo", "3");
                        
                        mesTem = c.get(Calendar.MONTH);
                        mesTem = mesTem + 1;
                        dia = Integer.toString(c.get(Calendar.DATE));
                        mes = Integer.toString(mesTem);
                        annio = Integer.toString(c.get(Calendar.YEAR));
                        fecha = ""+annio+"-"+mes+"-"+dia;
                        
                        hrs = Integer.toString(c.get(Calendar.HOUR_OF_DAY));
                        min = Integer.toString(c.get(Calendar.MINUTE));
                        seg = Integer.toString(c.get(Calendar.SECOND));
                        hora = ""+hrs+":"+min+":"+seg;
                        
                        bd.registrarSesion(fecha, hora, id);
                        bd.desenchufar();;
                        response.sendRedirect("pacientes/verificaFolio.jsp");  
                        
                         break;
                    case -1:
                        %>
                        <script>
                            alertify.error("Usuario o contraseña incorrecto");
                        </script> 
                        <%
                        break;
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

    if(request.getParameter("cerrar") != null)
    {
        session.invalidate();
    }

%>
</html>