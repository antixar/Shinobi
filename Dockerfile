FROM node:8.9.1-alpine

EXPOSE 80

VOLUME ["/opt/shinobi/videos"]

RUN apk add --update --no-cache ffmpeg python pkgconfig cairo-dev make g++ jpeg-dev
WORKDIR /opt/shinobi

ENV MYSQL_USER "shinobi"
ENV MYSQL_PASSWORD "shinobi"
ENV MYSQL_DATABASE "shinobi"
ENV MYSQL_HOST "127.0.0.1"


ADD ./package.json /tmp/package.json
RUN cd /tmp && npm install && npm install canvas
RUN mkdir -p /opt/shinobi && cp -a /tmp/node_modules /opt/shinobi/





ADD ./server /opt/shinobi

RUN cp /opt/shinobi/conf_sample.json /opt/shinobi/conf.json
RUN cp /opt/shinobi/plugins/motion/conf_sample.json /opt/shinobi/plugins/motion/conf.json
RUN cp /opt/shinobi/plugins/opencv/conf_sample.json /opt/shinobi/plugins/opencv/conf.json

RUN RUNDOM_CRON=`date +%s | sha256sum | base64 | head -c 32 ; echo`; sleep 1; \
    RUNDOM_MOTION=`date +%s | sha256sum | base64 | head -c 32 ; echo`; sleep 1; \
    RUNDOM_OPENCV=`date +%s | sha256sum | base64 | head -c 32 ; echo` \
    && sed -i "s#RUNDOM_MOTION#${RUNDOM_MOTION}#g" /opt/shinobi/plugins/motion/conf.json \
    && sed -i "s#RUNDOM_OPENCV#${RUNDOM_OPENCV}#g" /opt/shinobi/plugins/opencv/conf.json \
    && sed -i "s#RUNDOM_OPENCV#${RUNDOM_OPENCV}#g" /opt/shinobi/conf.json \
    && sed -i "s#RUNDOM_MOTION#${RUNDOM_MOTION}#g" /opt/shinobi/conf.json \
    && sed -i "s#RUNDOM_CRON#${RUNDOM_CRON}#g"     /opt/shinobi/conf.json

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
