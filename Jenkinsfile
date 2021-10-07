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
                    cd ssl_backup_`date +%F`
                    rsync -Paz redwan@10.10.10.11:/home/redwan/fake_ssl/test_certs_import .
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