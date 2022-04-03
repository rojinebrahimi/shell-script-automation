#!/bin/bash

MYSQL_ROOT="root"
MYSQL_PASS="password"
timestamp=$(date +%d-%m-%Y_%H-%M-%S)

database="db1 db2 db3"
cd /backup
rm -rf *
mkdir `date +%Y-%m-%d` && cd `date +%Y-%m-%d`

for db in $database
do
    mysqldump -u$MYSQL_ROOT -p$MYSQL_PASS $db --single-transaction > $db.sql
    if [ -f $db.sql ]; then
        echo $timestamp "- Backup For" $db "Finished Successfully!" >> /var/log/db_backup/backup_status.log
    fi

done 

chown -R user:user /backup/`date +%Y-%m-%d`

sshpass -p 'user_password'  scp -P 22 -r /backup/`date +%Y-%m-%d` user@address:/data/backup
