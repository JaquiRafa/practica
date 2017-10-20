<%@page import="modelo.accesoBD"%>
<jsp:include page="encabezado.jsp"/>
<%
    
System.out.println("idTratamiento");
    try {
     
        if (request.getParameter("idTratamiento") != null) 
        {
            out.println("Id trata: "+request.getParameter("idTratamiento"));
            int trata=Integer.parseInt(request.getParameter("idTratamiento"));
            String medi=request.getParameter("medicamento");
            String doci=request.getParameter("dosis");
            String duracio=request.getParameter("duracion");
            int exp=Integer.parseInt(request.getParameter("idExpediente"));
            System.out.println("id:"+trata);
            accesoBD bd=new accesoBD();
            if(bd.enchufar())
            {
                if(bd.ejecutarSentencia("Update tratamientos set medicamento='"+medi+"',"
                        + " dosis='"+ doci +"',"
                        + " duracion='"+duracio+"',"
                        + " idExpediente='"+exp+ "' where idTratamiento='"+trata+"'"))
                {
                    %>
                    <script>
                        alertify.success("Tratamiento "+<%=trata%>+" Editada Correctamente");
                        setTimeout("location.href='verTratamiento.jsp'",1000)
                        location.href='verTratamiento.jsp';
                    </script>
                    <%
                }
            }
        }
        else
        {
            
        }

    } 
    catch (Exception ex)
{
%>
<script> location.href="verEspecialidad.jsp";</script>

<%
}
%>
<jsp:include page="piedepagina.jsp"/>;
