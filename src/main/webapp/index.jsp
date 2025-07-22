<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Calculadora de Volúmenes</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        .card-img-top {
            height: 150px;
            object-fit: contain;
        }
    </style>
</head>
<body class="container py-5">

<h1 class="mb-5 text-center text-primary">🧮 Calculadora de Volúmenes 3D</h1>

<div class="row">

    <!-- Cubo -->
    <div class="col-md-4 mb-4">
        <div class="card">
            <img src="images/cubo.png" class="card-img-top" alt="Cubo">
            <div class="card-body">
                <h5 class="card-title">Cubo</h5>
                <input type="number" id="ladoCubo" class="form-control mb-2" placeholder="Ingrese el lado">
                <button id="btnCubo" class="btn btn-primary w-100">Calcular</button>
                <p id="resultadoCubo" class="mt-2 text-success text-center"></p>
            </div>
        </div>
    </div>

    <!-- Esfera -->
    <div class="col-md-4 mb-4">
        <div class="card">
            <img src="images/esfera.jpeg" class="card-img-top" alt="Esfera">
            <div class="card-body">
                <h5 class="card-title">Esfera</h5>
                <input type="number" id="radioEsfera" class="form-control mb-2" placeholder="Ingrese el radio">
                <button id="btnEsfera" class="btn btn-primary w-100">Calcular</button>
                <p id="resultadoEsfera" class="mt-2 text-success text-center"></p>
            </div>
        </div>
    </div>

    <!-- Cilindro -->
    <div class="col-md-4 mb-4">
        <div class="card">
            <img src="images/cilindro.webp" class="card-img-top" alt="Cilindro">
            <div class="card-body">
                <h5 class="card-title">Cilindro</h5>
                <input type="number" id="radioCilindro" class="form-control mb-2" placeholder="Ingrese el radio">
                <input type="number" id="alturaCilindro" class="form-control mb-2" placeholder="Ingrese la altura">
                <button id="btnCilindro" class="btn btn-primary w-100">Calcular</button>
                <p id="resultadoCilindro" class="mt-2 text-success text-center"></p>
            </div>
        </div>
    </div>

</div>

<!-- jQuery -->
<script src="jq/jquery-3.3.1.min.js"></script>

<!-- Script de cálculo -->

<script>
    // Espera a que el DOM esté completamente cargado
    $(document).ready(function () {
        // URL base del servlet que realiza los cálculos
        const baseURL = "/Lab07/calcula";

        // Evento click para botón "Calcular Cubo"
        $("#btnCubo").click(function () {
            // Obtiene y limpia el valor del lado del cubo
            const lado = $("#ladoCubo").val().trim();

            // Valida que el campo no esté vacío
            if (!lado) {
                $("#resultadoCubo").text("Ingrese el lado del cubo.");
                return; // Sale si está vacío
            }

            // Realiza una petición GET al servlet enviando figura y lado
            $.get(baseURL, { figura: "cubo", lado: lado }, function (data) {
                // Muestra la respuesta (volumen) en el elemento resultadoCubo
                $("#resultadoCubo").text(data);

                // Limpia resultados de las otras figuras para evitar confusión
                $("#resultadoEsfera, #resultadoCilindro").text("");
            });
        });

        // Evento click para botón "Calcular Esfera"
        $("#btnEsfera").click(function () {
            // Obtiene y limpia el valor del radio de la esfera
            const radio = $("#radioEsfera").val().trim();

            // Valida que el campo no esté vacío
            if (!radio) {
                $("#resultadoEsfera").text("Ingrese el radio de la esfera.");
                return;
            }

            // Petición GET al servlet con figura y radio
            $.get(baseURL, { figura: "esfera", radio: radio }, function (data) {
                // Muestra el resultado en el elemento resultadoEsfera
                $("#resultadoEsfera").text(data);

                // Limpia otros resultados
                $("#resultadoCubo, #resultadoCilindro").text("");
            });
        });

        // Evento click para botón "Calcular Cilindro"
        $("#btnCilindro").click(function () {
            // Obtiene y limpia valores de radio y altura
            const radio = $("#radioCilindro").val().trim();
            const altura = $("#alturaCilindro").val().trim();

            // Valida que ambos campos estén completos
            if (!radio || !altura) {
                $("#resultadoCilindro").text("Completa ambos campos.");
                return;
            }

            // Petición GET al servlet con figura, radio y altura
            $.get(baseURL, { figura: "cilindro", radio: radio, altura: altura }, function (data) {
                // Muestra el resultado en resultadoCilindro
                $("#resultadoCilindro").text(data);

                // Limpia resultados de otras figuras
                $("#resultadoCubo, #resultadoEsfera").text("");
            });
        });
    });
</script>



</body>
</html>
