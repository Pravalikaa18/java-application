# Use OpenJDK as the base image
FROM openjdk:11

# Set the working directory inside the container
WORKDIR /app

# Copy Java source code to the container
COPY . /app

# Compile the Java program
RUN javac HelloWorld.java

# Set the command to run the Java program
CMD ["java", "HelloWorld"]
