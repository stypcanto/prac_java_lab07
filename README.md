# 🧪 Calculadora de Volúmenes con Java Servlet

Este proyecto es una aplicación web simple desarrollada con **Java 17**, empaquetada como un archivo `.war` y desplegada en **Apache Tomcat 10** dentro de un contenedor **Docker**.

## 📦 Tecnologías utilizadas

- Java 17
- Maven
- Jakarta EE (Servlet 6.x)
- Tomcat 10.1
- Docker & Docker Compose

## 📄 Descripción

Este proyecto implementa una aplicación web sencilla que calcula el volumen de diferentes figuras geométricas: cubo, esfera y cilindro.

La lógica de cálculo se encuentra en un Servlet Java (`CalculaServlet`) que recibe peticiones HTTP GET con parámetros específicos.

Según la figura seleccionada (`cubo`, `esfera` o `cilindro`), el servlet procesa los datos (lado, radio, altura) y devuelve el volumen calculado como texto plano.

La interfaz web permite al usuario ingresar los valores correspondientes y muestra el resultado de forma dinámica mediante peticiones AJAX con jQuery.

## 🚀 Características

- Uso de tecnologías Java EE / Jakarta Servlet para el backend.
- Respuestas en formato texto plano para facilitar la integración con AJAX.
- Interfaz sencilla y funcional con Bootstrap y jQuery para una experiencia amigable.
- Cálculo preciso usando fórmulas matemáticas estándar para volúmenes geométricos.
- Manejo básico de validación en el frontend para evitar peticiones con datos vacíos.

## 📂 Estructura del Proyecto

- Código fuente Java en `src/main/java` con el servlet principal.
- Recursos web (CSS, imágenes, jQuery) en `src/main/webapp`.
- Archivo `index.jsp` como página principal.
- Configuración Maven para construir un archivo WAR desplegable en un servidor Tomcat.

