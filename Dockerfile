#Use an official Maven image to build the Spring Boot app
FROM maven:3.8.4-openjdk-17 AS build

#Set the workign directory
WORKDIR /app

# Copy the pom.xml and install dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and build the application
COPY src ./src
RUN mvn clean package -DskipTests

#Use and official OpenJDK image to run the application
FROM openjdk:17-jdk-slim

#Set the workign directory
WORKDIR /app

#Copy the built JAR file from the build stage
 COPY --from=build /app/target/deployment-0.0.1-SNAPSHOT.jar .

 #Expose Port 8080
 EXPOSE 8080

#Specify the command to run the application
ENTRYPOINT ["java", "-jar", "/app/deployment-0.0.1-SNAPSHOT.jar"]
