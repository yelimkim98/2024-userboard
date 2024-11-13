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
    }
}
