FROM node:8-alpine
MAINTAINER Sergii Rolskyi <sergii.rolskyi@linux-tricks.net>

ENV TZ Europe/Berlin 

RUN apk update && apk add tzdata && apk add curl && apk add wget && apk add vim && apk add bash &&\ 
    cp /usr/share/zoneinfo/${TZ} /etc/localtime &&\ 
    echo "${TZ}" > /etc/timezone &&\ 
    apk del tzdata && rm -rf /var/cache/apk/*

CMD chown root:root /etc/crontabs/root && /usr/sbin/crond -f
