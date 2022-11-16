FROM openjdk:17-alpine
LABEL maintainer="giharish@gmail.com"
COPY /home/capstone/workspace/capstone-pipeline/target/capstone-0.0.1-SNAPSHOT.j
ar /home/capstone-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "/home/capstone-0.0.1-SNAPSHOT.jar"]
