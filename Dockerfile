FROM node:8-alpine
MAINTAINER Sergii Rolskyi <sergii.rolskyi@linux-tricks.net>

ENV CONTAINER_TIMEZONE Europe/Berlin 

RUN apk update && apk add tzdata && apk add curl && apk add wget && apk add vim && apk add bash &&\ 
    cp /usr/share/zoneinfo/${CONTAINER_TIMEZONE} /etc/localtime &&\ 
    echo "${CONTAINER_TIMEZONE}" > /etc/timezone &&\ 
    apk del tzdata && rm -rf /var/cache/apk/*

CMD chown root:root /etc/crontabs/root && /usr/sbin/crond -f
