#!groovy
pipeline {
	agent none
  stages {
    stage('Maven Install') {
      agent {
      	docker {
        	image 'maven:3.8.3-openjdk-17'
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      agent {label 'dockernode'}
      steps {
      	sh 'docker build -t girish040583/capstone:latest .'
      }
    }
    stage('Docker Push') {
      agent {label 'dockernode'}
      steps {
      	withCredentials([usernamePassword(credentialsId: 'docker_id', passwordVariable: 'docker_idPassword', usernameVariable: 'docker_idUser')]) {
        	sh "docker login -u ${env.docker_idUser} -p ${env.docker_idPassword}"
          sh 'docker push girish040583/capstone:latest'
        }
      }
    }
  }
}
