# Use official base images 
FROM openjdk:17-jdk-slim

# Set the working directory within the container
WORKDIR /usr/src/app

# Copy the project configuration file into the contaner
COPY pom.xml /app

# Copy the sourcecode into the container
COPY . ./

# Download all thhe required dependencies to run the maven build
RUN mvn -B dependency:resolve dependency:resolve-plugins

# Carry out a build for the application to generate a JAR file
RUN mvn clean install

#
ENTRYPOINT ["java", "-jar", "target/PAYPAL-WEB-APP.war"]

# Expose a port
EXPOSE 8080
