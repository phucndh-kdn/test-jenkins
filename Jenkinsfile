pipeline {
    agent any

    environment {
        BUILD_URL = "https://your-jenkins-url/job/${env.JOB_NAME}/${env.BUILD_NUMBER}/"
    }

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
                    statusResultSource: [ 
                        $class: 'DefaultCommitStatus'  // Sửa lại kiểu dữ liệu cho đúng
                    ],
                    statusBackref: env.BUILD_URL,
                    description: 'Pipeline completed successfully'
                ])
            }
        }

        failure {
            script {
                step([$class: 'GitHubCommitStatusSetter', 
                    context: 'Jenkins CI',
                    statusResultSource: [ 
                        $class: 'DefaultCommitStatus'
                    ],
                    statusBackref: env.BUILD_URL,
                    description: 'Pipeline failed! Blocking merge request.'
                ])
                error("Pipeline failed! Blocking merge request.")
            }
        }
    }
}
