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
                    mkdir ssl_backup_`date +%F`
                    pwd
                    ls
                    """
                )
            }
            post {
                success {
                    echo "docker image was spinned successfully 😀"
                }
                failure {
                    echo "Could not run docker image 😟 "
                }
            }            
        }
    }
}