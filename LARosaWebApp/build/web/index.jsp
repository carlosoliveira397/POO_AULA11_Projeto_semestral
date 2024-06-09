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
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
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
        <script>
            async function request(url = "", methd, data) {
                const response = await fetch(url, {
                    method: methd,
                    headers: {"Content-Type": "application/json", },
                    body: JSON.stringify(data)
                });
                return response.json();
            }
            
            function tasks() {
                return {
                    newTaskTitle: '',
                    list: [],
                    async loadTasks() {
                        request("/LARosaWebApp/api/imovel", "GET").then((data) => {
                            this.list = data.list;
                        });
                    }, async addTask() {
                        request("/LARosaWebApp/api/imovel", "POST", { title: this.newTaskTitle }).then((data) => {
                            this.newTaskTitle = '';
                            this.list = data.list;
                        });
                    }, async removeTask(taskTitle) {
                        request("/LARosaWebApp/api/imovel?id="+taskTitle, "DELETE").then((data) => {
                            this.list = data.list
                        });
                    }
                }
            } 
        </script>
        <div class="opacity-overlay"></div>
        <div class="content">
            <%@include file="WEB-INF/jspf/navbar.jspf" %>
            <%@include file="WEB-INF/jspf/html-body-libs.jspf" %>
                <br>
                <div class="container-fluid m-2" x-data="tasks()" x-init="loadTasks()">
                <ul class="list-group list-group-flush">       
                    <table class="table">
                        <thead>
                            <tr>
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
                            <template x-for="task in list">
                            <tr>
                                <td><span x-text="task.cd_imovel"></span></td>
                                <td><span x-text="task.qt_sala_imovel"></span></td>
                                <td><span x-text="task.qt_dormitorio_imovel"></span></td>
                                <td><span x-text="task.qt_banheiro_imovel"></span></td>
                                <td><span x-text="task.qt_cozinha_imovel"></span></td>
                                <td><span x-text="task.qt_suite_imovel"></span></td>
                                <td><span x-text="task.qt_quintal_imovel"></span></td>
                                <td><span x-text="task.vl_imovel"></span></td>
                                <td>
                                    <button type="button" class="btn btn-outline-info">Editar</button>
                                    <button type="button" class="btn btn-outline-danger">Deletar</button>
                                </td>                        
                            </tr>
                            </template>
                        </tbody>
                    </table>
                </ul>
            </div>  
        </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>