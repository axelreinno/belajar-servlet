FROM maven:3.9.9-eclipse-temurin-23-alpine as build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package

FROM tomcat:9.0.102-jdk8-corretto-al2

COPY --from=build /app/target/belajar-servlet.war /usr/local/tomcat/webapps/belajar-servlet.war

EXPOSE 8080

CMD ["catalina.sh", "run"]