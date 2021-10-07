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

                    #
                    ls
                    # ansible-vault encrypt --vault-password-file ~/.vault_password test_certs_import/*/privkey.pem
                    # #ansible-vault decrypt --vault-password-file ~/.vault_password test_certs_import/*/privkey.pem
                    
                    # rm -fr hello-world
                    # git clone https://github.com/devs-uktronix/hello-world.git
                    # cd hello-world
                    # git checkout -b ssl_certs_renew_branch_`date +%F`
                    # rsync -Paz ../test_certs_import/ ansible/files/ssl_certs/
                    # git status
                    # git add .
                    # git commit 'upfating latest ssl certs'
                    # git push 
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