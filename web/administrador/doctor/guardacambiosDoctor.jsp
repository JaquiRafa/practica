
<%@page import="modelo.DocBD"%>
<jsp:include page="encabezadoDoc.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try
    {
        if(request.getParameter("idDoctor")!=null &&
                request.getParameter("cedula")!=null &&
                request.getParameter("nombreDoc")!=null &&
                request.getParameter("curpDoc")!=null &&
                request.getParameter("fotoDoc")!=null &&
                request.getParameter("fechaNacDoc")!=null &&                
                request.getParameter("nacionalidadDoc")!=null &&
                request.getParameter("calle")!=null &&
                request.getParameter("noExterior")!=null &&
                request.getParameter("colonia")!=null &&
                request.getParameter("telefono")!=null &&
                request.getParameter("municipio")!=null &&
                request.getParameter("estado")!=null &&
                request.getParameter("pais")!=null
                )
            
        {
            int iD =Integer.parseInt(request.getParameter("idDoctor"));
            String cedula=request.getParameter("cedula");
            String nombreDoc=request.getParameter("nombreDoc");
            String curpDoc=request.getParameter("curpDoc");
         
            String fotoDoc=request.getParameter("fotoDoc");
            String fechaNacDoc=request.getParameter("fechaNacDoc");
            String nacionalidadDoc=request.getParameter("nacionalidadDoc");
            String calle=request.getParameter("calle");
            String noExterior=request.getParameter("noExterior");
            String colonia=request.getParameter("colonia");
            String telefono=request.getParameter("telefono");
            String municipio=request.getParameter("municipio");
            String estado=request.getParameter("estado");
            String pais=request.getParameter("pais");
           DocBD bd=new DocBD();
            if(bd.conectar()){
                if(bd.ejecutarSentencia("Update doctores set cedula='"+cedula+
                        "',nombreDoc='"+nombreDoc.toUpperCase()+
                        "',curpDoc='"+curpDoc.toUpperCase()+
                        "',fotoDoc='"+fotoDoc.toUpperCase()+
                        "',fechaNacDoc='"+fechaNacDoc.toUpperCase()+
                        "',nacionalidadDoc='"+nacionalidadDoc.toUpperCase()+
                        "',calle='"+calle.toUpperCase()+
                        "',noExterior='"+noExterior+
                        "',colonia='"+colonia.toUpperCase()+
                        "',telefono='"+telefono+
                        "',municipio='"+municipio.toUpperCase()+
                        "',estado='"+estado.toUpperCase()+
                        "',pais='"+pais.toUpperCase()+
                        "' where idDoctor='"+iD+"'"))
                {
                    %>
                    <script>
                        alertify.success("Doctor:"+<%=iD%>+" editada correctamente");
                        setTimeout("location.href='verDoctor.jsp'",200);
                    </script>
                    <%
                }
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