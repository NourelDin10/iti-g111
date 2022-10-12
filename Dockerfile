FROM maven:3.6.0-jdk-11-slim As maven
MAINTAINER noureldin
COPY /src /app/src
COPY pom.xml /app/pom.xml 
WORKDIR /app
RUN mvn -f /app/pom.xml clean install

FROM openjdk:11-jre-slim
WORKDIR mvn-pro
COPY --from=maven app/target/iti-g106-1.0.0.jar /mvn-pro/mymavn-project.jar
EXPOSE 8000
ENTRYPOINT ["java","-jar", "/mvn-pro/mymavn-project.jar"]

