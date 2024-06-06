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
        <title>L.A.Rosa imóveis - Cadastro</title>
        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <style>
            .radio-buttons-container {
                display: flex;
                align-items: center;
                gap: 24px;
                flex-wrap: wrap;
            }
            .radio-button {
                display: inline-block;
                position: relative;
                cursor: pointer;
            }
            .radio-button__input {
                position: absolute;
                opacity: 0;
                width: 0;
                height: 0;
            }
            .radio-button__label {
                display: inline-block;
                padding-left: 30px;
                margin-bottom: 10px;
                position: relative;
                font-size: 16px;
                color: #FFFFFF;
                cursor: pointer;
                transition: all 0.3s cubic-bezier(0.23, 1, 0.320, 1);
            }
            .radio-button__custom {
                position: absolute;
                top: 50%;
                left: 0;
                transform: translateY(-50%);
                width: 20px;
                height: 20px;
                border-radius: 50%;
                border: 2px solid #FFFFFF;
                transition: all 0.3s cubic-bezier(0.23, 1, 0.320, 1);
            }
            .radio-button__input:checked + .radio-button__label .radio-button__custom {
                transform: translateY(-50%) scale(0.9);
                border: 5px solid #FFE88A;
                color: #FFE88A;
            }
            .radio-button__input:checked + .radio-button__label {
                color: #FFE88A;
            }
            .radio-button__label:hover .radio-button__custom {
                transform: translateY(-50%) scale(1.2);
                border-color: #FFE88A;
                box-shadow: 0 0 10px #FFE88A80;
            }
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
        <div class="opacity-overlay"></div>
        <div class="content">
            <%@include file="WEB-INF/jspf/navbar.jspf"%><br>
            <%@include file="WEB-INF/jspf/html-body-libs.jspf" %>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1 class="text-center">Cadastro de Imóveis</h1><br>
                    <form id="imovelForm" action="ImovelServlet" method="post" class="needs-validation" novalidate>
                        <div class="form-group">

                            <div class="radio-buttons-container">
                                <label for="tipo">Tipo de Imóvel:</label>
                                <div class="radio-button">
                                    <input name="tipo" id="radio_casa" class="radio-button__input" type="radio" value="Casa" required>
                                    <label for="radio_casa" class="radio-button__label">
                                        <span class="radio-button__custom"></span>
                                        Casa
                                    </label>
                                </div>
                                <div class="radio-button">
                                    <input name="tipo" id="radio_apartamento" class="radio-button__input" type="radio" value="Apartamento">
                                    <label for="radio_apartamento" class="radio-button__label">
                                        <span class="radio-button__custom"></span>
                                        Apartamento
                                    </label>
                                </div>
                                <div class="radio-button">
                                    <input name="tipo" id="radio_terreno" class="radio-button__input" type="radio" value="Terreno">
                                    <label for="radio_terreno" class="radio-button__label">
                                        <span class="radio-button__custom"></span>
                                        Terreno
                                    </label>
                                </div>
                                <div class="radio-button">
                                    <input name="tipo" id="radio_comercial" class="radio-button__input" type="radio" value="Comercial">
                                    <label for="radio_comercial" class="radio-button__label">
                                        <span class="radio-button__custom"></span>
                                        Comercial
                                    </label>
                                </div>
                                <div class="radio-button">
                                    <input name="tipo" id="radio_outro" class="radio-button__input" type="radio" value="Outro">
                                    <label for="radio_outro" class="radio-button__label">
                                        <span class="radio-button__custom"></span>
                                        Outro
                                    </label>

                                </div>
                            </div>

                            <div class="form-group">
                                <hr>
                                <input type="text" class="form-control" id="referencial" name="referencial" placeholder="Referencial" required>
                                <div class="invalid-feedback">Por favor, insira o Referencial do imóvel.</div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="cep" name="cep" placeholder="CEP" required>
                                <div class="invalid-feedback">Por favor, insira o CEP do imóvel.</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="dormitorios" name="dormitorios" placeholder="Dormitórios" required>
                            <div class="invalid-feedback">Por favor, insira o número de dormitórios.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="suite" name="suite" placeholder="Suíte" required>
                            <div class="invalid-feedback">Por favor, insira o número de suítes.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="sala" name="sala" placeholder="Sala" required>
                            <div class="invalid-feedback">Por favor, insira o número de salas.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="banheiro" name="banheiro" placeholder="Banheiro" required>
                            <div class="invalid-feedback">Por favor, insira o número de banheiros.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="cozinha" name="cozinha" placeholder="Cozinha" required>
                            <div class="invalid-feedback">Por favor, insira o número de cozinhas.</div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="quintal" name="quintal" placeholder="Quintal" required>
                            <div class="invalid-feedback">Por favor, insira informações sobre o quintal.</div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="valor" name="valor" placeholder="Valor do Imóvel" required>
                            <div class="invalid-feedback">Por favor, insira o valor do imóvel.</div>
                        </div>

                        <div class="row justify-content-center">
                            <div class="d-grid gap-2"> 
                                <button>
                                    <span class="shadow"></span>
                                    <span class="edge"></span>
                                    <span class="front text"> Salvar
                                    </span>
                                </button>
                            </div>   
                        </div>   
                    </form>
                </div>
            </div>
        </div>
        <script>
            const app = Vue.createApp({
                imovel() {
                    return {
                        error: null,
                        newCodigo: '',
                        newSala: 0,
                        newDormitorio: 0,
                        newBanheiro: 0,
                        newCozinha: 0,
                        newSuite: 0,
                        newQuintal: 0,
                        newValor: 0.0,
                    };
                },
                methods: {
                    async request(url = "", method, imovel) {
                        try {
                            const response = await fetch(url, {
                                method: method,
                                headers: {"Content-Type": "application/json"},
                                body: JSON.stringify(imovel)
                            });
                            if (response.status == 200) {
                                return response.json();
                            } else {
                                this.error = response.statusText;
                            }
                        } catch (e) {
                            this.error = e;
                            return null;
                    }
                    },

                    async addImovel() {
                        const data = await this.request("/LARosaWebApp/api/imovel", "POST", {cd_imovel: this.newCodigo, qt_sala_imovel: this.newSala, qt_dormitorio_imovel: this.newDormitorio, qt_banheiro_imovel: this.newBanheiro, qt_cozinha_imovel: this.newCozinha, qt_suite_imovel: this.newSuite, qt_quintal_imovel: this.newQuintal, vl_imovel: this.newValor});
                        if (imovel) {
                            this.newCodigo = '';
                            this.newSala = 0;
                            this.newDormitorio = 0;
                            this.newBanheiro = 0;
                            this.newCozinha = 0;
                            this.newSuite = 0;
                            this.newQuintal = 0;
                            this.newValor = 0.0;
                            await this.loadList();
                        }
                    },

                },
                mounted() {
                    this.loadList();
                }
            });
            app.mount('#app');
        </script>
        <script>
            (function () {
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
                });
        </script>
    </body>
</html>


