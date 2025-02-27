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
        success {
            script {
                step([$class: 'GitHubCommitStatusSetter', 
                    context: 'Jenkins CI',
                    statusResultSource: 'auto',
                    statusBackref: env.BUILD_URL,
                    description: 'Pipeline completed successfully'
                ])
            }
        }

        failure {
            script {
                step([$class: 'GitHubCommitStatusSetter', 
                    context: 'Jenkins CI',
                    statusResultSource: 'auto',
                    statusBackref: env.BUILD_URL,
                    description: 'Pipeline failed! Blocking merge request.'
                ])
                error("Pipeline failed! Blocking merge request.")
            }
        }
    }
}