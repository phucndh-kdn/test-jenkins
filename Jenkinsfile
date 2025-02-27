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
        //         script {
        //             try {
        //                 bat 'npm run test'
        //                 githubNotify context: 'Jenkins CI', status: 'SUCCESS', description: 'Tests passed'
        //             } catch (Exception e) {
        //                 githubNotify context: 'Jenkins CI', status: 'FAILURE', description: 'Tests failed'
        //                 throw e
        //             }
        //         }
        //     }
        // }

        // stage('Build') {
        //     steps {
        //         script {
        //             try {
        //                 bat 'npm run build'
        //                 githubNotify context: 'Jenkins CI', status: 'SUCCESS', description: 'Build succeeded'
        //             } catch (Exception e) {
        //                 githubNotify context: 'Jenkins CI', status: 'FAILURE', description: 'Build failed'
        //                 throw e
        //             }
        //         }
        //     }
        // }
    }

    post {
        success {
            script {
                githubNotify context: 'Jenkins CI', status: 'SUCCESS', description: 'Pipeline completed successfully'
            }
        }

        failure {
            script {
                githubNotify context: 'Jenkins CI', status: 'FAILURE', description: 'Pipeline failed! Blocking merge request.'
                error("Pipeline failed! Blocking merge request.")
            }
        }
    }
}
