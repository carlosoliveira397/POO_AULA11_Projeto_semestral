<%-- 
    Document   : testescombanco
    Created on : 9 de jun. de 2024, 15:34:27
    Author     : BlankSkyes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <h1 x-data="{ message: 'I ❤️ Alpine' }" x-text="message"></h1>
        
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
            /*async function request(url = "", methd, data) {
                const response = await fetch(url, {
                    method: methd,
                    headers: {"Content-Type": "application/json"},
                    body: JSON.stringify(data)
                });
                return response.json();
            }
            request("http://localhost:8080/LARosaWebApp/api/imovel", "GET").then((data) => {
                document.write("<h2>Tentativa de GET</h2><br>");
                document.write(JSON.stringify(data));
            });
            request("http://localhost:8080/LARosaWebApp/api/imovel", "POST", {cd_imovel: "SegundaBatata", qt_sala_imovel: 1, qt_dormitorio_imovel: 2, qt_banheiro_imovel: 3, qt_cozinha_imovel: 4, qt_suite_imovel: 5, qt_quintal_imovel: 6, vl_imovel: 7000}).then((data) => {
                document.write("<h2>Tentativa de POST</h2><br>");
                document.write(JSON.stringify(data));
            });
            request("http://localhost:8080/LARosaWebApp/api/imovel", "GET").then((data) => {
                document.write("<h2>Segunda Tentativa de GET</h2><br>");
                document.write(JSON.stringify(data));
            });
            request("http://localhost:8080/LARosaWebApp/api/imovel?id=1", "DELETE").then((data) => {
                document.write("<h2>Tentativa de DELETE</h2><br>");
                document.write(JSON.stringify(data));
            });
            request("http://localhost:8080/LARosaWebApp/api/imovel", "GET").then((data) => {
                document.write("<h2>Terceira Tentativa de GET</h2><br>");
                document.write(JSON.stringify(data));
            });
*/
        </script>
         <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 h1">MyTasks</span>
            </div>
        </nav>
        
        <div class="container-fluid m-2" x-data="tasks()" x-init="loadTasks()">
            <div class="input-group mb-3">
                <input type="text" class="form-control" x-model="newTaskTitle" placeholder="New task">
                <button class="btn btn-primary" type="button" x-on:click="addTask()">+</button>
            </div>
            
            <table class="table">
                <template x-for="task in list">
                    <tr>
                        <td>
                            <button type="button" x-on:click="removeTask(task.title)" class="btn btn-danger btn-sm">✓ Done</button>
                            <span x-text="task.rowid"></span>
                            <span x-text="task.cd_imovel"></span>
                            <span x-text="task.qt_sala_imovel"></span>
                            <span x-text="task.qt_dormitorio_imovel"></span>
                            <span x-text="task.qt_banheiro_imovel"></span>
                            <span x-text="task.qt_cozinha_imovel"></span>
                            <span x-text="task.qt_suite_imovel"></span>
                            <span x-text="task.qt_quintal_imovel"></span>
                            <span x-text="task.vl_imovel"></span>
                        </td>
                    </tr>
                </template>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
    
</html>
