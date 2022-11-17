FROM openjdk:17-alpine
LABEL maintainer="giharish@gmail.com"
COPY /target/capstone.jar /home/capstone.jar
CMD ["java", "-jar", "/home/capstone.jar"]
CMD ["tail", "-f", "/dev/null"]
