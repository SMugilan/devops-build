pipeline {
    agent any

    environment {
        IMAGE_NAME = "mugil1911/react-app"
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
                    // Use BRANCH_NAME or default to 'dev' if null/empty
                    def branch = env.BRANCH_NAME ?: 'dev'
                    def imageTag

                    if (branch == 'dev') {
                        imageTag = "dev"
                    } else if (branch == 'master') {
                        imageTag = "prod"
                    } else {
                        error("Branch ${branch} not supported")
                    }
                    env.IMAGE_TAG = imageTag  // set IMAGE_TAG for later stages
                    
                    echo "Building Docker image with tag: ${imageTag}"
                }
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Docker Login and Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                        echo \$PASSWORD | docker login -u \$USERNAME --password-stdin
                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }
    }
}
