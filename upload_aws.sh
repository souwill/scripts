#!/bin/bash

/usr/bin/s3cmd put --skip-existing /tmp/*.tar.gz s3://zenvia-infracorp-backup/accounts/gmail/ --progress -v >> /tmp/output.log 2>&1
rm -rf /tmp/*.tar.gz -v >> /tmp/output.log 2>&1

banner() {
    msg="# $* #"
    edge=$(echo "$msg" | sed 's/./#/g')
    echo "$edge"
    echo "$msg"
    echo "$edge"
}

banner "OK! Backup concluido em `date "+%d-%m-%Y"`" >> /tmp/output.log 2>&1
exit 0
