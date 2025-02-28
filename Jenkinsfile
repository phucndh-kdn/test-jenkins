pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install') {
            steps {
                bat 'npm install'
            }
        }
        stage('Run lint') {
            steps {
                bat 'npm run lint'
            }
        }
        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }
    }
}

