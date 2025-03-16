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
        DOCKER_IMAGE = 'my-local-app'
        DOCKER_TAG = 'latest'
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
                branch 'main'  // Chỉ chạy khi merge vào main
            }
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    bat "docker stop my-app-container || exit 0"
                    bat "docker rm my-app-container || exit 0"
                    bat "docker run -d -p 8081:80 --name my-app-container ${DOCKER_IMAGE}:${DOCKER_TAG}"
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
