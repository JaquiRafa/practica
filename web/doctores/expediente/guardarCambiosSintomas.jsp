<%@page import="modelo.accesoBD"%>
<jsp:include page="encabezado.jsp"/>
<%
    try 
    {
        if(request.getParameter("idSP") != null && request.getParameter("nombreSP") 
                != null && request.getParameter("descripcionSP") != null && request.getParameter("idExpediente") != null)
        {
            int dato = Integer.parseInt(request.getParameter("idSP"));
            String nombre = request.getParameter("nombreSP");
            String des= request.getParameter("descripcionSP");
             int clave = Integer.parseInt(request.getParameter("idExpediente"));
            
            
            accesoBD bd = new accesoBD();
            if (bd.enchufar()) 
            {
             if (bd.ejecutarSentencia("Update sintomaspac set nombreSP='" + nombre +  "',descripcionSP='" + des +  "' where idSP='" + dato +   "'")) 
             {
               %>
                    <script>
                        alertify.success("sintomas " + <%=dato%> + " editada correctamente");
                        setTimeout("location.href='verSintomas.jsp'", 200);
                    </script>
               <%
             }
       
            }
        }
                
    } catch (Exception e) 
    {
        %>
        <script>location.href="verSintomas.jsp";</script>
        <%
    }
    
%>
<jsp:include page="piePagina.jsp"/>