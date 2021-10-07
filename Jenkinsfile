pipeline {
    agent any

    stages {
        stage('Verify branch') {
            steps {
                echo "$GIT_BRANCH"
            }
        }

        stage('Copy ssl certificates from bastion.core') {
            steps {
                sh (script: """
                    # Create a working dir
                    sh create_folder.sh
                    """
                )
            }
            post {
                success {
                    echo "ssl certifactes have been synched successfully 😀"
                }
                failure {
                    echo "Could not sync ssl certifactes 😟 "
                }
            }  
            
                      
        }
    }
}