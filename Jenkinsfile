pipeline {
    agent any
    environment {
<<<<<<< HEAD
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-cred-id')  // Replace with your actual Jenkins credential ID
=======
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-cred-id') // 🔁 Replace with actual ID
>>>>>>> 974ec41 (Add Jenkins pipeline for Docker build & push)
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
<<<<<<< HEAD
                    def branchName = env.GIT_BRANCH?.replaceAll('origin/', '') ?: 'dev'
=======
                    def branchName = env.GIT_BRANCH.replaceAll('origin/', '')
>>>>>>> 974ec41 (Add Jenkins pipeline for Docker build & push)
                    def imageTag = branchName == 'master' ? 'prod' : 'dev'
                    docker.build("${DOCKER_IMAGE_NAME}:${imageTag}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
<<<<<<< HEAD
                    def branchName = env.GIT_BRANCH?.replaceAll('origin/', '') ?: 'dev'
=======
                    def branchName = env.GIT_BRANCH.replaceAll('origin/', '')
>>>>>>> 974ec41 (Add Jenkins pipeline for Docker build & push)
                    def imageTag = branchName == 'master' ? 'prod' : 'dev'
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        docker.image("${DOCKER_IMAGE_NAME}:${imageTag}").push()
                    }
                }
            }
        }
<<<<<<< HEAD
        // Optional stage('Deploy') if needed
=======
>>>>>>> 974ec41 (Add Jenkins pipeline for Docker build & push)
    }
}
