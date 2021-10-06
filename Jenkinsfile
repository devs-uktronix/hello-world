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
                sh 'docker images -a'
                sh 'docker run hello-world'
                sh 'docker images -a'

            }
        }
    }
}
