<%@page import="modelo.accesoBD"%>
<jsp:include page="encabezado.jsp"/>
<%
    try 
    {
        if(request.getParameter("clave") != null)
        {
            int dato = Integer.parseInt(request.getParameter("clave"));
            accesoBD bd = new accesoBD();
            if (bd.enchufar()) 
            {
             if (bd.ejecutarSentencia("Delete from sintoma where claveSintoma=" + dato)) 
             {
               %>
                    <script>
                        alertify.success("Sintoma borrada: " + <%=dato%>);
                        setTimeout("location.href='verSintoma.jsp'", 1000);
                    </script>
               <%
             }
       
            }
        }
                
    } catch (Exception e) 
    {
        %>
        <script>location.href="verSintoma.jsp";</script>
        <%
    }
    
%>
<jsp:include page="piePagina.jsp"/>