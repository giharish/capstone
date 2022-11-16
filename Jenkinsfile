#!groovy
pipeline {
	agent none
  stages {
    stage('Build Application') {
      agent {
      	docker {
        	image 'maven:3.8.3-openjdk-17'
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
    stage('Build Image into a Docker Image') {
      agent {label 'dockernode'}
      steps {
      	sh 'docker build -t girish040583/capstone:latest .'
      }
    }
    stage('Image Push to Artifactory') {
      agent {label 'dockernode'}
      steps {
      	withCredentials([usernamePassword(credentialsId: 'docker_id', passwordVariable: 'docker_idPassword', usernameVariable: 'docker_idUser')]) {
        	sh "docker login -u ${env.docker_idUser} -p ${env.docker_idPassword}"
          sh 'docker push girish040583/capstone:latest'
        }
      }
    }
    stage('Deploy Image as Docker Container') {
      agent {label 'dockernode'}
      steps {
      	sh 'docker run -d -p 8081:8080 girish040583/capstone:latest'
      }
    }
  }
}
