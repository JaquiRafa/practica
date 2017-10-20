<%@page import="modelo.DocBD"%>
<jsp:include page="encabezadoHos.jsp"/>

<%
int hos=0;
    try {
        
        if (request.getParameter("id")!= null)
        { 
           
            hos = Integer.parseInt(request.getParameter("id"));
            int cama = Integer.parseInt(request.getParameter("noCama"));
            String entrada=request.getParameter("fechaHraEnt");
            String salida=request.getParameter("fechaHraSal");
            int exp = Integer.parseInt(request.getParameter("idExpediente"));
            
           DocBD bd=new DocBD();
            if(bd.conectar())
            {
                if(bd.ejecutarSentencia("Update hospitalizacion set noCama ='"+cama+"',"
                        + " fechaHraEnt='" + entrada +"',"
                        + " fechaHraSal='"+salida+"',"
                        + " idExpediente='"+exp+ "' where idHospitalizacion='"+hos+"'"))
                {
                    %>
                    <script>
                       alertify.success("Hospitalizacion "+<%=hos%>+" Editada Correctamente");
                       setTimeout("location.href='verHospitalizacion'",2000);
                      location.href='verHospitalizacion.jsp';
                    </script>
                    <%
                }
            }
        }
        else
        {
         %>
          <script>
                    alertify.success("Hospitalizacion "+<%=hos%>+" Editada Correctamente");
                    setTimeout("location.href='verHospitalizacion'",1000)}
                    location.href='verHospitalizacion.jsp';
                    </script>
                 <%
        }

    } 
    catch (Exception ex)
{
%>


<%
}
%>
<jsp:include page="pieHos.jsp"/>;
