# Stage 1: build
FROM maven:3.8.6-eclipse-temurin-8 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests -B

# Stage 2: runtime
FROM eclipse-temurin:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/Blockchain-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
