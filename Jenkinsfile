pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/phucndh-kdn/test-jenkins.git'
            }
        }

        // stage('Code Check') {
        //     steps {
        //         sh 'npm run lint'
        //     }
        // }

        stage('Run Tests') {
            steps {
                sh 'npm run test'
            }
        }
    }

    post {
        failure {
            script {
                if (env.BRANCH_NAME.startsWith("PR-")) {
                    error("Pull request bị lỗi, không cho merge.")
                }
            }
        }
    }
}
