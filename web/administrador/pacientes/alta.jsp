<%@page import="modelo.pacientesBD"%> 

		  <div class="modal-body">
                      <form class="form-horizontal" action="#">
                        <div class="form-group">
				<label class="col-sm-2 control-label">Nombre</label>
				<div class="col-sm-10">
                                    <input type="text" class="form-control" name="nombre" placeholder="Nombre del paciente" onkeypress="return validarLetras(event)" required>
				</div>
			 </div>
                         <div class="form-group">
                             <label class="col-sm-2 control-label">CURP</label>
                             <div class="col-sm-10">
                                 <input type="text" class="form-control" name="curp" placeholder="Clave Única de Registro" required>
                             </div>
                       </div>
			<div>  
				  <div class="col-md-6">
                                      <label>Fecha de nacimiento</label>
                                      <input type="date" class="form-control input-sm" data-format="yyyy-mm-dd" name="fecha" placeholder="aaaa-mm-dd" required>
				  </div>
                                <div class="col-md-6">
                                    <label>Sexo</label>
                                    <select class="form-control" name="sexo" required>
					<option value="">-- Selecciona un género --</option>
					<option value="H">Hombre</option>
					<option value="M">Mujer</option>
                                        <option value="O">Otro</option>
				  </select>
                                </div>
			</div>
                       <div>  
				  <div class="col-md-6">
                                      <label>Calle</label>
                                    <input type="text" class="form-control input-sm" name="calle" placeholder="Calle" required>
				  </div>
                                <div class="col-md-6">
                                    <label>No. Exterior</label>
                                    <input type="text" class="form-control input-sm" name="num" placeholder="Num. exterior" required>
                                </div>
			</div>	 
                          <div>  
				  <div class="col-md-6">
                                      <label>Colonia</label>
                                    <input type="text" class="form-control input-sm" name="colonia" placeholder="Colonia" required>
				  </div>
                                <div class="col-md-6">
                                    <label>Municipio</label>
                                    <input type="text" class="form-control input-sm" name="municipio" placeholder="Municipio" onkeypress="return validarLetras(event)" required>
                                </div>
			</div>
                        <div>  
				  <div class="col-md-6">
                                      <label>Estado</label>
                                      <input type="text" class="form-control input-sm" name="estado" placeholder="Estado" onkeypress="return validarLetras(event)" required>
				  </div>
                                <div class="col-md-6">
                                    <label>Pais</label>
                                    <input type="text" class="form-control input-sm" name="pais" placeholder="País de procedencia" onkeypress="return validarLetras(event)"required>
                                </div>
			</div>
                          <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
                          <div class="form-group">
				<label class="col-sm-2 control-label">Teléfono</label>
				<div class="col-sm-10">
                                    <input type="text" class="form-control" name="telefono" placeholder="Teléfono fijo" onkeypress="return validarNumeros(event)" required>
				</div>
			 </div>
                       
                          <input type="hidden" name="foto" value="">
		  <div class="btn-group pull-right">
                      <button type="reset" >Limpiar</button>
                      <button type="submit" >Guardar datos</button>
		  </div>
		  </form>
                </div>
 <%
    if (request.getParameter("nombre")!= null) 
    {
       pacientesBD conBD = new pacientesBD();

            if(conBD.enchufar())
            {
                if(conBD.registrarpPaciente(request.getParameter("nombre"), request.getParameter("foto"), request.getParameter("fecha"), 
                        request.getParameter("sexo"), request.getParameter("curp"), request.getParameter("calle"), 
                        request.getParameter("num"), request.getParameter("colonia"), request.getParameter("telefono"), 
                        request.getParameter("municipio"), request.getParameter("estado"), request.getParameter("pais")))
                {
                     %>
                     <script>
                         alertify.success("Registro exitoso");
                         setTimeout("location.href='registros.jsp'", 2000);
                     </script>    
                     <%
                  conBD.desenchufar();
                 }
                 else
                 {
                      %>
                     <script>
                         alertify.error("Error al registrar");
                     </script>    
                     <%
                 }
            }
             else
             {
                   %>
              <script>
                  alertify.error("Error al conectarse");
              </script>    
              <%
             }
    }

%>
