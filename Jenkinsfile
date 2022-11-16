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
  }
}
