pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Lint & Test') {
            steps {
                bat 'npm install'
            }
        }
        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }
    }
    post {
        success {
            script {
                updateGitHubStatus('success', 'Build successful')
            }
        }
        failure {
            script {
                updateGitHubStatus('failure', 'Build failed')
            }
        }
    }
}

def updateGitHubStatus(String state, String description) {
    def commitSha = env.GIT_COMMIT
    def githubToken = credentials('GITHUB_TOKEN') // Đảm bảo đã thêm token vào Jenkins Credentials

    bat """
    curl -X POST -H "Authorization: token ${githubToken}" ^
         -H "Accept: application/vnd.github.v3+json" ^
         -d "{\\"state\\": \\"${state}\\", \\"target_url\\": \\"http://your-jenkins-url/job/${JOB_NAME}/${BUILD_NUMBER}/\\", \\"description\\": \\"${description}\\", \\"context\\": \\"jenkins-ci\\"}" ^
         https://api.github.com/repos/user/repo/statuses/${commitSha}
    """
}
