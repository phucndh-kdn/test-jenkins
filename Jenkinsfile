// pipeline {
//     agent any
//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }
//         stage('Install') {
//             steps {
//                 bat 'npm install'
//             }
//         }
//         stage('Run lint') {
//             steps {
//                 bat 'npm run lint'
//             }
//         }
//         stage('Build') {
//             steps {
//                 bat 'npm run build'
//             }
//         }
//     }
// }

pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'my-angular-app'
        DOCKER_TAG = 'latest'
        DOCKER_PORT = '8081'  // Chạy trên port 8081
    }
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
        stage('Build & Run Docker') {
            when {
                branch 'main' 
            }
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    bat "docker stop angular-container || exit 0"
                    bat "docker rm angular-container || exit 0"
                    bat "docker run -d -p ${DOCKER_PORT}:8081 --name angular-container ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }
    post {
        always {
            script {
                bat "docker ps"
            }
        }
    }
}
