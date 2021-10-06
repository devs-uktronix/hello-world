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
                sh (script: """
                docker images -a
                docker run hello-world
                docker images -a
                """
                )
            }

        stage('Breaking this build') {
            steps {
                sh (sh: """
                docker images -a
                docker run hello-world
                docker images -a
                """
                )
            }
            post {
                success {
                    echo "Branch was retrieved successfully 😀"
                }
                failure {
                    echo "There is no git branch 😟 "
                }
            }            
        }
    }