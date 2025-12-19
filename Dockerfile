
# Stage 1: Build the JAR file
FROM eclipse-temurin:17-jdk-jammy AS builder

# Set the working directory in the container
WORKDIR /app

# Install Maven (or Gradle if you are using it)
RUN apt-get update && apt-get install -y maven

# Copy the pom.xml and source code into the contcleaar ainer
COPY pom.xml /app/
COPY src /app/src/

# Build the JAR file (this will create the JAR in the target folder)
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM eclipse-temurin:17-jre-jammy AS runtime

# Set working directory in the runtime container
WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/target/*.jar /app/app.jar


# Expose the port your app will run on
EXPOSE 8080

# Command to run the app
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
