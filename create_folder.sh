#! /usr/bin/sh

DST_WORK_DIR='temp_ssl_backup_`date +%F`'


mkdir -p ${DST_WORK_DIR}


#rsync -e "ssh -i /var/lib/jenkins/workspace/Hello_World_Pipeline_add-tests/id_ed25519" -Paz redwan@10.10.10.11:/home/redwan/fake_ssl/test_certs_import .
