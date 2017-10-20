<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a href="encabezado.jsp"></a>
<%@page import="modelo.accesoBD"%>
<%
    try 
    {
        if(request.getParameter("idExpediente") !=null)
        {
            int dato = Integer.parseInt(request.getParameter("claveEspecialidad"));
            String nombre = request.getParameter("nombreEspecialidad");
            accesoBD bd = new accesoBD();
            if (bd.enchufar()) 
            {
             if (bd.ejecutarSentencia("Update especialidad set nombreEspecialidad='" + nombre + "' where claveEspecialidad='" + dato + "'")) 
             {
               %>
                    <script>
                        alertify.success("Especialidad " + <%=dato%> + " editada correctamente");
                        setTimeout("location.href='verEspecialidad.jsp'", 200);
                    </script>
               <%
             }
       
            }
        }
                
    } catch (Exception e) 
    {
        %>
        <script>location.href="verEspecialidad.jsp";</script>
        <%
    }
    
%>
<a href="piePagina.jsp"></a>