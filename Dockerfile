# Build stage
FROM maven:3.6.0-jdk-11-slim AS build-stage
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean install

#caching the test reports for junit
VOLUME **/target/surefire-reports/TEST-*.xml

# Package stage
FROM openjdk:11-jre-slim
COPY --from=build-stage /home/app/target/*.jar /usr/local/lib/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]