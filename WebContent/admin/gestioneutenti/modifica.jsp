<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src = "validateUtente.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modifica Utente</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />
</head>
<body>

<div class="container">

   <%@ include file="../../header.jsp" %>
      
    <div class="page-header">
	  <h3>Pagina di Modifica Utente</h3>
	</div>
	
	<%-- alert con lista errori --%>
	<div class="alert alert-danger ${not empty utenteErrors?'':'d-none' }" role="alert">
		<c:forEach var = "errorItem" items="${utenteErrors }">
        	<ul>
				<li> ${errorItem }</li>	
			</ul>
      	</c:forEach>
	</div>


      	<form onsubmit ="return validateUtenteForm()" name="utenteForm" class="form-horizontal" action="${pageContext.request.contextPath}/admin/gestioneutenti/ExecuteModificaUtenteServlet" method="post">
      		<input class="form-control" type="hidden" id="idInputId" name="idInput" 
					value = "${utenteAttr.id}">
      		
      		<div class="form-group">
      			<label class="control-label col-sm-2" for="nomeInputId">Nome:</label>
	    		<div class="col-sm-4">
					<input class="form-control" type="text" id="nomeInputId" name="nomeInput" 
					value = "${utenteAttr.nome}">
			 	</div>
  			</div>
  			<div class="form-group">
      			<label class="control-label col-sm-2" for="cognomeInputId">Cognome:</label>
	    		<div class="col-sm-4">
					<input class="form-control" type="text" id="cognomeInputId" name="cognomeInput" 
					value = "${utenteAttr.cognome}">
			 	</div>
  			</div>
			<div class="form-group">
      			<label class="control-label col-sm-2" for="usernameInputId">Username:</label>
	    		<div class="col-sm-4">
					<input class="form-control" type="text" id="usernameInputId" name="usernameInput" 
					value = "${utenteAttr.username}">
			 	</div>
  			</div>
  			
  			<div class="form-group">
      			<label class="control-label col-sm-2" for="passwordInputId">Password:</label>
	    		<div class="col-sm-4">
					<input class="form-control" type="password" id="passwordInputId" name="passwordInput" 
					value = "${utenteAttr.password}">
			 	</div>
  			</div>
  			
  			<div class="form-group">
      			<label class="control-label col-sm-2" for="emailInputId">Email:</label>
	    		<div class="col-sm-4">
					<input class="form-control" type="text" id="emailInputId" name="emailInput" 
					value = "${utenteAttr.email}">
					<font color="red"><p id = "emailTextId"></p></font>
			 	</div>
  			</div>
  			
  			<input class="form-control" type="hidden" id="creditoResiduoOriginaleInputId" name="creditoResiduoOriginaleInput" 
					value = "${creditoResiduoOriginaleInput}">
  			
  			<div class="form-group">
      			<label class="control-label col-sm-2" for="creditoResiduoInputId">Credito Residuo (Attuale: ${creditoResiduoOriginaleInput} &euro;):</label>
	    		<div class="col-sm-4">
					<input class="form-control" type="number" step="0.01" id="creditoResiduoInputId" name="creditoResiduoInput" 
					value = "${utenteAttr.creditoResiduo == null? creditoResiduoOriginaleInput: utenteAttr.creditoResiduo}">
			 	</div>
  			</div>
  			
  			<div class="form-group">
      			<label class="control-label col-sm-2" for="statoInputId">Stato Utente:</label>
	    		<div class="col-sm-4">
					<select id="statoInputId" name ="statoInput">
  						<c:forEach var = "statoItem" items ="${statiListAttr}">
  							<option  value = "${statoItem}" ${statoItem == utenteAttr.stato?"selected='selected'":''} >${statoItem}</option>
  						</c:forEach>
  					</select>
			 	</div>
  			</div>
  			
  			
  			<div class="form-group">
      			<label class="control-label col-sm-2" for="ruoliInputId">Ruoli:</label>
	    		<div class="col-sm-4">
	    		
	    			<c:forEach var = "ruoloItem" items ="${ruoliListAttr}">
	    				<c:forEach var ="utenteRuoloItem" items ="${utenteAttr.ruoli}">
	    					<c:if test="${ruoloItem.id == utenteRuoloItem.id}">
	    						<c:set var = "check" value ="yes"/>
	    					</c:if>
	    				</c:forEach>
	    			
						<input <c:if test="${check =='yes'}">checked="checked"</c:if> type="checkbox" id="ruoloInputId" name="ruoloInput" value ="${ruoloItem.id}"> ${ruoloItem.descrizione} 
						
						<c:set var = "check" value ="no"/>
					</c:forEach>
			 	</div>
  			</div>
  			
  			
  			<div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		        <button type="submit" class="btn btn-primary btn-md">Conferma Modifiche</button>
		      </div>
		    </div>
		</form>
		
    </div><!-- /.container -->
    
    <%@ include file="../../footer.jsp"%>



</body>
</html>