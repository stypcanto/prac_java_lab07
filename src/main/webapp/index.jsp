<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Calculadora de Volúmenes 3D</title>
    <link rel="stylesheet" href="css/styles.css"/>
    <!-- jQuery -->
    <script src="jq/jquery-3.3.1.min.js"></script>
</head>
<body>

<h1>🧮 Calculadora de Volúmenes 3D</h1>
<p class="intro">
    Ingresa los valores correspondientes a cada figura geométrica y presiona "Calcular Volumen".
    Obtendrás el volumen con precisión y en formato amigable.
</p>

<div class="container">

    <!-- Cubo -->
    <div class="card">
        <img src="images/cubo.png" alt="Cubo" />
        <h2>Cubo</h2>
        <label for="ladoCubo">Lado (unidades):</label>
        <input type="number" id="ladoCubo" min="0" step="any" placeholder="Ej: 40" />
        <div id="errorCubo" class="error-msg"></div>
        <button id="btnCubo">Calcular Volumen</button>
        <p id="resultadoCubo" class="success-msg"></p>
    </div>

    <!-- Esfera -->
    <div class="card">
        <img src="images/esfera.jpeg" alt="Esfera" />
        <h2>Esfera</h2>
        <label for="radioEsfera">Radio (unidades):</label>
        <input type="number" id="radioEsfera" min="0" step="any" placeholder="Ej: 40" />
        <div id="errorEsfera" class="error-msg"></div>
        <button id="btnEsfera">Calcular Volumen</button>
        <p id="resultadoEsfera" class="success-msg"></p>
    </div>

    <!-- Cilindro -->
    <div class="card">
        <img src="images/cilindro.webp" alt="Cilindro" />
        <h2>Cilindro</h2>
        <label for="radioCilindro">Radio (unidades):</label>
        <input type="number" id="radioCilindro" min="0" step="any" placeholder="Ej: 10" />
        <label for="alturaCilindro">Altura (unidades):</label>
        <input type="number" id="alturaCilindro" min="0" step="any" placeholder="Ej: 20" />
        <div id="errorCilindro" class="error-msg"></div>
        <button id="btnCilindro">Calcular Volumen</button>
        <p id="resultadoCilindro" class="success-msg"></p>
    </div>

</div>



<script>
    $(function () {
        const baseURL = "/Lab07/calcula";

        function resetMessagesAndStyles(inputSelector, errorSelector, resultSelector) {
            $(errorSelector).hide().text("");
            $(resultSelector).text("");
            $(inputSelector).removeClass("input-error");
        }

        function showError(inputSelector, errorSelector, message) {
            $(errorSelector).show().text(message);
            $(inputSelector).addClass("input-error").focus();
        }

        // Cubo
        $("#btnCubo").click(function () {
            resetMessagesAndStyles("#ladoCubo", "#errorCubo", "#resultadoCubo");
            const lado = $("#ladoCubo").val().trim();

            if (!lado || parseFloat(lado) <= 0) {
                showError("#ladoCubo", "#errorCubo", "Por favor ingresa un lado válido (> 0).");
                return;
            }

            $.get(baseURL, { figura: "cubo", lado: lado }, function (data) {
                $("#resultadoCubo").text(data);
            }).fail(function () {
                showError("#ladoCubo", "#errorCubo", "Error en la comunicación con el servidor.");
            });
        });

        // Esfera
        $("#btnEsfera").click(function () {
            resetMessagesAndStyles("#radioEsfera", "#errorEsfera", "#resultadoEsfera");
            const radio = $("#radioEsfera").val().trim();

            if (!radio || parseFloat(radio) <= 0) {
                showError("#radioEsfera", "#errorEsfera", "Por favor ingresa un radio válido (> 0).");
                return;
            }

            $.get(baseURL, { figura: "esfera", radio: radio }, function (data) {
                $("#resultadoEsfera").text(data);
            }).fail(function () {
                showError("#radioEsfera", "#errorEsfera", "Error en la comunicación con el servidor.");
            });
        });

        // Cilindro
        $("#btnCilindro").click(function () {
            resetMessagesAndStyles("#radioCilindro", "#errorCilindro", "#resultadoCilindro");
            resetMessagesAndStyles("#alturaCilindro", "#errorCilindro", "#resultadoCilindro");

            const radio = $("#radioCilindro").val().trim();
            const altura = $("#alturaCilindro").val().trim();

            if (!radio || parseFloat(radio) <= 0) {
                showError("#radioCilindro", "#errorCilindro", "Por favor ingresa un radio válido (> 0).");
                return;
            }

            if (!altura || parseFloat(altura) <= 0) {
                showError("#alturaCilindro", "#errorCilindro", "Por favor ingresa una altura válida (> 0).");
                return;
            }

            $.get(baseURL, { figura: "cilindro", radio: radio, altura: altura }, function (data) {
                $("#resultadoCilindro").text(data);
            }).fail(function () {
                showError("#radioCilindro", "#errorCilindro", "Error en la comunicación con el servidor.");
            });
        });
    });
</script>

</body>
</html>
