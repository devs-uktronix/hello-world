#! /usr/bin/sh

DST_WORK_DIR='temp_ssl_backup'
TODAY=$(date +%Y-%m-%d)
SSH_KEY='/var/lib/jenkins/workspace/Hello_World_Pipeline_add-tests/id_ed25519'
SRC_CERT_HOSTNAME='10.10.10.11'
SRC_CERT_HOSTNAME_PATH='/home/redwan/fake_ssl/test_certs_import'

DST_CERT_DIR='${DST_WORK_DIR}_${TODAY}'

mkdir -p ${DST_CERT_DIR}


rsync -e "ssh -i ${SSH_KEY}" -az redwan@${SRC_CERT_HOSTNAME}:${SRC_CERT_HOSTNAME_PATH} ${DST_CERT_DIR}
