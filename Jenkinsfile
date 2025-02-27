pipeline {
    agent any

    stages {
        // stage('Check Style') {
        //     steps {
        //         sh 'npm run lint' // Nếu dùng Java thì thay bằng checkstyle
        //     }
        // }
        stage('Run Tests') {
            steps {
                sh 'npm run test' // Hoặc `mvn test` nếu là Java
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build' // Hoặc `mvn package`
            }
        }
    }

    post {
        failure {
            script {
                error("Pipeline failed! Blocking merge request.")
            }
        }
    }
}
