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
                    mkdir -p ssl_backup_`date +%F`
                    pwd
                    ls
                    cd ssl_backup_`date +%F`
                    #rsync -e "ssh -i /var/lib/jenkins/workspace/Hello_World_Pipeline_add-tests/id_ed25519" -Paz redwan@10.10.10.11:/home/redwan/fake_ssl/test_certs_import .
                    ls
                    #ansible-vault encrypt --vault-password-file ~/.vault_password test_certs_import/devimage.jupix.co.uk/privkey.pem
                    ansible-vault decrypt --vault-password-file ~/.vault_password test_certs_import/devimage.jupix.co.uk/privkey.pem
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