pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-cred-id')  // Replace with your actual Jenkins credential ID
        DOCKER_IMAGE_NAME = "mugil1911/react-app"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def branchName = env.GIT_BRANCH?.replaceAll('origin/', '') ?: 'dev'
                    def imageTag = branchName == 'master' ? 'prod' : 'dev'
                    docker.build("${DOCKER_IMAGE_NAME}:${imageTag}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    def branchName = env.GIT_BRANCH?.replaceAll('origin/', '') ?: 'dev'
                    def imageTag = branchName == 'master' ? 'prod' : 'dev'
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        docker.image("${DOCKER_IMAGE_NAME}:${imageTag}").push()
                    }
                }
            }
        }
        // Optional stage('Deploy') if needed
    }
}
