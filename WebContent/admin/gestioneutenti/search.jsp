<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Area Admin: Ricerca Utente</title>
</head>
<body>

<div class="container">

   <%@ include file="../../header.jsp" %>
   
      
    <div class="page-header">
	  <h3>Area Admin: Pagina di Ricerca Utente</h3>
	</div>
	
	<div class="alert alert-success ${messaggioConferma==null?'d-none':''}" role="alert">
	  ${messaggioConferma }
	</div>

      	<form class="form-horizontal" action="${pageContext.request.contextPath}/admin/gestioneutenti/ExecuteSearchUtenteServlet" method="post">
      		<div class="form-group">
      			<label class="control-label col-sm-2" for="nomeInputId">Nome:</label>
	    		<div class="col-sm-4">
					<input class="form-control" type="text" id="nomeInputId" name="nomeInput" >
			 	</div>
  			</div>
  			<div class="form-group">
      			<label class="control-label col-sm-2" for="cognomeInputId">Cognome:</label>
	    		<div class="col-sm-4">
					<input class="form-control" type="text" id="cognomeInputId" name="cognomeInput" >
			 	</div>
  			</div>
			<div class="form-group">
      			<label class="control-label col-sm-2" for="usernameInputId">Username:</label>
	    		<div class="col-sm-4">
					<input class="form-control" type="text" id="usernameInputId" name="usernameInput" >
			 	</div>
  			</div>
  			<div class="form-group">
      			<label class="control-label col-sm-2" for="emailInputId">Email:</label>
	    		<div class="col-sm-4">
					<input class="form-control" type="text" id="emailInputId" name="emailInput" >
			 	</div>
  			</div>
  			<div class="form-group">
      			<label class="control-label col-sm-2" for="statoInputId">Stato Utente:</label>
	    		<div class="col-sm-4">
					<select id="statoInputId" name ="statoInput">
							<option></option>
  						<c:forEach var = "statoItem" items ="${statiListAttr}">
  							<option value = "${statoItem}" >${statoItem}</option>
  						</c:forEach>
  					</select>
			 	</div>
  			</div>
  			
  			
  			
  			
  			<div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		        <button type="submit" class="btn btn-primary btn-md">Effettua Ricerca</button>
		        <!-- Inserisci nuovo Utente -->
		        <a href="${pageContext.request.contextPath}/admin/gestioneutenti/PrepareInsertUtenteServlet" class="btn btn-primary btn-md">Inserisci Nuovo Utente</a>
		      </div>
		    </div>
		</form>
		
		
		
    </div><!-- /.container -->
    <%@ include file="../../footer.jsp"%>



</body>
</html>