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
        
                <h1>Ficha de Captação</h1>

        <form>
            
            Referencial<input type="text" name="ref"><br>
            CEP<input type="text" name="ref"><br>
            Endereço<input type="text" name="log"><br>
            Número<input type="number" name="num"><br>
            Complemento<input type="text" name="cop"><br>
            Bairro<input type="text" name="bai"><br>
            Cidade<input type="text" name="cid"><br>
            UF<input type="text" name="uf"><br><br>
            Quantidade de:<br><br>
            Dormitório(s): <input type="number" name="dor"><br> 
            Suíte(s): <input type="number" name="sui"><br> 
            Sala(s): <input type="number" name="sal"><br> 
            Banheiro(s): <input type="number" name="ban"><br> 
            Cozinha(s): <input type="number" name="coz"><br> 
            Quintal(is): <input type="number" name="qui"><br><br>
            Valor(R$)<input type="number" name="val"><br>
            <input type="submit" name=""><br>
            
        </form>
        
    </body>
</html>


