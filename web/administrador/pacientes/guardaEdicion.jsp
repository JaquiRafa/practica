<%@page import="modelo.conexionBD"%>
<%@page session="true"%>
<jsp:include page="encabezadoUsuario.jsp"/>

<%
    try 
    {
        if(request.getParameter("usuario") != null)
        {
            int id = Integer.parseInt(request.getParameter("id"));
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("pass");
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            
            conexionBD bd = new conexionBD();
            if (bd.enchufar()) 
            {
             if (bd.ejecutarSentencia("Update usuarios set usuario='" + usuario + "', contrasena='"+contrasena+
                     "', tipo='"+ tipo +"' where idUsuario='" + id + "'")) 
             {
               %>
                    <script>
                        alertify.success("Usuario editado correctamente");
                        setTimeout("location.href='verUsuarios.jsp'", 2000);
                    </script>
               <%
             }
            else
            {
            %>
                <script>
                    alertify.error("Error aleditar");
                    setTimeout("location.href='verUsuarios.jsp'", 2000);
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