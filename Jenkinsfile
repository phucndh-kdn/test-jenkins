pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }
        // stage('Run Tests') {
        //     steps {
        //         bat 'npm run test' // Hoặc `mvn test` nếu là Java
        //     }
        // }
        // stage('Build') {
        //     steps {
        //         bat 'npm run build' // Hoặc `mvn package`
        //     }
        // }
    }

    post {
        failure {
            script {
                error("Pipeline failed! Blocking merge request.")
            }
        }
    }
}
