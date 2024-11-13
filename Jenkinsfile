pipeline {
    agent any
    stages {
        stage("Permission") {
            steps {
                sh "chmod +x ./gradlew"
            }
        }
        stage("Test") {
            environment {
                RDS_PASSWORD = credentials('RDS_PASSWORD')
            }
            steps {
                sh "RDS_PASSWORD=${RDS_PASSWORD} ./gradlew test"
            }
        }
        stage("Gradle Build") {
            environment {
                RDS_PASSWORD = credentials('RDS_PASSWORD')
            }
            steps {
                sh "RDS_PASSWORD=${RDS_PASSWORD} ./gradlew clean build"
            }
        }
        stage("Docker Build") {
            steps {
                sh "docker build -t 2024-userboard ."
            }
        }
        stage("Push Image") {
            environment {
                DOCKER_HUB_TOKEN = credentials('docker_hub_test_credential')
                DOCKER_HUB_IMAGE_REPO = "kiel0103/2024-userboard"
                TAG = "1.0.${env.BUILD_ID}"
            }
            steps {
                sh "echo $DOCKER_HUB_TOKEN_PSW | docker login -u $DOCKER_HUB_TOKEN_USR --password-stdin"
                sh "docker tag 2024-userboard:latest $DOCKER_HUB_IMAGE_REPO:$TAG"
                sh "docker push $DOCKER_HUB_IMAGE_REPO:$TAG"
                sh "docker logout"
            }
        }
    }
}
