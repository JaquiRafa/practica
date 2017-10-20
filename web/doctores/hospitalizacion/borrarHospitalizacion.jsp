<%@page import="modelo.DocBD"%>

<jsp:include page="encabezadoHos.jsp"/>;
<%

    try {
        if (request.getParameter("clave") != null) 
        {
            int dato = Integer.parseInt(request.getParameter("clave"));
            DocBD bd=new DocBD();
            if(bd.conectar())
            {
                if(bd.ejecutarSentencia("Delete from hospitalizacion "
                        + "where idHospitalizacion="+dato))
                {
                    %>
                    <script>
                        alertify.success("Hospitalizacion Eliminada: "+<%=dato%>);
                        setTimeout("location.href='verHospitalizacion.jsp'",1000)
                    </script>
                    <%
                }
            }
        }

    } 
    catch (Exception ex)
{
%>
<script> location.href="verHospitalizacion.jsp";</script>

<%
}
%>
<jsp:include page="pieHos.jsp"/>;