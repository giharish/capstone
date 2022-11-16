FROM openjdk:17-alpine
LABEL maintainer="giharish@gmail.com"
COPY /home/capstone/workspace/capstone-pipeline/target/capstone.jar /home/capstone.jar
CMD ["java", "-jar", "/home/capstone.jar"]
