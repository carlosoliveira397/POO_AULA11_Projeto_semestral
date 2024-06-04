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
            table{
                background-color: #FFFFFF !important;
                border: 4px solid #D3BB0C! important;
                text-align: center;
            }
        </style>
    </head>
    <body>

        <div class="opacity-overlay"></div>
        <div class="content">
            <%@include file="WEB-INF/jspf/header.jspf" %>
            <%@include file="WEB-INF/jspf/navbar.jspf" %>
            <%@include file="WEB-INF/jspf/html-body-libs.jspf" %>
            <div id="app" class="container-fluid m-1">
                <br>
                <ul class="list-group list-group-flush">       
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">REF</th>
                                <th scope="col">CEP</th>
                                <th scope="col">DORMITÓRIOS</th>
                                <th scope="col">SUÍTE</th>
                                <th scope="col">SALA</th>
                                <th scope="col">BANHEIRO</th>
                                <th scope="col">COZINHA</th>
                                <th scope="col">QUINTAL</th>
                                <th class="text-end" scope="col">VALOR</th>
                                <th scope="col">EDITAR/DELETAR</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1.000</td>
                                <td>
                                    <button type="button" class="btn btn-outline-info">Editar</button>
                                    <button type="button" class="btn btn-outline-danger">Deletar</button>
                                </td>                        
                            </tr>
                        </tbody>
                    </table>
                </ul>
            </div>   
        </div>   
    </body>
</html>