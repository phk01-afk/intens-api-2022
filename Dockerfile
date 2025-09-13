FROM eclipse-temurin:8-jre-alpine

WORKDIR /app

COPY target/*.jar intens-api.jar

EXPOSE 8080

ENV PORT=8080

ENTRYPOINT ["java", "-jar", "intens-api.jar"]
