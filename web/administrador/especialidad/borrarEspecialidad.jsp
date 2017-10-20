
<%@page import="modelo.DocBD"%>
<jsp:include page="encabezadoEsp.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try
    {
        if(request.getParameter("clave")!=null)
            
        {
            int dato =Integer.parseInt(request.getParameter("clave"));
           DocBD bd=new DocBD();
            if(bd.conectar())
                if(bd.ejecutarSentencia("delete from especialidades where idEspecialidad="+dato))
                {
                    %>
                    <script>
                        alertify.success("Especialidad borrada:"+<%=dato%>);
                        setTimeout("location.href='verEspecialidad.jsp'",1000);
                    </script>
                    <%
                }
        }
    }catch(Exception e)
    {
        %>
        <script>location.href="verEspecialidad.jsp";</script>>
        <%
    }
 %>
 <jsp:include page="pieEsp.jsp"/>