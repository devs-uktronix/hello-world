pipeline {
    agent any

    stages {
        stage('Verify branch') {
            steps {
                echo "$GIT_BRANCH"
            }
        }

        stage('Docker build') {
            steps {
                sh (sh: """
                docker images -a
                docker run hello-world
                docker images -a
                """)
            }
        }
    }
}
