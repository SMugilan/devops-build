pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('9fe68088-4a7f-4a26-9f7e-8ced8bee4232')  
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
