<%-- 
    Document   : user
    Created on : 14 de mai. de 2024, 14:56:56
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/html-head-libs.jspf"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <title>L.A.Rosa imóveis - Cadastro</title>
        <style>
            button {
                position: relative;
                border: none;
                background: transparent;
                padding: 0;
                cursor: pointer;
                outline-offset: 4px;
                transition: filter 250ms;
                user-select: none;
                touch-action: manipulation;
            }

            .shadow {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                border-radius: 12px;
                background: hsl(0deg 0% 0% / 0.25);
                will-change: transform;
                transform: translateY(2px);
                transition: transform
                    600ms
                    cubic-bezier(.3, .7, .4, 1);
            }

            .edge {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                border-radius: 12px;
                background: linear-gradient(
                    to left,
                    hsl(45deg, 100%, 50%) 0%,
                    hsl(45deg, 100%, 70%) 8%,
                    hsl(45deg, 100%, 70%) 92%,
                    hsl(45deg, 100%, 90%) 100%
                    );
            }

            .front {
                display: block;
                position: relative;
                padding: 12px 27px;
                border-radius: 12px;
                font-size: 1.1rem;
                color: black;
                background: hsl(45deg, 100%, 70%);
                will-change: transform;
                transform: translateY(-4px);
                transition: transform
                    600ms
                    cubic-bezier(.3, .7, .4, 1);
            }

            button:hover {
                filter: brightness(115%);
            }

            button:hover .front {
                transform: translateY(-6px);
                transition: transform
                    250ms
                    cubic-bezier(.3, .7, .4, 1.5);
            }

            button:active .front {
                transform: translateY(-2px);
                transition: transform 34ms;
            }

            button:hover .shadow {
                transform: translateY(4px);
                transition: transform
                    250ms
                    cubic-bezier(.3, .7, .4, 1.5);
            }

            button:active .shadow {
                transform: translateY(1px);
                transition: transform 34ms;
            }

            button:focus:not(:focus-visible) {
                outline: none;
            }

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
            h1, label {
                color: #FFFFFF;
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
                    newCep: '',
                    newSala: '',
                    newDorm: '',
                    newBanh: '',
                    newCozi: '',
                    newSuite: '',
                    newQuintal: '',
                    newValor: '',
                    list: [],
                    async loadTasks() {
                        request("/LARosaWebApp/api/imovel", "GET").then((data) => {
                            this.list = data.list;
                        });
                    }, async addTask() {
                        request("/LARosaWebApp/api/imovel", "POST", {cd_imovel: this.newCep, qt_sala_imovel: this.newSala, qt_dormitorio_imovel: this.newDorm, qt_banheiro_imovel: this.newBanh, qt_cozinha_imovel: this.newCozi, qt_suite_imovel: this.newSuite, qt_quintal_imovel: this.newQuintal, vl_imovel: this.newValor}).then((data) => {
                            this.newTaskTitle = '';
                            this.newCep = '';
                            this.newSala = '';
                            this.newDorm = '';
                            this.newBanh = '';
                            this.newCozi = '';
                            this.newSuite = '';
                            this.newQuintal = '';
                            this.newValor = '';
                            this.list = data.list;
                        });
                    }, async removeTask(taskTitle) {
                        request("/LARosaWebApp/api/imovel?id="+taskTitle, "DELETE").then((data) => {
                            this.list = data.list;
                        });
                    }
                }
            } 
        </script>
        <div class="opacity-overlay"></div>
        <div class="content">
            <%@include file="WEB-INF/jspf/navbar.jspf"%><br>
            <%@include file="WEB-INF/jspf/html-body-libs.jspf" %>
            <div x-data="tasks()" x-init="loadTasks()">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1 class="text-center">Cadastro de Imóveis</h1><br>
                        <div class="form-group">
                            <input type="text" class="form-control" x-model="newCep" id="cep" placeholder="CEP" required>
                            <div class="invalid-feedback">Por favor, insira o CEP do imóvel.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" x-model="newDorm" id="dormitorios" placeholder="Dormitórios" required>
                            <div class="invalid-feedback">Por favor, insira o número de dormitórios.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" x-model="newSuite" id="suite"  placeholder="Suíte" required>
                            <div class="invalid-feedback">Por favor, insira o número de suítes.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" x-model="newSala" id="sala"  placeholder="Sala" required>
                            <div class="invalid-feedback">Por favor, insira o número de salas.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" x-model="newBanh" id="banheiro" placeholder="Banheiro" required>
                            <div class="invalid-feedback">Por favor, insira o número de banheiros.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" x-model="newCozi" id="cozinha"  placeholder="Cozinha" required>
                            <div class="invalid-feedback">Por favor, insira o número de cozinhas.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" x-model="newQuintal" id="quintal"  placeholder="Quintal" required>
                            <div class="invalid-feedback">Por favor, insira informações sobre o quintal.</div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" x-model="newValor" id="valor" placeholder="Valor do Imóvel" required>
                            <div class="invalid-feedback">Por favor, insira o valor do imóvel.</div>
                        </div>

                        <div class="row justify-content-center">
                            <div class="d-grid gap-2"> 
                                <button x-on:click="addTask()">
                                    <span class="shadow"></span>
                                    <span class="edge"></span>
                                    <span class="front text"> Salvar </span>
                                </button>
                            </div>   
                        </div>   
                </div>
            </div>
            </div>
        </div>
        <script>
           /* (function () {
                'use strict';
                window.addEventListener('load', function () {
                    var forms = document.getElementsByClassName('needs-validation');
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
            

            document.getElementById('cep').addEventListener('input', function (e) {
                let x = e.target.value.replace(/\D/g, '').match(/(\d{0,5})(\d{0,3})/);
                e.target.value = x[1] + (x[2] ? '-' + x[2] : '');
            });

            const naturalNumberFields = ['referencial', 'dormitorios', 'suite', 'sala', 'banheiro', 'cozinha', 'quintal'];
            naturalNumberFields.forEach(id => {
                document.getElementById(id).addEventListener('input', function (e) {
                    e.target.value = e.target.value.replace(/\D/g, '');
                });
            });

             document.getElementById('valor').addEventListener('input', function (e) {
                    let a = e.target.value.replace(/\D/g, '');
                    a = (a / 100).toFixed(2) + '';
                    a = a.replace(".", ",");
                    a = a.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
                    e.target.value = a;
                });*/
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>


