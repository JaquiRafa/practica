
<%@page import="modelo.DocBD"%>
<jsp:include page="encabezadoEsp.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try
    {
        if(request.getParameter("idEspecialidad")!=null &&
                request.getParameter("nombreEsp")!=null &&
                request.getParameter("costoCon")!=null)
            
        {
            int dato =Integer.parseInt(request.getParameter("idEspecialidad"));
            String nombre=request.getParameter("nombreEsp");
            double costo =Double.parseDouble("costoCon");
           DocBD bd=new DocBD();
            if(bd.conectar()){
                if(bd.ejecutarSentencia("Update especialidades set nombreEsp='"+nombre.toUpperCase()+
                        "',costoCon='"+costo+
                        "' where idEspecialidad='"+dato+"'"))
                {
                    %>
                    <script>
                        alertify.success("Especialidad:"+<%=dato%>+" editada correctamente");
                        setTimeout("location.href='verEspecialidad.jsp'",200);
                    </script>
                    <%
                }
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