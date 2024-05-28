<%-- 
    Document   : user
    Created on : 14 de mai. de 2024, 14:56:56
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>L.A.Rosa imóveis - Cadastro</title>
        <%@include file="WEB-INF/jspf/html-head-libs.jspf"%>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <%@include file="WEB-INF/jspf/html-body-libs.jspf" %>
     <div class="container mt-4">
        <h1 class="text-center">Cadastro de Imóveis</h1>
        <form action="ImovelServlet" method="post">
            <div class="form-group">
                <label for="tipo">Tipo de Imóvel:</label><br>
                
                <!-- radios -->
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="tipo" id="casa" value="Casa">
                    <label class="form-check-label" for="casa">Casa</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="tipo" id="apto" value="Apto">
                    <label class="form-check-label" for="apto">Apartamento</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="tipo" id="terreno" value="Terreno">
                    <label class="form-check-label" for="terreno">Terreno</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="tipo" id="comercial" value="Comercial">
                    <label class="form-check-label" for="comercial">Comercial</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="tipo" id="kitnet" value="Kitnet">
                    <label class="form-check-label" for="kitnet">Kitnet</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="tipo" id="outro" value="Outro">
                    <label class="form-check-label" for="outro">Outro</label>
                </div>
                <!-- caixas de texto -->
                <div class="form-group">
                    <br>
                    <input type="text" class="form-control" id="referencial" name="referencial" placeholder="Referencial">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="cep" name="cep" placeholder="CEP">
                </div>
            </div>
            <div class="form-group">
                <input type="number" class="form-control" id="dormitorios" name="dormitorios" placeholder="Dormitórios">
            </div>
            <div class="form-group">
                <input type="number" class="form-control" id="suite" name="suite" placeholder="Suíte">
            </div>
            <div class="form-group">
                <input type="number" class="form-control" id="sala" name="sala" placeholder="Sala">
            </div>
            <div class="form-group">
                <input type="number" class="form-control" id="banheiro" name="banheiro" placeholder="Sala">
            </div>
            <div class="form-group">
		<input type="number" class="form-control" id="cozinha" name="cozinha" placeholder="Cozinha">
	    </div>
	    <div class="form-group">
		<input type="number" class="form-control" id="quintal" name="quintal" placeholder="Quintal">
		</div>
	    <div class="form-group">
		<input type="number" class="form-control" id="valor" name="valor" placeholder="Valor do Imóvel">
	    </div>
		<button type="submit" class="btn btn-primary">Salvar</button>
	</form>
    </div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>


