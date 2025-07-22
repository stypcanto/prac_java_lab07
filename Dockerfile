# Usa una imagen oficial de Tomcat
FROM tomcat:10.1-jdk17

# Elimina la aplicación por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia tu archivo .war al contenedor (asumiendo que ya lo compilaste)
COPY target/Lab07.war /usr/local/tomcat/webapps/Lab07.war

# Exponer el puerto (por defecto)
EXPOSE 8080
