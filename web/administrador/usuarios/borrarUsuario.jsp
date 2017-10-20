<%@page import="modelo.conexionBD"%>
<%@page session="true"%>
<jsp:include page="encabezadoUsuario.jsp"/>

<%
    try 
    {
        if(request.getParameter("id") != null)
        {
            int id = Integer.parseInt(request.getParameter("id"));
            conexionBD bd = new conexionBD();
            if (bd.enchufar()) 
            {
             if (bd.ejecutarSentencia("Delete from usuarios where idUsuario='" + id +"'")) 
             {
               %>
                    <script>
                        alertify.success("Registro borrado: " + <%=id%>);
                        setTimeout("location.href='verUsuarios.jsp'", 1000);
                    </script>
               <%
             }
       
            }
        }
                
    } catch (Exception e) 
    {
        %>
        <script>location.href="verUsuarios.jsp";</script>
        <%
    }
    
%>
<jsp:include page="pieUsuario.jsp"/>