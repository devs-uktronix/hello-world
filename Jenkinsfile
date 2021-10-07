pipeline {
    agent any

    stages {
        stage('Copy ssl certificates from bastion.core') {
            steps {
                sh (script: """
                    # Create a working dir
                    sh sync_certs.sh
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
                    ansible-vault encrypt --vault-password-file ~/.vault_password /tmp/temp_ssl_backup_`date +%F`/test_certs_import/*/privkey.pem
                    """
                )
            }
            post {
                success {
                    echo "ssl certifactes have been ansible-encrypted successfully 😀"
                }
                failure {
                    echo "Could not ansible-encrypt ssl certifactes 😟 "
                }
            }         
        }

        stage('Clone main repo and upload new encrypted certs') {
            steps {
                sh (script: """
                    # remove the repo is it exists
                    git checkout -b ssl_certs_renew_branch_`date +%F`
                    rsync -Paz /tmp/temp_ssl_backup_`date +%F`/test_certs_import/ ansible/files/ssl_certs/
                    git status
                    git add .
                    """
                )
            }
            post {
                success {
                    echo "ssl certifactes have been pushed to the repoitory successfully 😀"
                }
                failure {
                    echo "Unable to push the new ssl certifactes to the repoitory 😟 "
                }
            }         
        }
    }
}