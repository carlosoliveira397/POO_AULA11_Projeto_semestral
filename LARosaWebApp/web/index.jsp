<%-- 
   Document   : index
   Created on : 13 de mai. de 2024, 23:02:46
   Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>L.A.Rosa imóveis</title>
        <%@include file="WEB-INF/jspf/html-head-libs.jspf"%>
        <style>
            body {
                background-image: url('https://hotelrouxinol.com.br/wp-content/uploads/2020/03/original-ebd6426cddff7653bef6599802b56e11.jpeg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
                margin: 0;
                padding: 0;
            }

            .opacity-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(100, 100, 100, 0.6); /* Ajuste para a opacidade desejada */
                z-index: 1;
            }

            .content {
                position: relative;
                z-index: 2;
            }
        </style>
    </head>
    <body>

        <div class="opacity-overlay"></div>
        <div class="content">
            <%@include file="WEB-INF/jspf/header.jspf" %>
            <%@include file="WEB-INF/jspf/navbar.jspf" %>
            <%@include file="WEB-INF/jspf/html-body-libs.jspf" %>
            <div id="app" class="container-fluid m-2">
            </div>   
        </div>   
    </body>
</html>