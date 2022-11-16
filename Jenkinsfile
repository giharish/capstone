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
      	withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push girish040583r/capstone:latest'
      }
    }
  }
}
