FROM maven:3.8.6-openjdk-8-slim AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package -DskipTests

FROM openjdk:8-jre-alpine
ENV PORT=9009
EXPOSE 9009
LABEL maintainer="github.com/wyx176"
COPY --from=builder /app/target/JrebelLicenseServer.jar /opt/jrebel.jar
CMD ["sh", "-c", "exec java -jar /opt/jrebel.jar -p \"${PORT}\""]