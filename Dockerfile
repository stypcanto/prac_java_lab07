FROM tomcat:10.1-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/Lab07.war /usr/local/tomcat/webapps/ROOT.war
