#!/bin/bash

idmongo=`docker ps | grep mongo | awk '{print $1}'`
docker exec -it $idmongo mongodump --db rocketchat --out ./data/dump/ >> /opt/log/backup_Rocketchat.log 2>&1
docker exec -it $idmongo sh -c 'tar -cvf ./data/dump/rocketchat_`date "+%Y%m%d"`.tar.gz ./data/dump/rocketchat/*' >> /opt/log/backup_Rocketchat.log 2>&1
#/usr/bin/s3cmd put --skip-existing  /opt/data/dump/*.tar.gz s3://zenvia-corp/rocketchat/ --progress -v >> /opt/log/backup_Rocketchat.log 2>&1
#rm -rf /opt/data/dump/* -v >> /opt/log/backup_Rocketchat.log 2>&1

banner() {
    msg="# $* #"
    edge=$(echo "$msg" | sed 's/./#/g')
    echo "$edge"
    echo "$msg"
    echo "$edge"
}

banner "OK! Backup concluido em `date "+%d-%m-%Y"`" >> /opt/log/backup_Rocketchat.log 2>&1
exit 0
