pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
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
