pipeline {
    agent any

    environment {
        // DockerHub credentials ID stored in Jenkins Credentials Manager
        DOCKERHUB_CREDENTIALS = credentials('34c0f88d-9b29-4fb6-8ff1-6d0b06655843')  
        
        // Docker image name to build and push
        DOCKER_IMAGE_NAME = "mugil1911/react-app"
    }

    stages {

        stage('Checkout') {
            steps {
                // Pull code from the source control management (SCM) repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Get branch name from environment and strip 'origin/' if present
                    def branchName = env.GIT_BRANCH?.replaceAll('origin/', '') ?: 'dev'

                    // Use 'prod' tag for master branch, otherwise use 'dev'
                    def imageTag = branchName == 'master' ? 'prod' : 'dev'

                    // Build Docker image with the determined tag
                    docker.build("${DOCKER_IMAGE_NAME}:${imageTag}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Determine tag again to ensure consistent tagging for push
                    def branchName = env.GIT_BRANCH?.replaceAll('origin/', '') ?: 'dev'
                    def imageTag = branchName == 'master' ? 'prod' : 'dev'

                    // Push Docker image to DockerHub using stored credentials
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        docker.image("${DOCKER_IMAGE_NAME}:${imageTag}").push()
                    }
                }
            }
        }

        // Optional: Add a deploy stage here if needed in future
        // stage('Deploy') {
        //     steps {
        //         echo 'Deploying application...'
        //     }
        // }
    }
}
