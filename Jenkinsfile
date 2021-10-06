pipeline {
    agent any

    stages {
        stage('Verify branch') {
            steps {
                echo "$GIT_BRANCH"
            }
        }
        post {
            success {
                echo "Branch was retrieved successfully"
            }
            failure {
                echo "There is no git branch"
            }
        }
        stage('Docker build') {
            steps {
                sh (script: """
                docker images -a
                docker run hello-world
                docker images -a
                """)
            }
        }
    }
}
