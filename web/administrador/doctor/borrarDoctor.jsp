
<%@page import="modelo.DocBD"%>
<jsp:include page="encabezadoDoc.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try
    {
        if(request.getParameter("clave")!=null)
            
        {
            int dato =Integer.parseInt(request.getParameter("clave"));
           DocBD bd=new DocBD();
            if(bd.conectar())
                if(bd.ejecutarSentencia("Delete from doctores where idDoctor="+dato))
                {
                    %>
                    <script>
                        alertify.success("Dctor borrado:"+<%=dato%>);
                        setTimeout("location.href='verDoctor.jsp'",1000);
                    </script>
                    <%
                }
        }
    }catch(Exception e)
    {
        %>
        <script>location.href="verDoctor.jsp";</script>>
        <%
    }
 %>
 <jsp:include page="pieDoc.jsp"/>