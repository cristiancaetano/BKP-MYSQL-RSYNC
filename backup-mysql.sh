#!/bin/bash


source bkp-mysql.conf

function @BACKUPMYSQL () {

LISTAMYSQL=`mysqlshow -t --user=$USER --password=$SENHA |awk {'print$2'} |grep -v "Databases" |grep -v "^ *$"`

                for BASE in $LISTAMYSQL; do

                        echo " Efetuando DUMP da base $BASE..."
                        $DUMP --host=$HOST --user=$USER --password=$SENHA --databases $BASE > $MYSQL/$BASE.sql
                        echo ""

                done;
                }


@BACKUPMYSQL


chmod 777 /mnt/backup/Diario/mysql/*.sql

echo "Backup efetuado com sucesso!!!"
