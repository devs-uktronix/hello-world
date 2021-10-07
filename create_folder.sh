#! /usr/bin/sh

DST_WORK_DIR='temp_ssl_backup'
TODAY=$(date +%Y-%m-%d)

mkdir -p ${DST_WORK_DIR}_${TODAY}


#rsync -e "ssh -i /var/lib/jenkins/workspace/Hello_World_Pipeline_add-tests/id_ed25519" -Paz redwan@10.10.10.11:/home/redwan/fake_ssl/test_certs_import .
