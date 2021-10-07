pipeline {
    agent any

    stages {
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
        stage('Encypt private ssl certificates') {
            steps {
                sh (script: """
                    ansible-vault encrypt --vault-password-file ~/.vault_password temp_ssl_backup_`date +%F`/test_certs_import/*/privkey.pem
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