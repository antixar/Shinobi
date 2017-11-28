#!/bin/sh
set -e

# while [ 1 == 1 ]; do sleep 1; done 

WORK_DIR=/opt/shinobi

sed -i "s#MYSQL_USER#${MYSQL_USER}#g" ${WORK_DIR}/conf.json
sed -i "s#MYSQL_PASSWORD#${MYSQL_PASSWORD}#g" ${WORK_DIR}/conf.json
sed -i "s#MYSQL_DATABASE#${MYSQL_DATABASE}#g" ${WORK_DIR}/conf.json
sed -i "s#MYSQL_HOST#${MYSQL_HOST}#g" ${WORK_DIR}/conf.json



# cp /opt/shinobi/conf.sample.json /opt/shinobi/conf.json
# cp /opt/shinobi/super.sample.json /opt/shinobi/super.json
# cp /opt/shinobi/plugins/motion/conf.sample.json /opt/shinobi/plugins/motion/conf.json



# # Set the admin password
# sed -i -e "s/21232f297a57a5a743894a0e4a801fc3/${ADMIN_PASSWORD_MD5}/" "/opt/shinobi/super.json"


# Execute Command

node ${WORK_DIR}/$@
