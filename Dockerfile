FROM openjdk:8-jdk-alpine
#FROM maven:alpine
# cd /opt/app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]