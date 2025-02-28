pipeline {
    agent any
    triggers {
        githubPullRequests {
            allowMembersOfWhitelistedOrgsAsAdmin(true)
        }
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Lint & Test') {
            steps {
                sh 'npm install'
                // sh 'npm run lint'
                // sh 'npm test'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
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
    def githubToken = credentials('GITHUB_TOKEN') // Thêm token vào Jenkins Credentials

    sh """
    curl -X POST -H "Authorization: token ${githubToken}" \\
         -H "Accept: application/vnd.github.v3+json" \\
         https://api.github.com/repos/user/repo/statuses/${commitSha} \\
         -d '{
             "state": "${state}",
             "target_url": "http://your-jenkins-url/job/${JOB_NAME}/${BUILD_NUMBER}/",
             "description": "${description}",
             "context": "jenkins-ci"
         }'
    """
}
