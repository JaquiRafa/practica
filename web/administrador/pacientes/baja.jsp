<%@page import="modelo.conexionBD"%>
<%@page session="true"%>
<jsp:include page="encabezadoPaciente.jsp"/>

<%
    try 
    {
        if(request.getParameter("id") != null)
        {
            int id = Integer.parseInt(request.getParameter("id"));
            conexionBD bd = new conexionBD();
            if (bd.enchufar()) 
            {
             if (bd.ejecutarSentencia("Delete from pacientes where folio='" + id +"'")) 
             {
               %>
                    <script>
                        alertify.success("Registro borrado: " + <%=id%>);
                        setTimeout("location.href='registros.jsp'", 1000);
                    </script>
               <%
             }
       
            }
        }
                
    } catch (Exception e) 
    {
        %>
        <script>location.href="registros.jsp";</script>
        <%
    }
    
%>
<jsp:include page="piePaciente.jsp"/>