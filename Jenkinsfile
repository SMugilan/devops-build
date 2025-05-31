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
                    // Set tag based on branch
                    if (env.BRANCH_NAME == 'dev') {
                        env.IMAGE_TAG = "dev"
                    } else if (env.BRANCH_NAME == 'master') {
                        env.IMAGE_TAG = "prod"
                    } else {
                        error("Branch ${env.BRANCH_NAME} not supported")
                    }
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
