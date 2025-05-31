pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mugil1911/react-app:dev .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub-credentials-id', url: '') {
                    sh 'docker push mugil1911/react-app:dev'
                }
            }
        }
    }
}
